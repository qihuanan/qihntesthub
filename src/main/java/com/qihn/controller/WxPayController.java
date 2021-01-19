package com.qihn.controller;

import com.qihn.utils.HttpUtil;
import com.qihn.utils.JSONUtils;
import com.qihn.utils.PayUtil;
import com.qihn.utils.Utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

@Controller
public class WxPayController extends BaseController{
    private static Log log = LogFactory.getLog(WxPayController.class);
    public static final String TOKEN = "qihn";

    /**
     * 调用微信支付统一下单接口，获取prepay_id等信息
     * 获取到prepay_id后，向前台发送wx.requestPayment所需参数

     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/wxpay/unorder", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject uniOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String order_code = getParam("order_code");
        Double pay_money = Double.valueOf(getParam("order_code"));
        String openid = getParam("order_code");


        //微信支付统一下单接口用的参数先存放在Map中
        Map<String, String> map = new HashMap<>();
        map.put("appid", Utils.getProperty("appid"));
        map.put("mch_id", "1605166258");
        //用户标识 openid
        map.put("openid", openid);
        //订单编号
        map.put("out_trade_no", order_code);
        //订单支付金额，单位为分 String.valueOf((int)(pay_money * 100))
        map.put("total_fee", String.valueOf((int)(pay_money * 100)));

        xcxUnifieldOrder("202101200001",1,"ss");

        return null;
    }

     public static void main(String args[]){
        try {
            //WxPayController.xcxUnifieldOrder("202101200001",1,"ss");

        }catch (Exception e){
            e.printStackTrace();;
        }


}

    /**
     * 小程序支付统一下单
     */
    public  Map<String,String> xcxUnifieldOrder(String orderNum, double payAmount,String openid) throws Exception{
        //封装参数
        SortedMap<String,Object> paramMap = new TreeMap<String,Object>();
        paramMap.put("appid", Utils.getProperty("appid"));
        //wxb396476de17508d4
        paramMap.put("appid", Utils.getProperty("wxb396476de17508d4"));
        paramMap.put("mch_id", "1605166258");
        paramMap.put("nonce_str", PayUtil.makeUUID(32));
        paramMap.put("description", "xmf-包月支付");
        paramMap.put("out_trade_no", orderNum);
        //paramMap.put("total_fee", PayUtil.moneyToIntegerStr(payAmount));
        //paramMap.put("spbill_create_ip", PayUtil.getLocalIp());
        //paramMap.put("notify_url", this.getNotifyUrl());
        paramMap.put("notify_url", "https://xx.com/test");
        Map<String,Object> amount = new HashMap<>();
        amount.put("total",1);
        amount.put("currency","CNY");
        paramMap.put("amount",amount);

        Map<String,Object> payer = new HashMap<>();
        amount.put("openid","oHq_k5La6tz61XQFaPq2jwiHYdMI");

        paramMap.put("payer",payer);

        //paramMap.put("trade_type", tradeType);
        //paramMap.put("openid",openid);
        //paramMap.put("sign", PayUtil.createSign(paramMap,PayConfig.XCX_KEY));
        //转换为xml
        //String xmlData = PayUtil.mapToXml(paramMap);
        //请求微信后台，获取预支付ID
        //String resXml = HttpUtils.postData(PayConfig.WX_PAY_UNIFIED_ORDER, xmlData);
        String res = HttpUtil.postJson("https://api.mch.weixin.qq.com/v3/pay/transactions/jsapi", JSONUtils.toJSON(paramMap));
        log.info("【小程序支付】 统一下单响应：\n"+res);

        return  null;
        //return PayUtil.xmlStrToMap(resXml);
    }

    private String getNotifyUrl(){
        //服务域名
        return  "https://xxx.com/wxapp/payment/xcxNotify";
    }


}
