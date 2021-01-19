package com.qihn.utils;

import org.apache.commons.lang.ArrayUtils;
import org.apache.http.*;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.conn.PoolingClientConnectionManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;

public class HttpClientUtils {
    private static final Logger LOG = LoggerFactory.getLogger(HttpClientUtils.class);

    /**
     */
    public static final String HTTP_CLIENT_ERROR = "ERROR";

    private static final DefaultHttpClient httpClient = newHttpClient();

    private static final DefaultHttpClient newHttpClient() {
        HttpParams params = new BasicHttpParams();
        Integer CONNECTION_TIMEOUT = 3 * 1000;
        Integer SO_TIMEOUT = 5 * 1000;
        Long CONN_MANAGER_TIMEOUT = 1L * 1000;
        params.setIntParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, CONNECTION_TIMEOUT);
        params.setIntParameter(CoreConnectionPNames.SO_TIMEOUT, SO_TIMEOUT);

        params.setBooleanParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, false);
        params.setBooleanParameter(ClientPNames.HANDLE_REDIRECTS, false);
        params.setBooleanParameter(CoreConnectionPNames.STALE_CONNECTION_CHECK, true);
        params.setLongParameter(ClientPNames.CONN_MANAGER_TIMEOUT, CONN_MANAGER_TIMEOUT);
        PoolingClientConnectionManager conMgr = new PoolingClientConnectionManager();
        conMgr.setMaxTotal(1000);
        conMgr.setDefaultMaxPerRoute(conMgr.getMaxTotal() / 5);

        conMgr.getSchemeRegistry().register(new Scheme("http", 80, PlainSocketFactory.getSocketFactory()));
        conMgr.getSchemeRegistry().register(new Scheme("https", 443, SSLSocketFactory.getSocketFactory()));
        DefaultHttpClient httpClient = new DefaultHttpClient(conMgr, params);
        httpClient.setHttpRequestRetryHandler(new DefaultHttpRequestRetryHandler(3, true));
        return httpClient;
    }

    /**
     *
     * @param url
     * @param data
     * @return
     */
    public static String postDataToUri(String url, List<NameValuePair> data) {
        return postDataToUri(url, data, (Header[]) null);
    }

    /**
     *
     * @param url
     * @param data
     * @param encoding
     * @return
     */
    public static String postDataToUri(String url, List<NameValuePair> data, String encoding) {
        return postDataToUri(url, data, null, encoding);
    }

    /**
     *
     * @param url
     * @param data
     * @return
     */
    public static String postDataToUri(String url, List<NameValuePair> data, Header[] headers) {
        return postDataToUri(url, data, headers, null);
    }

    /**
     *
     * @param url
     * @param data
     * @param encoding
     * @return
     */
    public static String postDataToUri(String url, List<NameValuePair> data, Header[] headers, String encoding) {
        HttpResponse response = null;
        try {
            HttpPost post = new HttpPost(url);
            if(org.apache.commons.lang.StringUtils.isBlank(encoding)) {
                encoding = "UTF-8";
            }
            post.setHeader("Accept-Charset", encoding);
            if (data!=null) {
                post.setEntity(new UrlEncodedFormEntity(data, encoding));
            }
            if (ArrayUtils.isNotEmpty(headers)) {
                post.setHeaders(headers);
            }
            response = httpClient.execute(post);
            if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
                return HTTP_CLIENT_ERROR;
            }
            return EntityUtils.toString(response.getEntity(), Charset.forName(encoding));
        } catch (Exception ex) {
            ex.printStackTrace();
            if (response != null) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
            }
            return HTTP_CLIENT_ERROR;

        }
    }

    /**
     *
     * @param url
     * @param paramsStr
     * @return
     */
    public static String postDataToUri(String url, String paramsStr) {
        return postDataToUri(url, paramsStr, (Header[]) null);
    }

    /**
     *
     * @param url
     * @param paramsStr
     * @param encoding
     * @return
     */
    public static String postDataToUri(String url, String paramsStr, String encoding) {
        return postDataToUri(url, paramsStr, null, encoding);
    }

    /**
     *
     * @param url
     * @param paramsStr
     * @param headers
     * @return
     */
    public static String postDataToUri(String url,  String paramsStr, Header[] headers) {
        return postDataToUri(url, paramsStr, headers, null);
    }

    
    /**
     *
     * @param url
     * @param paramsStr
     * @param headers
     * @param encoding
     * @return
     */
    public static String postDataToUri(String url, String paramsStr, Header[] headers, String encoding) {
        HttpResponse response = null;
        try {
            HttpPost post = new HttpPost(url);
            if(org.apache.commons.lang.StringUtils.isBlank(encoding)) {
                encoding = "UTF-8";
            }
            post.setHeader("Accept-Charset", encoding);

            if (ArrayUtils.isNotEmpty(headers)) {
                post.setHeaders(headers);
            }
            if(paramsStr!=null){
                post.setEntity(new StringEntity(paramsStr));
            }


            response = httpClient.execute(post);
            if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {

                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
                return HTTP_CLIENT_ERROR;
            }
            return EntityUtils.toString(response.getEntity(), Charset.forName(encoding));
        } catch (Exception ex) {
            ex.printStackTrace();
            if (response != null) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
            }
            return HTTP_CLIENT_ERROR;

        }
    }
    
    
    public static String getDataFromUri(String url, String encoding) {
        return getDataFromUriWithAuth(url, encoding, null);
    }

    public static String getDataFromUri(String url, String encoding, Header[] headers, Integer timeout) {
        return getDataFromUriWithAuth(url, encoding, null, headers, timeout);
    }

    public static String getDataFromUriWithAuth(String url, String encoding, String authorizationCode) {
        return getDataFromUriWithAuth(url, encoding, authorizationCode, null);
    }

    public static String getDataFromUriWithAuth(String url, String encoding, String authorizationCode, Header[] headers) {
        return getDataFromUriWithAuth(url, encoding, authorizationCode, headers, null);
    }

    public static String getDataFromUriWithAuth(String url, String encoding, String authorizationCode, Header[] headers, Integer timeout) {
        HttpResponse response = null;
        StatusLine statusLine = null;
        Header[] respHeaders = null;
        try {
            HttpGet httpGet = new HttpGet(url);
            if (ArrayUtils.isNotEmpty(headers)) {
                httpGet.setHeaders(headers);
            }
            if(org.apache.commons.lang.StringUtils.isBlank(encoding)) {
                encoding = "UTF-8";
            }
            if(timeout != null) {
                httpGet.getParams().setIntParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, timeout / 3);
                httpGet.getParams().setIntParameter(CoreConnectionPNames.SO_TIMEOUT, timeout);
            }
            httpGet.setHeader("Accept-Charset", encoding);
            httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36");
            if (org.apache.commons.lang.StringUtils.isNotBlank(authorizationCode)) {
                httpGet.addHeader("Authorization", authorizationCode);
            }
            response = httpClient.execute(httpGet);
            statusLine = response.getStatusLine();
            respHeaders = response.getAllHeaders();
            if (statusLine.getStatusCode() != HttpStatus.SC_OK) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
                return HTTP_CLIENT_ERROR;
            }
            return EntityUtils.toString(response.getEntity(), Charset.forName(encoding));
        } catch (Exception ex) {
            if(response != null) {
                respHeaders =response.getAllHeaders();
            }
            if (response != null) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
            }
            return HTTP_CLIENT_ERROR;
        }
    }

    public static String getDataFromUriByHost(String url, String encoding, String host) throws Exception{
        HttpResponse response = null;
        try {
            HttpParams params = new BasicHttpParams();
            params.setParameter(ClientPNames.HANDLE_REDIRECTS, false);
            if(host != null && !host.isEmpty()) {
                HttpHost httpHost = new HttpHost(host,80);
                params.setParameter(ClientPNames.VIRTUAL_HOST, httpHost);
            }
            HttpGet httpGet = new HttpGet(url);
            httpGet.setHeader("Accept-Charset", encoding);
            httpGet.setParams(params);
            response = httpClient.execute(httpGet);
            int state = response.getStatusLine().getStatusCode();
            if (state != HttpStatus.SC_OK) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
                LOG.error("Get Data Failure: " + response.getStatusLine());
                throw new Exception("http return state="+state);
            }

            return EntityUtils.toString(response.getEntity(), Charset.forName(encoding));
        } catch (Exception ex) {
            if (response != null) {
                try {
                    EntityUtils.consume(response.getEntity());
                } catch (IOException e1) {
                }
            }
            LOG.error("Get Data Exception: " + ex);
            throw ex;
        }
    }

    public static DefaultHttpClient getHttpClient() {
        return httpClient;
    }
}