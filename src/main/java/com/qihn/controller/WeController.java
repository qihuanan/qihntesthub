package com.qihn.controller;

import com.qihn.pojo.*;
import com.qihn.service.*;
import com.qihn.utils.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;


@Controller
public class WeController extends BaseController {
    private static Log log = LogFactory.getLog(WeController.class);
    public static final String TOKEN = "qihn";

    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "weShopService")
    private WeShopService weShopService;
    @Resource(name = "weItemService")
    private WeItemService weItemService;
    @Resource(name = "weCateService")
    private WeCateService weCateService;

    private void inituser(){

    }
    //=========================前端=========================

    @RequestMapping(value = "/we/saveItem",  method = {RequestMethod.GET,RequestMethod.POST})
    public void saveItem(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("weItem") WeItem weItem) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,weItem.getUserid());
        weItem.setUser(user);
        weItem.setWeCate(this.weCateService.findById(WeCate.class,weItem.getWeCateid()));
        weItem.setWeCateName(weItem.getWeCate().getName());
        weItem.setCreatetime(Utils.formatLongDate());
        weItem.setUpdatetime(Utils.formatLongDate());

        WeShop weShop = new WeShop();
        weShop.setUserid(user.getId());
        weShop = this.weShopService.findByProperties(weShop);
        if(Utils.isNullorEmpty(weShop)){
            weShop = new WeShop();
            weShop.setUserid(user.getId());
            weShop.setUser(user);
            weShop.setName(user.getName());
            weShop.setStatus(1);
            weShop.setRemark("自动");
            this.weShopService.save(weShop);
            weShop = this.weShopService.findByProperties(weShop);
        }
        weItem.setWeShop(weShop);
        weItem.setWeShopid(weShop.getId());
        this.weItemService.save(weItem);
        WeItem temp = new WeItem();
        temp.setUserid(weItem.getUserid());
        temp.setUpdatetime(weItem.getUpdatetime());
        weItem = this.weItemService.findByProperties(temp);
        Map map = new HashMap();
        map.put("weItem", weItem);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/we/getItem", method = RequestMethod.GET)
    public void getItem(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("weItem") WeItem weItem,@ModelAttribute("pageInfo") PageInfo pageInfo) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        weItem = this.weItemService.findById(WeItem.class,weItem.getId());
        Map map = new HashMap();
        map.put("weItem", weItem);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/we/getItemList", method = RequestMethod.GET)
    public void getItemList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("weItem") WeItem weItem,@ModelAttribute("pageInfo") PageInfo pageInfo) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<WeItem> weItemList = this.weItemService.findByProperties(weItem,pageInfo,null,"shunxu asc, id","desc");
        //pageInfo.setTotalCount(this.weItemService.countByProperties(weItem));
        Map map = new HashMap();
        map.put("weItemList", weItemList);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/we/login", method = RequestMethod.GET)
    @ResponseBody
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        StringBuffer sb = new StringBuffer("https://api.weixin.qq.com/sns/jscode2session?appid=");
        sb.append(Utils.getProperty("meappid"));
        sb.append("&secret=").append(Utils.getProperty("mesecret"));
        sb.append("&js_code=").append(getParam("code"));
        sb.append("&grant_type=authorization_code");
        log.info("url: "+sb.toString());
        String res = HttpUtil.sendGet(sb.toString());
        log.info("http-wxlogin-res: "+res);

        JSONObject json = new JSONObject(res);
        User user = updateUserinfo(json.getString("openid"),getParam("avatarUrl"),getParam("nickName"));
        /*JSONObject resjson = new JSONObject();
        resjson.put("openid",json.getString("openid"));
        resjson.put("score",user.getScore());
        resjson.put("user",user);
        this.print(resjson);*/
        Map map = new HashMap();
        //map.put("data", JSONUtils.listToJson(lineList));
        map.put("data", user);
        this.printjson(JSONUtils.toJSON(map));
    }

    private User updateUserinfo(String openid,String avatarUrl,String name){

        User user = new User();
        user.setOpenid(openid);
        user = userService.findByProperties(user);
        if(Utils.isNotNullOrEmpty(user) && Utils.isNotNullOrEmpty(user.getId())){
            user.setAvatarUrl(avatarUrl);
            user.setName(name);
            user.setScore(user.getScore());
            userService.update(user);
        }else{
            user = new User();
            user.setOpenid(openid);
            user.setAvatarUrl(avatarUrl);
            user.setScore(100);
            user.setName(name);
            userService.save(user);
        }
        return  user;
    }
    //=======================================前端end=============================

    //======================weItem====================================
    @RequestMapping(value = "/weItem/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView weItemlist(@ModelAttribute("weItem") WeItem weItem, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<WeItem> list = this.weItemService.findByProperties(weItem,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.weItemService.countByProperties(weItem));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("weItem",weItem);
        mv.setViewName("we/weItem/list");
        return mv;

    }
    @RequestMapping(value = "/weItem/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("weItem") WeItem weItem) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(weItem) && Utils.isNotNullOrEmpty(weItem.getId())) {
            weItem = this.weItemService.findByProperties(weItem);
            mv.addObject(weItem);
            mv.setViewName("we/weItem/merge");
        }
        mv.setViewName("we/weItem/merge");
        return mv;
    }

    @RequestMapping(value = "/weItem/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("weItem") WeItem weItem,HttpServletRequest request) throws Exception{
        User user = this.userService.findById(User.class,weItem.getUserid());
        WeShop weShop = this.weShopService.findById(WeShop.class,weItem.getWeShopid());
        WeCate cate = this.weCateService.findById(WeCate.class,weItem.getWeCateid());
        weItem.setUser(user);
        weItem.setWeShop(weShop);
        weItem.setWeCate(cate);
        weItem.setWeCateName(cate.getName());
        if(weItem.getId()==null){
            weItemService.save(weItem);
        }else{
            weItemService.update(weItem);
        }
        return "redirect:/weItem/list?weShopid="+weItem.getWeShopid();
    }

    @RequestMapping(value = "/weItem/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("weItem") WeItem weItem) throws Exception{
        weItem = weItemService.findById(WeItem.class,weItem.getId());
        weItemService.delete(weItem);
        return "redirect:/weItem/list?weShopid="+weItem.getWeShopid();
    }

    //==================================================================

    //===========================weShop begin=======================================
    @RequestMapping(value = "/weShop/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView weShoplist(@ModelAttribute("weShop") WeShop weShop, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<WeShop> list = this.weShopService.findByProperties(weShop,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.weShopService.countByProperties(weShop));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("weShop",weShop);
        mv.setViewName("we/weShop/list");
        return mv;

    }
    @RequestMapping(value = "/weShop/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("weShop") WeShop weShop) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(weShop) && Utils.isNotNullOrEmpty(weShop.getId())) {
            weShop = this.weShopService.findByProperties(weShop);
            mv.addObject(weShop);
            mv.setViewName("weShop/merge");
        }
        mv.setViewName("we/weShop/merge");
        return mv;
    }

    @RequestMapping(value = "/weShop/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("weShop") WeShop weShop,HttpServletRequest request) throws Exception{
        if(weShop.getId()==null){
            weShop.setUser(this.userService.findById(User.class,weShop.getUserid()));
            weShopService.save(weShop);
        }else{
            weShop.setUser(this.userService.findById(User.class,weShop.getUserid()));
            weShopService.update(weShop);
        }
        return "redirect:/weShop/list";
    }

    @RequestMapping(value = "/weShop/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("weShop") WeShop weShop) throws Exception{
        weShop = weShopService.findById(WeShop.class,weShop.getId());
        weShopService.delete(weShop);
        return "redirect:/weShop/list";
    }

    //============================weShop end======================================

    //===========================weCate begin=======================================
    @RequestMapping(value = "/weCate/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView weCatelist(@ModelAttribute("weCate") WeCate weCate, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<WeCate> list = this.weCateService.findByProperties(weCate,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.weCateService.countByProperties(weCate));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("weCate",weCate);
        mv.setViewName("we/weCate/list");
        return mv;

    }
    @RequestMapping(value = "/weCate/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("weCate") WeCate weCate) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(weCate) && Utils.isNotNullOrEmpty(weCate.getId())) {
            weCate = this.weCateService.findByProperties(weCate);
            mv.addObject(weCate);
            mv.setViewName("we/weCate/merge");
        }
        mv.setViewName("we/weCate/merge");
        return mv;
    }

    @RequestMapping(value = "/weCate/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("weCate") WeCate weCate,HttpServletRequest request) throws Exception{
        if(weCate.getId()==null){
            weCateService.save(weCate);
        }else{
            weCateService.update(weCate);
        }
        return "redirect:/weCate/list";
    }

    @RequestMapping(value = "/weCate/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("weCate") WeCate weCate) throws Exception{
        weCate = weCateService.findById(WeCate.class,weCate.getId());
        weCateService.delete(weCate);
        return "redirect:/weCate/list";
    }

    //============================weCate end======================================


    @RequestMapping(value = "/we/test", method = RequestMethod.GET)
    @ResponseBody
    public void get(HttpServletRequest request, HttpServletResponse response) throws Exception{

        Enumeration enu=request.getParameterNames();
        while(enu.hasMoreElements()){
            String paraName=(String)enu.nextElement();
            //System.out.println(paraName+": "+request.getParameter(paraName));
            log.info("qihntest:paraName : "+ request.getParameter(paraName));
        }

        // 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        // 随机字符串
        String echostr = request.getParameter("echostr");


        PrintWriter out = null;
        try {
            out = response.getWriter();
            log.info("qihntest:signature : "+  signature + " "+ timestamp + " " +  nonce );
            // 通过检验signature对请求进行校验，若校验成功则原样返回echostr，否则接入失败
            if (checkSignature(signature, timestamp, nonce)) {
                log.info("qihntest:echostr : "+ echostr );
                out.print(echostr);
                out.flush();   //这个地方必须画重点，消息推送配置Token令牌错误校验失败，搞了我很久，必须要刷新！！！！！！！
            }else {
                log.info("qihntest:echost2r : "+ echostr );
                out.print(echostr);
                out.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
            out = null;

        }
    }


    /**
     * 验证签名
     * @param signature
     * @param timestamp
     * @param nonce
     * @return
     */
    public static boolean checkSignature(String signature, String timestamp, String nonce) {

        //与token 比较
        String[] arr = new String[] { TOKEN, timestamp, nonce };

        // 将token、timestamp、nonce三个参数进行字典排序
        Arrays.sort(arr);

        StringBuilder content = new StringBuilder();

        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }

        MessageDigest md = null;
        String tmpStr = null;

        try {
            md = MessageDigest.getInstance("SHA-1");

            // 将三个参数字符串拼接成一个字符串进行sha1加密
            byte[] digest = md.digest(content.toString().getBytes());
            tmpStr = byteToStr(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        content = null;
        // 将sha1加密后的字符串可与signature对比
        return tmpStr != null ? tmpStr.equals(signature.toUpperCase()) : false;
    }

    /**
     * 将字节数组转换为十六进制字符串
     *
     * @param byteArray
     * @return
     */
    private static String byteToStr(byte[] byteArray) {
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }

    /**
     * 将字节转换为十六进制字符串
     *
     * @param mByte
     * @return
     */
    private static String byteToHexStr(byte mByte) {
        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
        tempArr[1] = Digit[mByte & 0X0F];

        String s = new String(tempArr);
        return s;
    }

    // response.setHeader("Content-type", "image/jpeg");
    @RequestMapping(value = "/we/showimg", method = RequestMethod.GET)
    public void showimg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到要下载的文件名
        String fileName = request.getParameter("filename");  //23239283-92489-阿凡达.avi
        fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
        //得到要下载的文件
        String fullpath = Utils.getProperty("basefilepath")+"/"+fileName;
        File file = new File(fullpath);
        //如果文件不存在
        if(!file.exists()){
            log.error("您要下载的资源不存在"+fileName);
            return;
        }
        //处理文件名
        String realname = fileName.substring(fileName.indexOf("_")+1);
        //设置响应头，控制浏览器下载该文件
        response.setContentType("image/jpeg");
        response.setHeader("Content-type", "image/jpeg");
        //读取要下载的文件，保存到文件输入流
        FileInputStream in = new FileInputStream(fullpath);
        //in = new FileInputStream("C:\\upfile\\2018-07-13\\4f1010cc-314d-418d-bf9f-53f0a9ed57c7_tomcat.png");
        //创建输出流
        OutputStream out = response.getOutputStream();
        //创建缓冲区
        byte buffer[] = new byte[1024];
        int len = 0;
        //循环将输入流中的内容读取到缓冲区当中
        while((len=in.read(buffer))>0){
            //输出缓冲区的内容到浏览器，实现文件下载
            out.write(buffer, 0, len);
        }
        //关闭文件输入流
        in.close();
        //关闭输出流
        out.close();
    }
}
