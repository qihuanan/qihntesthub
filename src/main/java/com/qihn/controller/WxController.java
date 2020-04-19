package com.qihn.controller;

import com.google.gson.JsonObject;
import com.qihn.pojo.*;
import com.qihn.service.*;
import com.qihn.utils.HttpUtil;
import com.qihn.utils.JSONUtils;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.beans.BeanUtils;
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
    @Resource(name="tipService")
    private TipService tipService;
    @Resource(name = "messageService")
    private MessageService messageService;
    @Resource(name = "lineUserService")
    private LineUserService lineUserService;
    @Resource(name = "tipUserService")
    private TipUserService tipUserService;
    @Resource(name = "examService")
    private ExamService examService;

    private void inituser(){

    }
    //=========================前端=========================
    @RequestMapping(value = "/wx/exam", method = RequestMethod.GET)
    public void exam(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        Point point = pointService.findById(Point.class,Long.parseLong(getParam("pointid")));
        Exam exam = new Exam();
        exam.setPointid(Long.parseLong(getParam("pointid")));
        exam = examService.findByProperties(exam);

        Map map = new HashMap();
        map.put("exam", exam);
        map.put("point",point);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/binduser", method = RequestMethod.GET)
    public void binduser(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        String linkmobile = getParam("linkmobile");
        if(Utils.isNotNullOrEmpty(linkmobile)){
            user.setLinkmobile(linkmobile);
        }
        String mobile = getParam("mobile");
        if(Utils.isNotNullOrEmpty(mobile)){
            user.setMobile(mobile);
        }
        String linkopenid = getParam("linkopenid");
        if(Utils.isNotNullOrEmpty(linkopenid)){
            user.setLinkopenid(linkopenid);
        }
        this.userService.update(user);

        Map map = new HashMap();
        map.put("data", user);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/wode", method = RequestMethod.GET)
    public void wode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        LineUser lineUser = new LineUser();
        lineUser.setUserid(Long.parseLong(getParam("userid")));
        List<LineUser> lulist = this.lineUserService.findByProperties(lineUser,null,null,"id","desc");
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));

        // 获取 已打卡任务点个数
        if(Utils.isNotNullOrEmpty(lulist)){
            for(int i=0;i<lulist.size();i++){
                PointUserinfo pu = new PointUserinfo();
                pu.setLineid(lulist.get(i).getLineid());
                pu.setUserid(user.getId());
                List<PointUserinfo> pulist = pointUserinfoService.findByProperties(pu,null,50,"id","desc");
                if(Utils.isNotNullOrEmpty(pulist)){
                    lulist.get(i).setUsername(pulist.size()+"");
                }else {
                    lulist.get(i).setUsername("0");
                }
            }

        }


        Map map = new HashMap();
        map.put("data", lulist);
        map.put("user", user);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/upfile", method = {RequestMethod.GET,RequestMethod.POST})
    public void doUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "imagefile", required = false) MultipartFile imagefile) throws Exception {
        try {
            //
            String basefilepath = Utils.getProperty("basefilepath");
            String datepath =  Utils.formatShortDate();
            //上传时生成的临时文件保存目录
            String tempPath = basefilepath + "/" + datepath;
            File tmpFile = new File(tempPath);
            if (!tmpFile.exists()) {
                //创建临时目录
                tmpFile.mkdirs();
            }
            log.error("qihndebug - "+tempPath);

            //String type = imagefile.getOriginalFilename().substring(imagefile.getOriginalFilename().lastIndexOf(".")).toLowerCase();
            String fileName = imagefile.getOriginalFilename();
            String logicfilepathname = datepath + "/" + fileName;
            String fullpath = basefilepath + "/" + logicfilepathname;

            File targetFile = new File(fullpath);
            log.error("qihndebug -fullpath: "+fullpath);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            imagefile.transferTo(targetFile);
            log.error("qihndebug - upfile end ");
            Map map = new HashMap();
            map.put("data", logicfilepathname);
            this.printjson(JSONUtils.toJSON(map));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/wx/qiandao", method = RequestMethod.GET)
    //@ResponseBody
    public void qiandao(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("pointUserinfo") PointUserinfo pointUserinfo) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        Map map = new HashMap();
        Point point = pointService.findById(Point.class,pointUserinfo.getPointid());
        User user = userService.findById(User.class,pointUserinfo.getUserid());
        long c = this.pointUserinfoService.countByProperties(pointUserinfo);
        if(c==0){
            pointUserinfo.setLineid(point.getLineid());
            pointUserinfo.setPointname(point.getName());
            pointUserinfo.setUsername(user.getName());
            pointUserinfo.setTime(System.currentTimeMillis());
            pointUserinfo.setAddScore(Integer.parseInt(point.getJifen()));
            pointUserinfo.setFinish("1");
            pointUserinfoService.save(pointUserinfo);
            user.setScore(user.getScore()+pointUserinfo.getAddScore());
            this.userService.update(user);
            map.put("data", "ok");
        }else{
            map.put("data", "has");
        }
        // 判断 线路是否完成
        //Line line = this.lineService.findById(Line.class,point.getLineid());
        Point tp = new Point();
        tp.setLineid(point.getLineid());
        long pointsize = this.pointService.countByProperties(tp);
        PointUserinfo pu = new PointUserinfo();
        pu.setUserid(user.getId());
        pu.setLineid(point.getLineid());
        long pusize = this.pointUserinfoService.countByProperties(pu);
        log.info("判断 线路是否完成 "+ pointsize + " "+pusize);
        if(pointsize == pusize){
            LineUser lu = new LineUser();
            lu.setUserid(user.getId());
            lu.setLineid(point.getLineid());
            lu = this.lineUserService.findByProperties(lu);
            lu.setEndtime(System.currentTimeMillis());
            lu.setFinish("1");
            this.lineUserService.update(lu);
        }


        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/tiplist", method = RequestMethod.GET)
    public void tiplist(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();

        // 当前point 的 tips
        Tip tip = new Tip();
        tip.setPointid(Long.parseLong(getParam("pointid")));
        Point point = this.pointService.findById(Point.class,Long.parseLong(getParam("pointid")));
        Line line = this.lineService.findById(Line.class,point.getLineid());
        List<Tip> tipList = this.tipService.findByProperties(tip,null,null,null,null);
        // 用户已解锁的提示标记
        User user = userService.findById(User.class,Long.parseLong(getParam("userid")));
        TipUser tu = new TipUser();
        tu.setUserid(user.getId());
        List<TipUser> tulist = this.tipUserService.findByProperties(tu,null,null,null,null);
        if(Utils.isNotNullOrEmpty(tulist)){
            for(int i=0;i<tipList.size();i++){
                for(int j =0;j<tulist.size();j++){
                    if(tipList.get(i).getId()== tulist.get(j).getTipid()){
                        tipList.get(i).setLockflag("0");
                    }
                }
            }
        }

        // 解锁此tip 前，判断一下这个 点的提示 在排序前的有没有还没解锁的，就是就锁需要按照顺序
        for(int i=0;i<tipList.size();i++){
            if(tipList.get(i).getLockflag().equals("1")){
                tipList.get(i).setCanunlock("1");// 顺序 第一个可解锁的 1
                break;
            }
        }
        Map map = new HashMap();
        map.put("tipList", tipList);
        map.put("point", point);
        map.put("line",line);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/unlockTip", method = RequestMethod.GET)
    //@ResponseBody
    public void unlockTip(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        Map map = new HashMap();
        map.put("data", "fail");
        Tip tip = this.tipService.findById(Tip.class,Long.parseLong(getParam("tipid")));
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        Point point = this.pointService.findById(Point.class,tip.getPointid());
        Line line = this.lineService.findById(Line.class,point.getLineid());


        TipUser tu = new TipUser();
        tu.setTipid(tip.getId());
        tu.setUserid(user.getId());
        tu = tipUserService.findByProperties(tu);
        if(tu==null){
            tu = new TipUser();
            tu.setLineid(line.getId());
            tu.setTipid(tip.getId());
            tu.setUserid(user.getId());
            tu.setTipname(tip.getName());
            tu.setUsername(user.getName());
            tu.setTime(System.currentTimeMillis());
            tu.setReduceScore(Integer.parseInt(tip.getJifen()));
            this.tipUserService.save(tu);
            user.setScore(user.getScore()-tu.getReduceScore());
            this.userService.update(user);
            map.put("data", "ok");
        }else {
            map.put("data", "已解锁过，不重复扣除积分");
        }

        // 当前point 的 tips
        long pointid = tip.getPointid();
        tip = new Tip();
        tip.setPointid(pointid);
        List<Tip> tipList = this.tipService.findByProperties(tip,null,null,null,null);

        // 用户已解锁的提示标记
        user = userService.findById(User.class,Long.parseLong(getParam("userid")));
         tu = new TipUser();
        tu.setUserid(user.getId());
        List<TipUser> tulist = this.tipUserService.findByProperties(tu,null,null,null,null);
        if(Utils.isNotNullOrEmpty(tulist)){
            for(int i=0;i<tipList.size();i++){
                for(int j =0;j<tulist.size();j++){
                    if(tipList.get(i).getId()== tulist.get(j).getTipid()){
                        tipList.get(i).setLockflag("0");
                    }
                }
            }
        }

        // 解锁此tip 前，判断一下这个 点的提示 在排序前的有没有还没解锁的，就是就锁需要按照顺序
        for(int i=0;i<tipList.size();i++){
            if(tipList.get(i).getLockflag().equals("1")){
                tipList.get(i).setCanunlock("1");// 顺序 第一个可解锁的 1
                break;
            }
        }
        map.put("tipList", tipList);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/linedetailon", method = RequestMethod.GET)
    //@ResponseBody
    public void linedetailon(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map map = new HashMap();
        this.setReqAndRes(request,response);
        showparam();
        Line line = this.lineService.findById(Line.class,Long.parseLong(getParam("lineid")));
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        // 喜欢标记
        LineUser lu = new LineUser();
        lu.setUserid(user.getId());
        lu.setLineid(line.getId());
        lu.setFlag("2");
        long c = this.lineUserService.countByProperties(lu);
        if(c==1){
            line.setLike("1");
        }
        // 获取参与信息  已用时间
        lu.setFlag("1");
        lu = this.lineUserService.findByProperties(lu);
        line.setYiyongshi(Utils.shijiancha(lu.getBegintime(),System.currentTimeMillis()));
        //是否超时，是否完成
        if(Utils.isNotNullOrEmpty(lu.getEndtime())){
            line.setYiyongshi(Utils.shijiancha(lu.getBegintime(),lu.getEndtime())+" 完成！");
        }else {
            // 未完成 判断是否超时
            long t = System.currentTimeMillis()+5 - lu.getBegintime();
            if(line.getShijian()*1000 < t){
                line.setYiyongshi("超时啦！");
            }
        }

        // 获取 已打卡任务点
        PointUserinfo pu = new PointUserinfo();
        pu.setLineid(line.getId());
        pu.setUserid(user.getId());
        List<PointUserinfo> pulist = pointUserinfoService.findByProperties(pu,null,50,null,null);
        if(Utils.isNotNullOrEmpty(pulist)){
            line.setYidaka(pulist.size()+"");
        }else {
            line.setYidaka("0");
        }
        //已获积分
        int sum = pulist.stream().map(PointUserinfo::getAddScore).reduce(0,(a,b) -> a+b );
        sum = pulist.stream().map(PointUserinfo::getAddScore).reduce(0,Integer::sum);
        // 扣减签到点提示的积分
        TipUser tu = new TipUser();
        tu.setLineid(line.getId());
        tu.setUserid(user.getId());
        List<TipUser> tulist = this.tipUserService.findByProperties(tu,null,null,null,null);
        if(Utils.isNotNullOrEmpty(tulist)){
            int disscore = 0;
            for(int i=0;i<tulist.size();i++){
                disscore+= tulist.get(i).getReduceScore();
            }
            sum = sum-disscore;
        }

        line.setYijifen(sum+"");
        // 签到点列表
        Point p = new Point();
        p.setLineid(line.getId());
        List<Point> pointlist = this.pointService.findByProperties(p,null,null,"shunxu","asc");
        /*
        {
          id: 0,  title:'奥林匹克森林公园湿地',
          latitude: 40.018720, longitude: 116.384537,
          width: 40, height: 40,
          iconPath: "/pages/images/icon-des-d@2x.png",
          // /pages/images/icon-des-d@2x.png  红色 默认没有打卡 红色
          // /pages/images/icon-des-und@2x.png 绿色
        }
         */
        List<Markvo> marklist = new ArrayList();
        if(Utils.isNotNullOrEmpty(pointlist)){
            for(int i=0;i<pointlist.size();i++){
                Markvo vo = new Markvo();
                vo.setId(pointlist.get(i).getId());
                vo.setHeight("25");
                vo.setIconPath("/pages/images/icon-des-d@2x.png");
                vo.setLongitude(pointlist.get(i).getJingdu());
                vo.setLatitude(pointlist.get(i).getWeidu());
                vo.setTitle(pointlist.get(i).getName());
                vo.setWidth("25");

                if(Utils.isNotNullOrEmpty(pulist)){// 已打卡的任务点标记不同的小旗颜色
                    for(int j=0;j<pulist.size();j++){
                        if(pointlist.get(i).getId().longValue()==pulist.get(j).getPointid().longValue()){
                            // 已打卡任务点
                            vo.setIconPath("/pages/images/icon-des-und@2x.png");
                        }
                    }
                }
                marklist.add(vo);
            }
        }

        map.put("pointlist",pointlist);
        map.put("marklist",marklist);

        //客户端传来 签到点 就获取当前签到点的提示信息，否则 获取线路的第一个签到点的信息
        Point point = pointlist.get(0);
        String pointid = getParam("pointid");
        if(Utils.isNotNullOrEmpty(pointid)){
            point.setId(Long.parseLong(pointid));
            point = this.pointService.findById(Point.class,point.getId());
        }else {
            point = pointlist.stream().sorted((p1,p2) -> p1.getShunxu()-p2.getShunxu() ).findFirst().get();
            // 显示下一个要进行的签到点  在用户签到点没有签到的
            for(int i=0;i<pointlist.size();i++){
                point = pointlist.get(i);
                boolean exist = false;
                for(int j=0;j<pulist.size();j++){
                    if(point.getId() == pulist.get(j).getPointid()){
                        exist = true;
                        break;
                    }
                }
                if(!exist){
                    break;
                }
            }
        }
        // 当前签到点旗帜颜色变为 黄色
//        for(int i = 0;i<marklist.size();i++){
//            if(marklist.get(i).getId() == point.getId()){
//                marklist.get(i).setIconPath("/pages/images/icon-flg-ylw@2x.png");
//            }
//        }
//        map.put("marklist",marklist);
        map.put("point",point);
        // 当前point 的 tips
        Tip tip = new Tip();
        tip.setPointid(point.getId());
        List<Tip> tipList = this.tipService.findByProperties(tip,null,null,null,null);
        // 标记 提示 是否解锁
        if(Utils.isNotNullOrEmpty(tulist)){
            for(int i=0;i<tipList.size();i++){
                for(int j =0;j<tulist.size();j++){
                    if(tipList.get(i).getId()== tulist.get(j).getTipid()){
                        tipList.get(i).setLockflag("0");
                    }
                }
            }
        }
        // 解锁此tip 前，判断一下这个 点的提示 在排序前的有没有还没解锁的，就是就锁需要按照顺序
        for(int i=0;i<tipList.size();i++){
            if(tipList.get(i).getLockflag().equals("1")){
                tipList.get(i).setCanunlock("1");// 顺序 第一个可解锁的 1
                break;
            }
        }
        map.put("tipList",tipList);

        map.put("line", line);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/writeMessage", method = RequestMethod.GET)
    //@ResponseBody
    public void writeMessage(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("message") Message message) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,message.getUserid());
        message.setAvatarUrl(user.getAvatarUrl());
        message.setUsername(user.getName());
        message.setTime(Utils.formatLongDate2());
        if(Utils.isNotNullOrEmpty(message.getDescription()))
            messageService.save(message);
        Map map = new HashMap();
        map.put("data", "ok");
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/messageList", method = RequestMethod.GET)
    //@ResponseBody
    public void messageList(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        Message message = new Message();
        message.setLineid(Long.parseLong(getParam("lineid")));
        List<Message> list = this.messageService.findByProperties(message,null,20,"id","desc");
        Map map = new HashMap();
        //map.put("data", JSONUtils.listToJson(lineList));
        map.put("data", list);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/linedetail", method = RequestMethod.GET)
    //@ResponseBody
    public void linedetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map map = new HashMap();
        this.setReqAndRes(request,response);
        showparam();
        Line line = this.lineService.findById(Line.class,Long.parseLong(getParam("lineid")));
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        LineUser lu = new LineUser();
        lu.setUserid(user.getId());
        lu.setLineid(line.getId());
        lu.setFlag("2");
        long c = this.lineUserService.countByProperties(lu);
        if(c==1){
           line.setLike("1");
        }
        /*lu.setFlag("1");
         c = this.lineUserService.countByProperties(lu);
        if(c==1){
            line.setCanyu("1");
        }*/

        map.put("data", line);

        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/linelike", method = RequestMethod.GET)
    //@ResponseBody
    public void linelike(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map map = new HashMap();
        this.setReqAndRes(request,response);
        showparam();
        Line line = this.lineService.findById(Line.class,Long.parseLong(getParam("lineid")));
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        LineUser lu = new LineUser();
        lu.setUserid(user.getId());
        lu.setLineid(line.getId());
        lu.setFlag("2");
        lu = this.lineUserService.findByProperties(lu);
        if(lu==null){
            lu = new LineUser();
            lu.setUserid(user.getId());
            lu.setLineid(line.getId());
            lu.setFlag("2");
            lu.setLine(line);
            lu.setUser(user);
            lu.setBegintime(System.currentTimeMillis());
            lu.setFlag("2");
            this.lineUserService.save(lu);
            map.put("data", "1");
        }else{
            this.lineUserService.delete(lu);
            map.put("data", "0");
        }



        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/linedaka", method = RequestMethod.GET)
    //@ResponseBody
    public void linedaka(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        Line line = this.lineService.findById(Line.class,Long.parseLong(getParam("lineid")));
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        LineUser lu = new LineUser();
        lu.setUserid(user.getId());
        lu.setLineid(line.getId());
        lu.setFlag("1");
        long c = this.lineUserService.countByProperties(lu);
        if(c==0){
            lu.setLine(line);
            lu.setUser(user);
            lu.setFlag("1");
            lu.setBegintime(System.currentTimeMillis());
            this.lineUserService.save(lu);
        }

        Map map = new HashMap();
        map.put("data", "ok");
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/getLineList", method = RequestMethod.GET)
    //@ResponseBody
    public void getLineList(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        Line line = new Line();
        line.setOnshow("1");
        List<Line> lineList = this.lineService.findByProperties(line,null,20,"shunxu","asc");
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        LineUser lu = new LineUser();
        lu.setUserid(user.getId());
        lu.setFlag("2");
        List<LineUser> lulist = this.lineUserService.findByProperties(lu,null,null,"id","desc");
        log.error("qihndebug-lulist : "+ lulist);
        if(Utils.isNotNullOrEmpty(lulist)){
            for(int i=0;i<lineList.size();i++){
                lineList.get(i).setLike("0");
                log.error("qihndebug-lulist : "+ i);
                for(int j=0;j<lulist.size();j++){
                    if(lineList.get(i).getId()==lulist.get(j).getLineid()){
                        lineList.get(i).setLike("1");
                        log.error("qihndebug-lulist : "+ lineList.get(i).getLike());
                    }
                }
            }
        }

        Map map = new HashMap();

        map.put("data", lineList);
        this.printjson(JSONUtils.toJSON(map));
    }

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

    //======================lineUser====================================
    @RequestMapping(value = "/lineUser/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView lineUserlist(@ModelAttribute("lineUser") LineUser lineUser, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<LineUser> list = this.lineUserService.findByProperties(lineUser,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.lineUserService.countByProperties(lineUser));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("lineUser",lineUser);
        mv.setViewName("lineUser/list");
        return mv;

    }
    @RequestMapping(value = "/lineUser/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("lineUser") LineUser lineUser) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(lineUser) && Utils.isNotNullOrEmpty(lineUser.getId())) {
            lineUser = this.lineUserService.findByProperties(lineUser);
            mv.addObject(lineUser);
            mv.setViewName("lineUser/merge");
        }
        mv.setViewName("lineUser/merge");
        return mv;
    }

    @RequestMapping(value = "/lineUser/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("lineUser") LineUser lineUser,HttpServletRequest request) throws Exception{
        if(Utils.isNotNullOrEmpty(lineUser.getLineid()) ){
            lineUser.setLine(this.lineService.findById(Line.class,lineUser.getLineid()));
        }else{
            lineUser.setLine(null);
        }
        if(Utils.isNotNullOrEmpty(lineUser.getUserid()) ){
            lineUser.setUser(this.userService.findById(User.class,lineUser.getUserid()));
        }else{
            lineUser.setUser(null);
        }
        if(lineUser.getId()==null){
            lineUserService.save(lineUser);
        }else{
            lineUserService.update(lineUser);
        }
        return "redirect:/lineUser/list";
    }

    @RequestMapping(value = "/lineUser/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("lineUser") LineUser lineUser) throws Exception{
        lineUser = lineUserService.findById(LineUser.class,lineUser.getId());
        lineUserService.delete(lineUser);
        return "redirect:/lineUser/list";
    }

    //======================message====================================
    @RequestMapping(value = "/message/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView messagelist(@ModelAttribute("message") Message message, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Message> list = this.messageService.findByProperties(message,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.messageService.countByProperties(message));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("message",message);
        mv.setViewName("message/list");
        return mv;

    }
    @RequestMapping(value = "/message/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("message") Message message) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(message) && Utils.isNotNullOrEmpty(message.getId())) {
            message = this.messageService.findByProperties(message);
            mv.addObject(message);
            mv.setViewName("message/merge");
        }
        mv.setViewName("message/merge");
        return mv;
    }

    @RequestMapping(value = "/message/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("message") Message message,HttpServletRequest request) throws Exception{
        if(message.getId()==null){
            messageService.save(message);
        }else{
            messageService.update(message);
        }
        return "redirect:/message/list";
    }

    @RequestMapping(value = "/message/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("message") Message message) throws Exception{
        message = messageService.findById(Message.class,message.getId());
        messageService.delete(message);
        return "redirect:/message/list";
    }
    
    //======================tip====================================
    @RequestMapping(value = "/tip/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView tiplist(@ModelAttribute("tip") Tip tip, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Tip> list = this.tipService.findByProperties(tip,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.tipService.countByProperties(tip));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("tip",tip);
        mv.setViewName("tip/list");
        return mv;

    }
    @RequestMapping(value = "/tip/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("tip") Tip tip) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(tip) && Utils.isNotNullOrEmpty(tip.getId())) {
            tip = this.tipService.findByProperties(tip);
            mv.addObject(tip);
            mv.setViewName("tip/merge");
        }
        mv.setViewName("tip/merge");
        return mv;
    }

    @RequestMapping(value = "/tip/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("tip") Tip tip,HttpServletRequest request) throws Exception{
        if(tip.getId()==null){
            tipService.save(tip);
        }else{
            tipService.update(tip);
        }
        return "redirect:/tip/list?pointid="+tip.getPointid()+"&pointname="+ URLEncoder.encode(tip.getPointname(),"UTF-8");
    }

    @RequestMapping(value = "/tip/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("tip") Tip tip) throws Exception{
        tip = tipService.findById(Tip.class,tip.getId());
        tipService.delete(tip);
        return "redirect:/tip/list?pointid="+tip.getPointid()+"&pointname="+ URLEncoder.encode(tip.getPointname(),"UTF-8");
    }

    //==================================================================


    //======================exam====================================
    @RequestMapping(value = "/exam/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView examlist(@ModelAttribute("exam") Exam exam, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Exam> list = this.examService.findByProperties(exam,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.examService.countByProperties(exam));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("exam",exam);
        mv.setViewName("exam/list");
        return mv;

    }
    @RequestMapping(value = "/exam/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("exam") Exam exam) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(exam) && Utils.isNotNullOrEmpty(exam.getId())) {
            exam = this.examService.findByProperties(exam);
            mv.addObject(exam);
            mv.setViewName("exam/merge");
        }
        mv.setViewName("exam/merge");
        return mv;
    }

    @RequestMapping(value = "/exam/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("exam") Exam exam,HttpServletRequest request) throws Exception{
        if(exam.getId()==null){
            examService.save(exam);
        }else{
            examService.update(exam);
        }
        return "redirect:/exam/list?pointid="+exam.getPointid()+"&pointname="+ URLEncoder.encode(exam.getPointname(),"UTF-8");
    }

    @RequestMapping(value = "/exam/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("exam") Exam exam) throws Exception{
        exam = examService.findById(Exam.class,exam.getId());
        examService.delete(exam);
        return "redirect:/exam/list?pointid="+exam.getPointid()+"&pointname="+ URLEncoder.encode(exam.getPointname(),"UTF-8");
    }

    //==================================================================
    

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

    // response.setHeader("Content-type", "image/jpeg");
    @RequestMapping(value = "/wx/showimg", method = RequestMethod.GET)
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
