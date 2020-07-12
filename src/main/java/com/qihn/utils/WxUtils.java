package com.qihn.utils;


import com.qihn.controller.WxController;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class WxUtils {
    private static Log log = LogFactory.getLog(WxUtils.class);
    public static String geToken(){
        String cachetoken = (String)CacheUtil.get("wxtoken");
        log.info("cachetoken: "+ cachetoken);
        if(Utils.isNotNullOrEmpty(cachetoken)){
            return cachetoken;
        }
        StringBuffer sb = new StringBuffer();
        sb.append(Utils.getProperty("meappid"));
        sb.append("&secret=").append(Utils.getProperty("mesecret"));
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+sb.toString();
        log.info("url: "+ url);
        String res = HttpUtil.sendGet(url);
        log.info("res: "+ res);
        JSONObject json = new JSONObject(res);
        CacheUtil.put("wxtoken",json.getString("access_token"));
        return json.getString("access_token");

    }

    public static boolean imgSecCheck(String imgurl){
        if(Utils.isNullorEmpty(imgurl)){
            return true;
        }
        String token = geToken();
        String url = "https://api.weixin.qq.com/wxa/img_sec_check?access_token="+token;

        Map<String, String> fileMap = new HashMap<>();
        fileMap.put("1",Utils.getProperty("basefilepath")+ File.separator+imgurl);
        //fileMap.put("1",imgurl);
        String res = HttpUtil.formUpload(url,null,fileMap);
        System.out.println("imgSecCheck-res:"+res);
        if(new JSONObject(res).getInt("errcode")==0){
            return true;
        }
        return false;

    }
    public static boolean msgSecCheck(String msg){
        String token = geToken();
        String url = "https://api.weixin.qq.com/wxa/msg_sec_check?access_token="+token;
        JSONObject json = new JSONObject();
        json.put("content",msg);
        String res = HttpUtil.postJson(url,json.toString());
        System.out.println("msgSecCheck-res:"+res);
        if(new JSONObject(res).getInt("errcode")==0){
            return true;
        }
        return false;

    }

    public static void main(String args[]){
        String imgurl2="https://jd.yousheng.tech/qihntest/download?filename=2020-07-12/tmp_f37cc74ebbd72129780d08a66d6311a7a3a920c4b601dae1.jpg";
        String imgurl="badaling.jpg";
        imgSecCheck(imgurl);
        String msg = "习大大";
        boolean res = msgSecCheck(msg);
        System.out.println(res);

    }

    /**
     * 上传二进制文件
     * @param graphurl 接口地址
     * @param file 图片文件
     * @return
     */
    public static String uploadFile(String graphurl, MultipartFile file) {
        String line = null;//接口返回的结果
        try {
            // 换行符
            final String newLine = "\r\n";
            final String boundaryPrefix = "--";
            // 定义数据分隔线
            String BOUNDARY = "========7d4a6d158c9";
            // 服务器的域名
            URL url = new URL(graphurl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // 设置为POST情
            conn.setRequestMethod("POST");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            // 设置请求头参数
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("Charsert", "UTF-8");
            conn.setRequestProperty("Content-Type","multipart/form-data; boundary=" + BOUNDARY);
            conn.setRequestProperty("User-Agent","Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1");
            OutputStream out = new DataOutputStream(conn.getOutputStream());

            // 上传文件
            StringBuilder sb = new StringBuilder();
            sb.append(boundaryPrefix);
            sb.append(BOUNDARY);
            sb.append(newLine);
            // 文件参数,photo参数名可以随意修改
            sb.append("Content-Disposition: form-data;name=\"image\";filename=\""
                    + "https://api.weixin.qq.com" + "\"" + newLine);
            sb.append("Content-Type:application/octet-stream");
            // 参数头设置完以后需要两个换行，然后才是参数内容
            sb.append(newLine);
            sb.append(newLine);

            // 将参数头的数据写入到输出流中
            out.write(sb.toString().getBytes());

            // 读取文件数据
            out.write(file.getBytes());
            // 最后添加换行
            out.write(newLine.getBytes());

            // 定义最后数据分隔线，即--加上BOUNDARY再加上--。
            byte[] end_data = (newLine + boundaryPrefix + BOUNDARY
                    + boundaryPrefix + newLine).getBytes();
            // 写上结尾标识
            out.write(end_data);
            out.flush();
            out.close();
            // 定义BufferedReader输入流来读取URL的响应
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream()));
            while ((line = reader.readLine()) != null) {
                return line;
            }
        } catch (Exception e) {
            System.out.println("发送POST请求出现异常！" + e);
        }
        return line;
    }


}
