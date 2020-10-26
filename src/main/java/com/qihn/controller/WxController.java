package com.qihn.controller;

import com.google.gson.JsonObject;
import com.qihn.pojo.*;
import com.qihn.service.*;
import com.qihn.utils.*;
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
    @Resource(name="baoxiangService")
    private BaoxiangService baoxiangService;
    @Resource(name="suipianService")
    private SuipianService suipianService;

    private void inituser(){

    }
    //=========================前端=========================

    @RequestMapping(value = "/wx/createshareimg", method = RequestMethod.GET)
    public void createshareimg(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        Map map = new HashMap();

        String basefilepath = Utils.getProperty("basefilepath")+ File.separator ;

        //String bgimgpath,String shareimgpath,String qrcodepath,
        // String avatarurl,String nickname, List<String> strlist,String resultimgpath
        Line line = this.lineService.findById(Line.class,3l); // 固定
        String bgimgpathfull = basefilepath+ line.getPicture1();
        String qrcodepathfull = basefilepath+ line.getPicture2();
        Point point = new Point();
        point.setLineid(line.getId());
        Long cont = this.pointService.countByProperties(point);
        List<Point> pointList = this.pointService.findByProperties(point,null,100,null,null);
        map.put("point",pointList.get(new Random().nextInt(cont.intValue()) ));
        String shareimgpath = pointList.get(new Random().nextInt(cont.intValue()) ).getPicture1();
        String shareimgpathfull = basefilepath +shareimgpath;
        //User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        String nickname = getParam("nickname");
        String avatarurl = getParam("avatarurl");
        List<String> strList = new ArrayList<>();
        //strList.add("我已坚持打卡xx天");
        strList.add("探索美的秘密！");
        strList.add("徐悲鸿纪念馆邀请你一起来!");

        String datepath =  Utils.formatShortDate();
        //上传时生成的临时文件保存目录
        String tempPath = basefilepath + datepath;
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            tmpFile.mkdirs();
        }
        String filename = datepath +File.separator+Utils.formatCompactDateSSS()+".jpg";
        String resultimgpathfull = basefilepath +filename;
        String res = XcxUtil.createshareimg(bgimgpathfull,shareimgpathfull,qrcodepathfull,avatarurl,
                nickname,strList,resultimgpathfull);

        map.put("data", line);
        if(res!=null){
            map.put("shareimgpath",filename);
        }

        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/baoxiang", method = RequestMethod.GET)
    public void baoxiang(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        Line line = this.lineService.findById(Line.class,Long.parseLong(getParam("lineid")));
        Baoxiang baoxiang = new Baoxiang();
        baoxiang.setLineid(line.getId());
        List<Baoxiang> baoxiangList = this.baoxiangService.findByProperties(baoxiang,null,null,null,null);
        Suipian suipian = new Suipian();
        suipian.setLineid(line.getId());
        List<Suipian> suipianList = this.suipianService.findByProperties(suipian,null,null,"bianhao","asc");

        PointUserinfo pointUserinfo = new PointUserinfo();
        pointUserinfo.setUserid(user.getId());
        pointUserinfo.setLineid(line.getId());
        List<PointUserinfo> pointUserinfoList = this.pointUserinfoService.findByProperties(pointUserinfo,null,null,null,null);

        int yijiesuo = 0;
        // 用户是否获取了这个碎片
        for(int i=0;i<suipianList.size();i++){
            for(int j =0 ;j<pointUserinfoList.size();j++){
                if(pointUserinfoList.get(j).getPrize().equals(suipianList.get(i).getName())){
                    suipianList.get(i).setHas("1");
                    suipianList.get(i).setImg(pointUserinfoList.get(j).getPrizeimg());
                    yijiesuo++;
                }

            }
        }


        int zongpianshu = baoxiangList.size()*6;
        Map map = new HashMap();
        map.put("baoxiangList", baoxiangList);
        map.put("suipianList",suipianList);
        map.put("line",line);
        map.put("yijiesuo",yijiesuo);
        map.put("zongpianshu",zongpianshu);
        this.printjson(JSONUtils.toJSON(map));
    }

    /**
     * 每日打卡,随机
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/wx/exammrdk", method = RequestMethod.GET)
    public void exammrdk(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        Point point = pointService.findById(Point.class,Long.parseLong(getParam("pointid")));
        Exam exam = new Exam();
        exam.setPointid(Long.parseLong(getParam("pointid")));
        Long count = examService.countByProperties(exam);
        List<Exam> examList = examService.findByProperties(exam,null,500,null,null);
        int rand = new Random().nextInt(count.intValue());
        exam = examList.get(rand);

        List<Pricevo> radiolist = new ArrayList<>();
        if(exam.getCate().equals("3")){
            String arr[] = exam.getRadiolist().split(";");
            for(int i = 0;i<arr.length;i++){
                Pricevo p  = new Pricevo();
                p.setName(arr[i].split(",")[0]);
                p.setValue(arr[i].split(",")[1]);
                radiolist.add(p);
            }
        }

        Map map = new HashMap();
        map.put("exam", exam);
        map.put("point",point);
        map.put("radiolist",radiolist);
        map.put("count",count);
        this.printjson(JSONUtils.toJSON(map));
    }

    /**
     * 附加题
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/wx/exam2", method = RequestMethod.GET)
    public void exam2(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        Point point = pointService.findById(Point.class,Long.parseLong(getParam("pointid")));
        Exam exam = new Exam();
        exam.setPointid(Long.parseLong(getParam("pointid")));
        exam = examService.findByProperties(exam,null,2,null,null).get(1);
        List<Pricevo> radiolist = new ArrayList<>();
        if(exam.getCate().equals("3")){
            String arr[] = exam.getRadiolist().split(";");
            for(int i = 0;i<arr.length;i++){
                Pricevo p  = new Pricevo();
                p.setName(arr[i].split(",")[0]);
                p.setValue(arr[i].split(",")[1]);
                radiolist.add(p);
            }
        }

        Map map = new HashMap();
        map.put("exam", exam);
        map.put("point",point);
        map.put("radiolist",radiolist);
        map.put("count",1);
        this.printjson(JSONUtils.toJSON(map));
    }

    @RequestMapping(value = "/wx/exam", method = RequestMethod.GET)
    public void exam(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        User user = this.userService.findById(User.class,Long.parseLong(getParam("userid")));
        Point point = pointService.findById(Point.class,Long.parseLong(getParam("pointid")));
        Exam exam = new Exam();
        exam.setPointid(Long.parseLong(getParam("pointid")));
        long count = examService.countByProperties(exam);
        exam = examService.findByProperties(exam);

        List<Pricevo> radiolist = new ArrayList<>();
        if(exam.getCate().equals("3")){
            String arr[] = exam.getRadiolist().split(";");
            for(int i = 0;i<arr.length;i++){
                Pricevo p  = new Pricevo();
                p.setName(arr[i].split(",")[0]);
                p.setValue(arr[i].split(",")[1]);
                radiolist.add(p);
            }
        }

        Map map = new HashMap();
        map.put("exam", exam);
        map.put("point",point);
        map.put("radiolist",radiolist);
        map.put("count",count);
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
            String tempPath = basefilepath + File.separator + datepath;
            File tmpFile = new File(tempPath);
            if (!tmpFile.exists()) {
                //创建临时目录
                tmpFile.mkdirs();
            }
            log.error("qihndebug - "+tempPath);

            //String type = imagefile.getOriginalFilename().substring(imagefile.getOriginalFilename().lastIndexOf(".")).toLowerCase();
            String fileName = imagefile.getOriginalFilename();
            String logicfilepathname = datepath + File.separator + fileName;
            String fullpath = basefilepath + File.separator + logicfilepathname;

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
        String answertemp = pointUserinfo.getAnswer();// 用户填写的答案
        Point point = pointService.findById(Point.class,pointUserinfo.getPointid());
        User user = userService.findById(User.class,pointUserinfo.getUserid());
        PointUserinfo old = this.pointUserinfoService.findByProperties(pointUserinfo);
        if(old == null){
            pointUserinfo.setLineid(point.getLineid());
            pointUserinfo.setPointname(point.getName());
            pointUserinfo.setUsername(user.getName());
            pointUserinfo.setTime(System.currentTimeMillis());
            pointUserinfo.setAddScore(0);
            // 答题信息
            if(Utils.isNotNullOrEmpty(pointUserinfo.getExamid())){
                Exam exam = this.examService.findById(Exam.class,Long.parseLong(pointUserinfo.getExamid()));
                pointUserinfo.setCate(exam.getCate());
                pointUserinfo.setChance(exam.getChance());

                map.put("exam", exam);
                if(pointUserinfo.getCate().equals("1") || pointUserinfo.getCate().equals("3")){ //1: 文字答题  2: 上传图片
                    pointUserinfo.setPicture("");
                    if(pointUserinfo.getChance()<1){
                        pointUserinfo.setFinish("1");
                        map.put("data", "errnochance");
                    }
                    if(Arrays.asList(exam.getAnswer().split(";")).contains(pointUserinfo.getAnswer()) || exam.getAnswer().contains("***")){
                        pointUserinfo.setPrize(exam.getPrize());
                        pointUserinfo.setPrizeimg(exam.getPrizeimg());
                        pointUserinfo.setAddScore(Integer.parseInt(point.getJifen()));
                        map.put("data", "ok");
                        pointUserinfo.setAddScore(Integer.parseInt(point.getJifen()));
                        user.setScore(user.getScore()+pointUserinfo.getAddScore());
                        pointUserinfo.setFinish("1");
                    }else{
                        pointUserinfo.setPrize("答案错误");
                        pointUserinfo.setPrizeimg("");
                        pointUserinfo.setFinish("0");
                        if(pointUserinfo.getChance()==1){
                            pointUserinfo.setFinish("1");
                        }
                        pointUserinfo.setChance(pointUserinfo.getChance()-1);

                        pointUserinfo.setAddScore(0);
                        map.put("data", "err");
                        if(pointUserinfo.getChance()<1){
                            pointUserinfo.setFinish("1");
                            map.put("data", "errnochance");
                        }
                    }
                }else{// 上传图片
                    pointUserinfo.setPrize(exam.getPrize());
                    pointUserinfo.setPrizeimg(exam.getPrizeimg());
                    pointUserinfo.setAddScore(Integer.parseInt(point.getJifen()));
                    map.put("data", "ok");
                    pointUserinfo.setAddScore(Integer.parseInt(point.getJifen()));
                    user.setScore(user.getScore()+pointUserinfo.getAddScore());
                    pointUserinfo.setFinish("1");
                }
                pointUserinfo.setChance(exam.getChance()-1);
            }

            pointUserinfoService.save(pointUserinfo);
            this.userService.update(user);
            map.put("pointUserinfo", pointUserinfo);
        }else{
            old.setAnswer(old.getAnswer()+"; "+answertemp);
            if(old.getAnswer().length()>250){
                old.setAnswer(old.getAnswer().substring(0,250));
            }
            if(old.getChance()>0){
                // 答题信息 更新
                if(Utils.isNotNullOrEmpty(old.getExamid())){
                    Exam exam = this.examService.findById(Exam.class,Long.parseLong(old.getExamid()));
                    map.put("exam", exam);
                    old.setCate(exam.getCate());
                    old.setAddScore(0);
                    old.setChance(old.getChance()-1);
                    if(old.getCate().equals("1") || old.getCate().equals("3")){ //1: 文字答题  2: 上传图片
                        old.setPicture("");
                        if(Arrays.asList(exam.getAnswer().split(";")).contains(pointUserinfo.getAnswer()) || exam.getAnswer().contains("***")){
                            old.setPrize(exam.getPrize());
                            old.setPrizeimg(exam.getPrizeimg());
                            old.setAddScore(Integer.parseInt(point.getJifen()));
                            map.put("data", "ok");
                            old.setAddScore(Integer.parseInt(point.getJifen()));
                            user.setScore(user.getScore()+old.getAddScore());
                            //old.setChance(old.getChance()-1);
                            old.setPicture("");
                            old.setFinish("1");
                        }else{
                            old.setPrize("答案错误");
                            old.setPrizeimg("");
                            old.setFinish("0");
                            old.setAddScore(0);
                            //old.setChance(old.getChance()-1);
                            map.put("data", "err");
                            if(old.getChance()<=1){
                                old.setFinish("1");
                                map.put("data", "errnochance");
                            }
                        }
                    }
                }
                //old.setChance(old.getChance()-1);
                pointUserinfoService.update(old);
                this.userService.update(user);
                map.put("pointUserinfo", old);

            }else {
                old.setChance(0);
                old.setFinish("1");
                pointUserinfoService.update(old);
                map.put("data", "has");
                map.put("data", "errnochance");

            }
        }
        // 判断 线路是否完成
        //Line line = this.lineService.findById(Line.class,point.getLineid());
        Point tp = new Point();
        tp.setLineid(point.getLineid());
        Long pointsize = this.pointService.countByProperties(tp);
        PointUserinfo pu = new PointUserinfo();
        pu.setUserid(user.getId());
        pu.setLineid(point.getLineid());
        pu.setFinish("1");
        Long pusize = this.pointUserinfoService.countByProperties(pu);
        log.info("判断 线路是否完成 "+ pointsize + " "+pusize);

        LineUser lu = new LineUser();
        lu.setUserid(user.getId());
        lu.setLineid(point.getLineid());
        lu = this.lineUserService.findByProperties(lu);
        if(lu!=null && pointsize!=null && pusize!=null){
            if(pointsize.longValue() <= pusize.longValue()){
                lu.setEndtime(System.currentTimeMillis());
                lu.setFinish("1");
                map.put("finish", "1");
            }else {
                if(Utils.isNullorEmpty(lu.getBegintime())){
                    lu.setBegintime(System.currentTimeMillis());
                }
                map.put("finish", "0");
            }
            this.lineUserService.update(lu);
        }


        Exam exam = new Exam();
        exam.setPointid(point.getId());
        // 是否有加分任务，多题目
        long count = examService.countByProperties(exam);
        map.put("count", count);

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
        List<Tip> tipList = this.tipService.findByProperties(tip,null,null,"shunxu","asc");
        // 用户已解锁的提示标记
        User user = userService.findById(User.class,Long.parseLong(getParam("userid")));
        TipUser tu = new TipUser();
        tu.setUserid(user.getId());
        List<TipUser> tulist = this.tipUserService.findByProperties(tu,null,null,null,null);

        if(Utils.isNotNullOrEmpty(tulist)){
            for(int i=0;i<tipList.size();i++){
                for(int j =0;j<tulist.size();j++){
                    if(tipList.get(i).getId().longValue()== tulist.get(j).getTipid().longValue() ){
                        log.info("用户已解锁过此点，标记已解锁");

                        tipList.get(i).setLockflag("0");
                        Tip temp = tipList.get(i);
                        temp.setLockflag("0");
                        tipList.set(i,temp);
                        //tipList.remove(i);
                        //tipList.add(i,temp);
                        //tipList.add(temp);
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
        List<Tip> tipList = this.tipService.findByProperties(tip,null,null,"shunxu","asc");

        // 用户已解锁的提示标记
        user = userService.findById(User.class,Long.parseLong(getParam("userid")));
         tu = new TipUser();
        tu.setUserid(user.getId());
        List<TipUser> tulist = this.tipUserService.findByProperties(tu,null,null,"id","desc");
        if(Utils.isNotNullOrEmpty(tulist)){
            log.info("tulist "+JSONUtils.toJSON(tulist));
            for(int i=0;i<tipList.size();i++){

                for(int j =0;j<tulist.size();j++){
                    if(tipList.get(i).getId().longValue()== tulist.get(j).getTipid().longValue()){
                        tipList.get(i).setLockflag("0");
                        log.info("-----------"+JSONUtils.toJSON(tipList.get(i)) );
                        break;
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

    /**
     * 跳过加分任务，把加分任务这个点的 签到信息改为完成，这样会自动跳转到下个签到点
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/wx/jiafenrenwufinish", method = RequestMethod.GET)
    //@ResponseBody
    public void jiafenrenwufinish(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map map = new HashMap();
        this.setReqAndRes(request, response);
        showparam();
        // 获取 已打卡任务点
        PointUserinfo pu = new PointUserinfo();
        pu.setPointid(Long.parseLong(getParam("pointid")));
        pu.setUserid(Long.parseLong(getParam("userid")));
        List<PointUserinfo> pulist = pointUserinfoService.findByProperties(pu,null,100,"id","desc");
        if(Utils.isNotNullOrEmpty(pulist)){
            for(int j=0;j<pulist.size();j++){
                if(!pulist.get(j).getFinish().equals("1")){
                    pu = pulist.get(j);
                    pu.setFinish("1");
                    this.pointUserinfoService.update(pu);
                    log.info("jiafenrenwufinish- 更新附加任务点完成状态完成");
                    map.put("data", "ok");
                }
            }
        }

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

        // 获取 已打卡任务点
        PointUserinfo pu = new PointUserinfo();
        pu.setLineid(line.getId());
        pu.setUserid(user.getId());
        List<PointUserinfo> pulist = pointUserinfoService.findByProperties(pu,null,100,"id","desc");
        if(Utils.isNotNullOrEmpty(pulist)){
            line.setYidaka(pulist.size()+"");
        }else {
            line.setYidaka("0");
        }

        // 获取参与信息  已用时间
        lu.setFlag("1");
        lu = this.lineUserService.findByProperties(lu);
        if(lu.getBegintime()!=null){
            line.setYiyongshi(Utils.shijiancha(lu.getBegintime(),System.currentTimeMillis()));
            //是否超时，是否完成
            if(Utils.isNotNullOrEmpty(lu.getEndtime())){
                line.setYiyongshi(Utils.shijiancha(lu.getBegintime(),lu.getEndtime())+" 完成！");
            }else {
                // 未完成 判断是否超时
                long t = System.currentTimeMillis()+5 - lu.getBegintime(); // 经过的毫秒数
                if(line.getShijian()*1000 < t){
                    line.setYiyongshi("超时啦！");
                }
                // 超过99.50.59 就显示这个 超过100小时的
                if(t> 1000*60 * 60 *100){
                    line.setYiyongshi("99:59:59");
                }
                // 如果 一个任务点也没有打卡，并且超过1小时 重新开始打卡时间
                if(Utils.isNullorEmpty(pulist)){
                    if(line.getShijian()*1000*60*60 > 1){
                        line.setYiyongshi("00:00:01");
                        lu.setBegintime(System.currentTimeMillis());
                        this.lineUserService.update(lu);
                    }
                }
            }
        }else{
            line.setYiyongshi("未开始");
        }



        //已获积分  错误
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
                vo.setIconPath("/pages/images/svg/point-unchecked"+Utils.formatString0(pointlist.get(i).getShunxu())+".png");
                vo.setLongitude(pointlist.get(i).getJingdu());
                vo.setLatitude(pointlist.get(i).getWeidu());
                vo.setTitle(pointlist.get(i).getName());
                vo.setTitle("");
                vo.setWidth("25");

                if(Utils.isNotNullOrEmpty(pulist)){// 已打卡的任务点标记不同的小旗颜色
                    for(int j=0;j<pulist.size();j++){
                        if(pointlist.get(i).getId().longValue()==pulist.get(j).getPointid().longValue()){
                            // 已打卡任务点
                            vo.setIconPath("/pages/images/icon-des-und@2x.png");
                            vo.setIconPath("/pages/images/svg/point-checked"+Utils.formatString0(pointlist.get(i).getShunxu())+".png");
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
                if(Utils.isNullorEmpty(pulist)){
                    break;
                }
                boolean exist = false; // 是否打卡完成这个点
                boolean notfinish = false;
                for(int j=0;j<pulist.size();j++){
                    if(point.getId().longValue() == pulist.get(j).getPointid().longValue()){
                        exist = true;
                        // 如果打卡过 但是 任务失败还有机会，那还停留在这个点，用户继续在这个点答题
                        if(!pulist.get(j).getFinish().equals("1")){
                            exist = false;
                            notfinish = true;
                        }
                        break;
                    }
                }


                // 上面逻辑是顺序打卡，最小的点
                // 不强制按顺序打卡时候 获取当前打卡记录的最大打卡点后的那个点
                // 如果不是当前点未完成，对于不按顺序打开的，应该获取已打卡点的下个大的顺序点
                if(!notfinish && line.getOrderflag()!=null && line.getOrderflag().equals("0")){
                    log.info("不安顺序打卡 ");
                    if(pulist!=null && pulist.size()>0){
                        Point finishpoint =this.pointService.findById(Point.class,pulist.get(0).getPointid()); // 当前最后时间打卡点，

                        log.info("当前最后打卡点： "+JSONUtils.toJSON(finishpoint));
                       point = this.logic(finishpoint,pointlist,pulist);
                       break;
                        /*if(finishpoint!=null && finishpoint.getShunxu()!=null){
                            int tarshunxu = finishpoint.getShunxu()+1;
                            if(point.getShunxu().intValue() == tarshunxu){
                                break;
                            }
                        }*/

                    }
                }else{
                    // 顺序打卡，那么就是这个点
                    if(!exist){
                        break;
                    }
                }

            }
        }
        // 当前签到点旗帜颜色变为 黄色
        for(int i = 0;i<marklist.size();i++){
            if(marklist.get(i).getId() == point.getId()){
                marklist.get(i).setIconPath("/pages/images/icon-flg-ylw@2x.png");
                marklist.get(i).setIconPath("/pages/images/svg/point-select"+Utils.formatString0(pointlist.get(i).getShunxu())+".png");
                marklist.get(i).setWidth("30");
                marklist.get(i).setHeight("30");
            }
        }
        map.put("marklist",marklist);
        map.put("point",point);
        // 当前point 的 tips
        Tip tip = new Tip();
        tip.setPointid(point.getId());
        List<Tip> tipList = this.tipService.findByProperties(tip,null,null,"shunxu","asc");
        // 标记 提示 是否解锁
        log.info("tulist: "+JSONUtils.toJSON(tulist));
        if(Utils.isNotNullOrEmpty(tulist)){
            for(int i=0;i<tipList.size();i++){
                for(int j =0;j<tulist.size();j++){
                    if(tipList.get(i).getId().longValue()== tulist.get(j).getTipid().longValue()){
                        tipList.get(i).setLockflag("0");
                        log.info("用户已解锁过此点，标记已解锁");

//                        tipList.get(i).setLockflag("0");
//                        Tip temp = tipList.get(i);
//                        temp.setLockflag("0");
//                        tipList.remove(i);
//                        tipList.add(temp);
                        tipList.get(i).setLockflag("0");
                        Tip temp = tipList.get(i);
                        temp.setLockflag("0");
                        tipList.set(i,temp);
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

    // 最后一个打卡点，查找离这个打卡点最近的打卡点

    /**
     *
     * @param finishpoint
     * @param pointlist  顺序升序
     * @param pulist  打卡时间倒叙
     */
    private Point logic(Point finishpoint, List<Point> pointlist,List<PointUserinfo> pulist){
        List<Point> unlist = new ArrayList<>();
        for(int i=0;i<pointlist.size();i++){
            boolean exist = false;
            for(int j=0;j<pulist.size();j++){
                if(pointlist.get(i).getId()==pulist.get(j).getPointid()){
                    exist = true;
                    break;
                }
            }
            if(!exist){
                unlist.add(pointlist.get(i));
            }
        }
        log.info("未打卡列表："+JSONUtils.toJSON(unlist));
        if(unlist.size()>0){
           return getNumberThree(unlist,finishpoint);

        }else {
            return finishpoint;
        }

    }

    public  Point getNumberThree(List<Point> intarray,Point number){
        int index = Math.abs(number.getShunxu()-intarray.get(0).getShunxu());
        Point result =intarray.get(0);
        for (Point i : intarray) {
            int abs = Math.abs(number.getShunxu()-i.getShunxu());
            if(abs <= index){
                index = abs;
                result = i;
            }
        }

        return result;

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
        message.setShow("1");
        message.setLineid(Long.parseLong(getParam("lineid")));
        List<Message> list = this.messageService.findByProperties(message,null,20,"id","desc");
        Map map = new HashMap();
        //map.put("data", JSONUtils.listToJson(lineList));
        map.put("data", list);
        this.printjson(JSONUtils.toJSON(map));
    }

    /**
     * 分享页面数据加载，背景图随机
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/wx/linedetailshare", method = RequestMethod.GET)
    //@ResponseBody
    public void linedetailshare(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map map = new HashMap();
        this.setReqAndRes(request,response);
        showparam();
        Line line = this.lineService.findById(Line.class,Long.parseLong(getParam("lineid")));
        User user = this.userService.findById(User.class, Long.parseLong(getParam("userid")));
        Point point = new Point();
        point.setLineid(line.getId());
        Long cont = this.pointService.countByProperties(point);
        List<Point> pointList = this.pointService.findByProperties(point,null,100,null,null);
        map.put("point",pointList.get(new Random().nextInt(cont.intValue()) ));

        map.put("data", line);

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
        //已获积分  错误
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
            //lu.setBegintime(System.currentTimeMillis());
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

    //======================login====================================
    @RequestMapping(value = "/adminlogout", method = {RequestMethod.GET,RequestMethod.POST})
    public String adminlogout(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("User") User user) {
        ModelAndView mv = new ModelAndView();
        request.getSession().removeAttribute("user");// .setAttribute("user",u);
            return "login";
    }
    @RequestMapping(value = "/adminlogin", method = {RequestMethod.GET,RequestMethod.POST})
    public String adminlogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("User") User user) {
        ModelAndView mv = new ModelAndView();
        log.info("---------------------");
        User u = this.userService.findByProperties(user);
        if(u!=null){
            log.info("---------dddd------------");
            request.getSession().setAttribute("user",u);
            mv.setViewName("line/list");
            return "redirect:line/list";
        }else {
            log.info("--------------eeeeee-------");
            return "login";
        }

    }

    @RequestMapping(value = "/suipian/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView suipianlist(@ModelAttribute("suipian") Suipian suipian, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Suipian> list = this.suipianService.findByProperties(suipian,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.suipianService.countByProperties(suipian));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("suipian",suipian);
        mv.setViewName("suipian/list");
        return mv;

    }
    @RequestMapping(value = "/suipian/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("suipian") Suipian suipian) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(suipian) && Utils.isNotNullOrEmpty(suipian.getId())) {
            suipian = this.suipianService.findByProperties(suipian);
            mv.addObject(suipian);
            mv.setViewName("suipian/merge");
        }
        mv.setViewName("suipian/merge");
        return mv;
    }

    @RequestMapping(value = "/suipian/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("suipian") Suipian suipian,HttpServletRequest request) throws Exception{
        if(suipian.getId()==null){
            suipian.setLineid(this.baoxiangService.findById(Baoxiang.class,suipian.getBaoxiangid()).getLineid());
            suipianService.save(suipian);
        }else{
            suipian.setLineid(this.baoxiangService.findById(Baoxiang.class,suipian.getBaoxiangid()).getLineid());
            suipian.setBaoxiangname(this.baoxiangService.findById(Baoxiang.class,suipian.getBaoxiangid()).getName());
            suipianService.update(suipian);
        }
        return "redirect:/suipian/list?baoxiangid="+suipian.getBaoxiangid()+"&baoxiangname="+ URLEncoder.encode(suipian.getBaoxiangname(),"UTF-8");
    }

    @RequestMapping(value = "/suipian/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("suipian") Suipian suipian) throws Exception{
        suipian = suipianService.findById(Suipian.class,suipian.getId());
        suipianService.delete(suipian);
        return "redirect:/suipian/list?baoxiangid="+suipian.getBaoxiangid()+"&baoxiangname="+ URLEncoder.encode(suipian.getBaoxiangname(),"UTF-8");
    }

    //==================================================================
    
    //======================baoxiang====================================
    @RequestMapping(value = "/baoxiang/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView baoxianglist(@ModelAttribute("baoxiang") Baoxiang baoxiang, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Baoxiang> list = this.baoxiangService.findByProperties(baoxiang,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.baoxiangService.countByProperties(baoxiang));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("baoxiang",baoxiang);
        mv.setViewName("baoxiang/list");
        return mv;

    }
    @RequestMapping(value = "/baoxiang/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("baoxiang") Baoxiang baoxiang) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(baoxiang) && Utils.isNotNullOrEmpty(baoxiang.getId())) {
            baoxiang = this.baoxiangService.findByProperties(baoxiang);
            mv.addObject(baoxiang);
            mv.setViewName("baoxiang/merge");
        }
        mv.setViewName("baoxiang/merge");
        return mv;
    }

    @RequestMapping(value = "/baoxiang/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("baoxiang") Baoxiang baoxiang,HttpServletRequest request) throws Exception{
        if(baoxiang.getId()==null){
            baoxiangService.save(baoxiang);
            String [] sparr = baoxiang.getDescription().split(";");

            for(int i=0;i<sparr.length;i++ ){
                Suipian suipian = new Suipian();
                suipian.setLineid(baoxiang.getLineid());
                suipian.setBaoxiangname(baoxiang.getName());
                suipian.setBaoxiangid(baoxiang.getId());
                suipian.setName(sparr[i].split(",")[0]);
                suipian.setBianhao(sparr[i].split(",")[1]);
                this.suipianService.save(suipian);

            }
        }else{
            baoxiang.setLinename(this.lineService.findById(Line.class,baoxiang.getLineid()).getName());
            baoxiangService.update(baoxiang);
        }
        return "redirect:/baoxiang/list?lineid="+baoxiang.getLineid()+"&linename="+ URLEncoder.encode(baoxiang.getLinename(),"UTF-8");
    }

    @RequestMapping(value = "/baoxiang/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("baoxiang") Baoxiang baoxiang) throws Exception{
        baoxiang = baoxiangService.findById(Baoxiang.class,baoxiang.getId());
        baoxiangService.delete(baoxiang);
        return "redirect:/baoxiang/list?lineid="+baoxiang.getLineid()+"&linename="+ URLEncoder.encode(baoxiang.getLinename(),"UTF-8");
    }

    //==================================================================
    
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
            Line line = this.lineService.findById(Line.class,message.getLineid());
            message.setLinename(line.getName());
            messageService.save(message);
        }else{
            Line line = this.lineService.findById(Line.class,message.getLineid());
            message.setLinename(line.getName());
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
            Point point = this.pointService.findById(Point.class,tip.getPointid());
            tip.setPointname(point.getName());
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

        for(int i=0;i<list.size();i++){
            list.get(i).setTimestr(Utils.formatLongDate(new Date(list.get(i).getTime()) ));
            list.get(i).setLinename(this.lineService.findById(Line.class,list.get(i).getLineid()).getName());
        }

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
            Line line = this.lineService.findById(Line.class,point.getLineid());
            pointUserinfo.setLinename(line.getName());
        }
        if(Utils.isNotNullOrEmpty(pointUserinfo.getUserid())){
            User user = userService.findById(User.class,pointUserinfo.getUserid());
            pointUserinfo.setUsername(user.getName());
           /* Line line = this.lineService.findById(Line.class,pointUserinfo.getLineid());
            pointUserinfo.setLinename(line.getName());*/
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
        if(line.getLike()!=null && line.getLike().equals("1")){
            convertjingweidu(line,null);
        }

        if(line.getId()==null){
            lineService.save(line);
        }else{
            lineService.update(line);
        }
        return "redirect:/line/list";
    }

    public void convertjingweidu(Line line,Point point){

        try {

        StringBuffer sb = new StringBuffer();
        if(line!=null){
            if(Utils.isNullorEmpty(line.getId())){
                Line old = this.lineService.findById(Line.class,line.getId());
                if(old.getJingdu().equals(line.getJingdu())){
                    return;
                }
            }
            String type = "1";
            if(line.getDescription().contains("1")){
                type = "1";
            }else if(line.getDescription().contains("2")){
                type = "2";
            }else if(line.getDescription().contains("3")){
                type = "3";
            }else if(line.getDescription().contains("4")){
                type = "4";
            }else if(line.getDescription().contains("5")){
                type = "5";
            }else if(line.getDescription().contains("6")){
                type = "6";
            }


            sb.append(line.getWeidu()).append(",").append(line.getJingdu());
            String url = "https://apis.map.qq.com/ws/coord/v1/translate?locations="+sb.toString()+"&type="+type+"&key=IDRBZ-RP53R-WI7WN-W3BAI-HFUU5-JIBEY";
            String res = HttpUtil.sendGet(url);
            log.info("qq-rul: "+url);
            log.info("qq: "+res);
            JSONObject resjson =new JSONObject(res);
            if(resjson.getInt("status") ==0){
                line.setJingdu(resjson.getJSONArray("locations").getJSONObject(0).get("lng").toString() );
                line.setWeidu(resjson.getJSONArray("locations").getJSONObject(0).get("lat").toString() );
            }
        }
        if(point!=null){
            if(Utils.isNullorEmpty(point.getId())){
                Point old = this.pointService.findById(Point.class,point.getId());
                if(old.getJingdu().equals(line.getJingdu())){
                    return;
                }
            }

            sb = new StringBuffer();
            sb.append(point.getWeidu()).append(",").append(point.getJingdu());
            String url = "https://apis.map.qq.com/ws/coord/v1/translate?locations="+sb.toString()+"&type=1&key=IDRBZ-RP53R-WI7WN-W3BAI-HFUU5-JIBEY";
            String res = HttpUtil.sendGet(url);
            log.info("qq-rul: "+url);
            log.info("qq: "+res);
            JSONObject resjson =new JSONObject(res);
            if(resjson.getInt("status") ==0){
                point.setJingdu(resjson.getJSONArray("locations").getJSONObject(0).get("lng").toString() );
                point.setWeidu(resjson.getJSONArray("locations").getJSONObject(0).get("lat").toString() );
            }
        }

        }catch (Exception e){
            e.printStackTrace();
        }
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
        if(point.getLike()!=null && point.getLike().equals("1")){
            convertjingweidu(null,point);
        }

        if(point.getId()==null){
            pointService.save(point);
        }else{
            Line line = this.lineService.findById(Line.class,point.getLineid());
            point.setLinename(line.getName());
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
        String fullpath = Utils.getProperty("basefilepath") + File.separator +fileName;
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
