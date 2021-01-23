package com.qihn.controller.wxpay;

import com.google.gson.JsonObject;
import com.qihn.controller.BaseController;
import com.qihn.controller.WxPayController;
import com.qihn.utils.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

@Controller
public class WxpayController  extends BaseController {
    private static Log log = LogFactory.getLog(WxpayController.class);
    public static final String TOKEN = "qihn";




    @RequestMapping("/wx/wxPay")
    @ResponseBody
    public Object wxPay( HttpServletRequest request){
        String openid = getParam("openid");
        String pname = getParam("pname");
        String money = getParam("money");
        pname = "xmf-"+pname;
        try{
            //生成的随机字符串
            String nonce_str = WxPayConfig.getRandomStringByLength(32);
            //商品名称
            String body2 = pname;
            String body = pname;
            body = new String(body.getBytes("ISO-8859-1"),"UTF-8");
            //body = new String(body.getBytes("UTF-8"),"UTF-8");
            //获取本机的ip地址
            String spbill_create_ip = WxPayConfig.getIpAddr(request);

            String orderNo = Utils.formatCompactDateSSS();
            //String money = "1";//支付金额，单位：分，这边需要转成字符串类型，否则后面的签名会失败

            TreeMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("appid", WxPayConfig.appid);
            packageParams.put("mch_id", WxPayConfig.mch_id);
            packageParams.put("nonce_str", nonce_str);
            packageParams.put("body", body);
            packageParams.put("out_trade_no", orderNo);//商户订单号
            packageParams.put("total_fee", money);//支付金额，这边需要转成字符串类型，否则后面的签名会失败
            packageParams.put("spbill_create_ip", spbill_create_ip);
            packageParams.put("notify_url", WxPayConfig.notify_url);
            packageParams.put("trade_type", WxPayConfig.TRADETYPE);
            packageParams.put("openid", openid);

            // 除去数组中的空值和签名参数
            //packageParams = PayUtil.paraFilter(packageParams);
            //String prestr = PayUtil.createLinkString(packageParams); // 把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串

            //MD5运算生成签名，这里是第一次签名，用于调用统一下单接口
            String mysign = PayUtil.createSign(packageParams, WxPayConfig.key).toUpperCase();
            log.info("=======================第一次签名：" + mysign + "=====================");

            //拼接统一下单接口使用的xml数据，要将上一步生成的签名一起拼接进去
            String xml = "<xml>" + "<appid>" + WxPayConfig.appid + "</appid>"
                    + "<body><![CDATA[" + body2 + "]]></body>"
                    + "<mch_id>" + WxPayConfig.mch_id + "</mch_id>"
                    + "<nonce_str>" + nonce_str + "</nonce_str>"
                    + "<notify_url>" + WxPayConfig.notify_url + "</notify_url>"
                    + "<openid>" + openid + "</openid>"
                    + "<out_trade_no>" + orderNo + "</out_trade_no>"
                    + "<spbill_create_ip>" + spbill_create_ip + "</spbill_create_ip>"
                    + "<total_fee>" + money + "</total_fee>"
                    + "<trade_type>" + WxPayConfig.TRADETYPE + "</trade_type>"
                    + "<sign>" + mysign + "</sign>"
                    + "</xml>";

            System.out.println("调试模式_统一下单接口 请求XML数据：" + xml);

            //调用统一下单接口，并接受返回的结果
            String result = null; //HttpUtil.sendPost(WxPayConfig.pay_url, xml);
            result = HttpClientUtils.postDataToUri(WxPayConfig.pay_url, xml,"UTF-8");

            System.out.println("调试模式_统一下单接口 返回XML数据：" + result);

            // 将解析结果存储在HashMap中
            Map map = PayUtil.xmlStrToMap(result);

            String return_code = (String) map.get("return_code");//返回状态码

            //返回给移动端需要的参数
            Map<String, Object> response = new HashMap<String, Object>();
            if(return_code == "SUCCESS" || return_code.equals(return_code)){
                // 业务结果
                String prepay_id = (String) map.get("prepay_id");//返回的预付单信息
                response.put("nonceStr", nonce_str);
                response.put("package", "prepay_id=" + prepay_id);
                Long timeStamp = System.currentTimeMillis() / 1000;
                response.put("timeStamp", timeStamp + "");//这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误

                String stringSignTemp = "appId=" + WxPayConfig.appid + "&nonceStr=" + nonce_str + "&package=prepay_id=" + prepay_id+ "&signType=" + WxPayConfig.SIGNTYPE + "&timeStamp=" + timeStamp;
                //再次签名，这个签名用于小程序端调用wx.requesetPayment方法
                String paySign = PayUtil.createSign2(stringSignTemp, WxPayConfig.key).toUpperCase();
                log.info("=======================第二次签名：" + paySign + "=====================");

                response.put("paySign", paySign);
                //更新订单信息
                //业务逻辑代码
            }
            response.put("appid", WxPayConfig.appid);
            response.put("signType", "MD5");

            response.put("out_trade_no", packageParams.get("out_trade_no"));
            response.put("signType", "MD5");
            log.info("res: "+JSONUtils.toJSON(response));

            return JSONUtils.toJSON(response);
        }catch(Exception e){
            e.printStackTrace();

        }
        return null;
    }

    @RequestMapping(value="/wx/wxNotify")
    public void wxNotify(HttpServletRequest request, HttpServletResponse response) throws Exception{
        BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream)request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        br.close();
        //sb为微信返回的xml
        String notityXml = sb.toString();
        String resXml = "";
        System.out.println("接收到的报文：" + notityXml);

        Map map = PayUtil.xmlStrToMap(notityXml);

        String returnCode = (String) map.get("return_code");
        if("SUCCESS".equals(returnCode)){
            //验证签名是否正确
            if(true){
                /**此处添加自己的业务逻辑代码start**/


                /**此处添加自己的业务逻辑代码end**/

                //通知微信服务器已经支付成功
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
            }
        }else{
            resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                    + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
        }
        System.out.println(resXml);
        System.out.println("微信支付回调数据结束");

        BufferedOutputStream out = new BufferedOutputStream(
                response.getOutputStream());
        out.write(resXml.getBytes());
        out.flush();
        out.close();
    }

}