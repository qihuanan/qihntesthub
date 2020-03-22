package com.qihn.controller;

import com.qihn.pojo.*;
import com.qihn.service.*;
import com.qihn.utils.HttpUtil;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;


@Controller
public class WxController extends BaseController {
    private static Log log = LogFactory.getLog(WxController.class);
    public static final String TOKEN = "qihn";
    @Resource(name = "goodsService")
    private GoodsService goodsService;
    @Resource(name = "lineService")
    private LineService lineService;
    @Resource(name = "pointService")
    private PointService pointService;
    @Resource(name = "pointUserinfoService")
    private PointUserinfoService pointUserinfoService;
    @Resource(name = "userService")
    private UserService userService;

    //======================pointUserinfo====================================
    @RequestMapping(value = "/pointUserinfo/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView pointUserinfolist(@ModelAttribute("pointUserinfo") PointUserinfo pointUserinfo, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<PointUserinfo> list = this.pointUserinfoService.findByProperties(pointUserinfo,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.pointUserinfoService.countByProperties(pointUserinfo));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("pointUserinfo",pointUserinfo);
        mv.setViewName("pointUserinfo/list");
        return mv;

    }
    @RequestMapping(value = "/pointUserinfo/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("pointUserinfo") PointUserinfo pointUserinfo) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(pointUserinfo) && Utils.isNotNullOrEmpty(pointUserinfo.getId())) {
            pointUserinfo = this.pointUserinfoService.findByProperties(pointUserinfo);
            mv.addObject(pointUserinfo);
            mv.setViewName("pointUserinfo/merge");
        }
        mv.setViewName("pointUserinfo/merge");
        return mv;
    }

    @RequestMapping(value = "/pointUserinfo/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("pointUserinfo") PointUserinfo pointUserinfo,HttpServletRequest request) throws Exception{
        if(Utils.isNotNullOrEmpty(pointUserinfo.getPointid())){
            Point point = pointService.findById(Point.class,pointUserinfo.getPointid());
            pointUserinfo.setPointname(point.getName());
        }
        if(Utils.isNotNullOrEmpty(pointUserinfo.getUserid())){
            User user = userService.findById(User.class,pointUserinfo.getUserid());
            pointUserinfo.setUsername(user.getName());
        }

        if(pointUserinfo.getId()==null){
            pointUserinfoService.save(pointUserinfo);
        }else{
            pointUserinfoService.update(pointUserinfo);
        }
        return "redirect:/pointUserinfo/list";
    }

    @RequestMapping(value = "/pointUserinfo/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("pointUserinfo") PointUserinfo pointUserinfo) throws Exception{
        pointUserinfo = pointUserinfoService.findById(PointUserinfo.class,pointUserinfo.getId());
        pointUserinfoService.delete(pointUserinfo);
        return "redirect:/pointUserinfo/list";
    }
    
    //======================line====================================
    @RequestMapping(value = "/line/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView linelist(@ModelAttribute("line") Line line, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Line> list = this.lineService.findByProperties(line,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.lineService.countByProperties(line));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("line",line);
        mv.setViewName("line/list");
        return mv;

    }
    @RequestMapping(value = "/line/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("line") Line line) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(line) && Utils.isNotNullOrEmpty(line.getId())) {
            line = this.lineService.findByProperties(line);
            mv.addObject(line);
            mv.setViewName("line/merge");
        }
        mv.setViewName("line/merge");
        return mv;
    }

    @RequestMapping(value = "/line/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("line") Line line,HttpServletRequest request) throws Exception{
        if(line.getId()==null){
            lineService.save(line);
        }else{
            lineService.update(line);
        }
        return "redirect:/line/list";
    }

    @RequestMapping(value = "/line/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("line") Line line) throws Exception{
        lineService.delete(line);
        return "redirect:/line/list";
    }


    //======================point====================================
    @RequestMapping(value = "/point/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView pointlist(@ModelAttribute("point") Point point, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Point> list = this.pointService.findByProperties(point,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.pointService.countByProperties(point));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("point",point);
        mv.setViewName("point/list");
        return mv;

    }
    @RequestMapping(value = "/point/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("point") Point point) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(point) && Utils.isNotNullOrEmpty(point.getId())) {
            point = this.pointService.findByProperties(point);
            mv.addObject(point);
            mv.setViewName("point/merge");
        }
        mv.setViewName("point/merge");
        return mv;
    }

    @RequestMapping(value = "/point/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("point") Point point,HttpServletRequest request) throws Exception{
        if(point.getId()==null){
            pointService.save(point);
        }else{
            pointService.update(point);
        }
        return "redirect:/point/list?lineid="+point.getLineid()+"&linename="+ URLEncoder.encode(point.getLinename(),"UTF-8");
    }

    @RequestMapping(value = "/point/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("point") Point point) throws Exception{
        point = pointService.findById(Point.class,point.getId());
        pointService.delete(point);
        return "redirect:/point/list?lineid="+point.getLineid()+"&linename="+ URLEncoder.encode(point.getLinename(),"UTF-8");
    }
    
    //==================================================================
    @RequestMapping(value = "/user/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView userlist(@ModelAttribute("user") User user, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<User> list = this.userService.findByProperties(user,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.userService.countByProperties(user));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("user",user);
        mv.setViewName("user/list");
        return mv;

    }
    @RequestMapping(value = "/user/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("user") User user) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(user) && Utils.isNotNullOrEmpty(user.getId())) {
            user = this.userService.findByProperties(user);
            mv.addObject(user);
            mv.setViewName("user/merge");
        }
        mv.setViewName("user/merge");
        return mv;
    }

    @RequestMapping(value = "/user/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("user") User user,HttpServletRequest request) throws Exception{
        if(user.getId()==null){
            userService.save(user);
        }else{
            userService.update(user);
        }
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/user/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("user") User user) throws Exception{
        userService.delete(user);
        return "redirect:/user/list";
    }

    //==================================================
    @RequestMapping(value = "/wx/login", method = RequestMethod.GET)
    @ResponseBody
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        StringBuffer sb = new StringBuffer("https://api.weixin.qq.com/sns/jscode2session?appid=");
        sb.append(Utils.getProperty("appid"));
        sb.append("&secret=").append(Utils.getProperty("secret"));
        sb.append("&js_code=").append(getParam("code"));
        sb.append("&grant_type=authorization_code");
        log.info("url: "+sb.toString());
        String res = HttpUtil.sendGet(sb.toString());
        log.info("http-wxlogin-res: "+res);
        JSONObject json = new JSONObject(res);
       this.print(json.getString("openid"));
    }



    @RequestMapping(value = "/wx/test", method = RequestMethod.GET)
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

}
