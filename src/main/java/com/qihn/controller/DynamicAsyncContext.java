package com.qihn.controller;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import java.util.Map;
import java.util.concurrent.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class DynamicAsyncContext implements InitializingBean {

    private static final Logger LOG = LoggerFactory.getLogger(DynamicAsyncContext.class);


    //??????????
    private volatile int asyncTimeoutInSeconds = 5;
    //??????????
    private AsyncListener asyncListener;
    //?????С(32-1000) ??????????32 ???1000
    private String poolSize;
    private int keepAliveTimeInSeconds;
    private int queueCapacity;
    ///////////////////////////////////////////////////////////////////////
    private LinkedBlockingDeque<Runnable> queue;
    private ThreadPoolExecutor executor;
    private String localIp;

    @Override
    public void afterPropertiesSet() throws Exception {
        String[] poolSizes = poolSize.split("-");
        //????????С
        int corePoolSize = Integer.valueOf(poolSizes[0]);
        //????????С
        int maximumPoolSize = Integer.valueOf(poolSizes[1]);
        queue = new LinkedBlockingDeque<Runnable>(queueCapacity);
        executor = new ThreadPoolExecutor(
                corePoolSize, maximumPoolSize,
                keepAliveTimeInSeconds, TimeUnit.SECONDS,
                queue);

        executor.allowCoreThreadTimeOut(true);
        executor.setRejectedExecutionHandler(new RejectedExecutionHandler() {
            @Override
            public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
                if(r instanceof CanceledCallable) {
                    CanceledCallable cc = ((CanceledCallable) r);
                    AsyncContext asyncContext = cc.asyncContext;
                    if(asyncContext != null) {
                        try {
                            String uri = (String) asyncContext.getRequest().getAttribute("uri");
                            Map params = (Map) asyncContext.getRequest().getAttribute("params");
                            LOG.error("async request rejected, uri : {}, params : {}", uri, JSONObject.valueToString(params));
                        } catch (Exception e) {}
                        try {
                            HttpServletResponse resp = (HttpServletResponse) asyncContext.getResponse();
                            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        } finally {
                            asyncContext.complete();
                        }
                    }
                }
            }
        });


        if(asyncListener == null) {
            asyncListener = new AsyncListener() {
                @Override
                public void onComplete(AsyncEvent event) throws IOException {
                }

                @Override
                public void onTimeout(AsyncEvent event) throws IOException {
                    AsyncContext asyncContext = event.getAsyncContext();
                    try {
                        String uri = (String) asyncContext.getRequest().getAttribute("uri");
                        Map params = (Map) asyncContext.getRequest().getAttribute("params");
                        LOG.error("async request timeout, uri : {}, params : {}", uri, JSONObject.valueToString(params));
                    } catch (Exception e) {}
                    try {
                        HttpServletResponse resp = (HttpServletResponse) asyncContext.getResponse();
                        resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    } finally {
                        asyncContext.complete();
                    }
                }

                @Override
                public void onError(AsyncEvent event) throws IOException {
                    AsyncContext asyncContext = event.getAsyncContext();
                    try {
                        String uri = (String) asyncContext.getRequest().getAttribute("uri");
                        Map params = (Map) asyncContext.getRequest().getAttribute("params");
                        LOG.error("async request error, uri : {}, params : {}", uri, JSONObject.valueToString(params));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    try {
                        HttpServletResponse resp = (HttpServletResponse) asyncContext.getResponse();
                        resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    } finally {
                        asyncContext.complete();
                    }
                }

                @Override
                public void onStartAsync(AsyncEvent event) throws IOException {

                }
            };
        }

        initLocalIp();
    }

    public void submit(final HttpServletRequest req, final Callable<String> task) {
        req.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
        final String uri = req.getRequestURI();
        final Map<String, String[]> params = req.getParameterMap();
        final AsyncContext asyncContext = req.startAsync();
        asyncContext.getRequest().setAttribute("uri", uri);
        asyncContext.getRequest().setAttribute("params", params);
        asyncContext.setTimeout(asyncTimeoutInSeconds * 1000);
        if(asyncListener != null) {
            asyncContext.addListener(asyncListener);
        }
        executor.submit(new CanceledCallable(asyncContext) {
            @Override
            public Object call() throws Exception {
                HttpServletResponse resp = (HttpServletResponse) asyncContext.getResponse();
                try {
                    String result = task.call();
                    byte[] bytes = new byte[0];
                    if (StringUtils.isBlank(result)) {
                        resp.setContentType("text/html;charset=UTF-8");
                        resp.setContentLength(0);
                    }else{
                        bytes = result.getBytes("UTF-8");
                    }
                    //resp.setBufferSize(bytes.length);
                    resp.setContentType("text/html;charset=UTF-8");
                    if(StringUtils.isNotBlank(localIp)) {
                        resp.setHeader("t.ser", localIp);
                    }
                    resp.setContentLength(bytes.length);
                    resp.getOutputStream().write(bytes);
                } catch (Throwable e) {
                    resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); //???????????
                    LOG.error("get info error, uri : {},  params : {}", uri, JSONObject.valueToString(params));
                } finally {
                    asyncContext.complete();
                }
                return null;
            }
        });
    }

    public Object submit2(final HttpServletRequest req, final Callable<Object> task) {

        req.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
        final String uri = req.getRequestURI();
        final Map<String, String[]> params = req.getParameterMap();
        final AsyncContext asyncContext = req.startAsync();
        asyncContext.getRequest().setAttribute("uri", uri);
        asyncContext.getRequest().setAttribute("params", params);
        asyncContext.setTimeout(asyncTimeoutInSeconds * 1000);
        if(asyncListener != null) {
            asyncContext.addListener(asyncListener);
        }
        return executor.submit(new CanceledCallable(asyncContext) {
            @Override
            public Object call() throws Exception {
                try {
                    Object result = task.call();
                    return result;
                } catch (Throwable e) {
                   e.printStackTrace();
                } finally {
                    asyncContext.complete();
                }
                return null;
            }
        });

    }

    public void submitFuture(final HttpServletRequest req, final Callable<Object> task) {
        req.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
        final String uri = req.getRequestURI();
        final Map<String, String[]> params = req.getParameterMap();
        final AsyncContext asyncContext = req.startAsync();
        asyncContext.getRequest().setAttribute("uri", uri);
        asyncContext.getRequest().setAttribute("params", params);
        asyncContext.setTimeout(asyncTimeoutInSeconds * 1000);
        if(asyncListener != null) {
            asyncContext.addListener(asyncListener);
        }
        executor.submit(new CanceledCallable(asyncContext) {
            @Override
            public Object call() throws Exception {
                Object o = task.call();
                if(o == null) {
                    callBack(asyncContext, o, uri, params);
                }
                if(o instanceof CompletableFuture) {
                    CompletableFuture<Object> future = (CompletableFuture) o;
                    future.thenAccept(resultObject -> callBack(asyncContext, resultObject, uri, params))
                            .exceptionally(e -> {
                                callBack(asyncContext, "", uri, params);
                                return null;
                            });
                } else if(o instanceof String) {
                    callBack(asyncContext, o, uri, params);
                }
                return null;
            }
        });
    }

    private void callBack(AsyncContext asyncContext, Object result, String uri, Map<String, String[]> params) {
        HttpServletResponse resp = (HttpServletResponse) asyncContext.getResponse();
        try {
            if(result instanceof String) {
                write(resp, (String)result);
            } else {
                write(resp, JSONObject.valueToString(result));
            }
        } catch (Throwable e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); //???????????
            try {
                LOG.error("get info error, uri : {},  params : {}", uri, JSONObject.valueToString(params));
            } catch (Exception ex) {
            }
        } finally {
            asyncContext.complete();
        }
    }

    public void write(HttpServletResponse resp, String result) throws Throwable {
        byte[] bytes = new byte[0];
        if (StringUtils.isBlank(result)) {
            resp.setContentType("text/html;charset=UTF-8");
            resp.setContentLength(0);
        } else {
            bytes = result.getBytes("UTF-8");
        }
        //resp.setBufferSize(bytes.length);
        resp.setContentType("text/html;charset=UTF-8");
        if(StringUtils.isNotBlank(localIp)) {
            resp.setHeader("t.ser", localIp);
        }
        resp.setContentLength(bytes.length);
        resp.getOutputStream().write(bytes);
    }

    /**
     * ??IP??????????????ip
     * @return
     */
    public void initLocalIp() {
        String ipStr = null;
        String localip = null;// ????IP????????????????IP?????
        String netip = null;// ????IP
        try {
            Enumeration<NetworkInterface> netInterfaces = NetworkInterface
                    .getNetworkInterfaces();
            InetAddress ip = null;
            boolean finded = false;// ??????????IP
            while (netInterfaces.hasMoreElements() && !finded) {
                NetworkInterface ni = netInterfaces.nextElement();
                Enumeration<InetAddress> address = ni.getInetAddresses();
                while (address.hasMoreElements()) {
                    ip = address.nextElement();
                    if (!ip.isSiteLocalAddress() && !ip.isLoopbackAddress()
                            && ip.getHostAddress().indexOf(":") == -1) {// ????IP
                        netip = ip.getHostAddress();
                        finded = true;
                        break;
                    } else if (ip.isSiteLocalAddress()
                            && !ip.isLoopbackAddress()
                            && ip.getHostAddress().indexOf(":") == -1) {// ????IP
                        localip = ip.getHostAddress();
                    }
                }
            }

            if (StringUtils.isNotBlank(netip)) {
                ipStr = netip;
            } else {
                ipStr = localip;
            }
            if(StringUtils.isNotBlank(ipStr)) {
                Matcher m = Pattern.compile(".*-(\\d+-\\d+)").matcher(ipStr.replaceAll("\\.", "-"));
                if(m.find()) {
                    if(StringUtils.isNotBlank(m.group(1))) {
                        this.localIp = m.group(1);
                    }
                }
            }
        } catch (SocketException e) {
            LOG.error("# get local ip exception", e);
        }
    }

    public void stop() throws Exception {
        executor.shutdown();
        executor.awaitTermination(5, TimeUnit.MINUTES);
    }

    public void setAsyncTimeoutInSeconds(int asyncTimeoutInSeconds) {
        this.asyncTimeoutInSeconds = asyncTimeoutInSeconds;
    }

    public void setAsyncListener(AsyncListener asyncListener) {
        this.asyncListener = asyncListener;
    }

    public void setPoolSize(String poolSize) {
        this.poolSize = poolSize;
    }

    public void setKeepAliveTimeInSeconds(int keepAliveTimeInSeconds) {
        this.keepAliveTimeInSeconds = keepAliveTimeInSeconds;
    }

    public void setQueueCapacity(int queueCapacity) {
        this.queueCapacity = queueCapacity;
    }

    public int getAsyncTimeoutInSeconds() {
        return asyncTimeoutInSeconds;
    }

    public AsyncListener getAsyncListener() {
        return asyncListener;
    }

    public String getPoolSize() {
        return poolSize;
    }

    public int getKeepAliveTimeInSeconds() {
        return keepAliveTimeInSeconds;
    }

    public int getQueueCapacity() {
        return queueCapacity;
    }

    public ThreadPoolExecutor getExecutor() {
        return executor;
    }

    public LinkedBlockingDeque getQueue() {
        return queue;
    }


    private abstract class CanceledCallable<V> implements Callable<V> {
        private AsyncContext asyncContext;

        public CanceledCallable(AsyncContext asyncContext) {
            this.asyncContext = asyncContext;
        }
    }
}
