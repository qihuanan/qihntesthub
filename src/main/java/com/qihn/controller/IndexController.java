package com.qihn.controller;

import com.qihn.pojo.Goods;
import com.qihn.pojo.User;
import com.qihn.service.GoodsService;
import com.qihn.service.UserService;
import com.qihn.utils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

@Controller
public class IndexController extends BaseController {

    private static Log log = LogFactory.getLog(IndexController.class);
    @Resource(name = "goodsService")
    private GoodsService goodsService;
    @Resource(name = "userService")
    private UserService userService;

    public static Map<String,Object> mmap = new HashMap<String, Object>();
    public static double count = 0;

    @RequestMapping(value = "/log", method = {RequestMethod.POST, RequestMethod.GET})
    public void accesslog(HttpServletRequest request,@ModelAttribute("user") User user){
        log.info("accesslog");
        String ip = getLocalIp(request);
        String time = Utils.formatLongDateHH();
        user.setName(ip);
        user.setNice_name(time);
        user.setAge(new Double(count).intValue());
        LogThread lt = new LogThread(userService,user);
        lt.run();

    }

    @RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView web2(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo,HttpServletRequest request) {
        if(count<3){
            User user = this.userService.findByProperties(null,null,1,"id","desc").get(0);
            count = user.getAge();
        }
        count++;

        String ip = getLocalIp(request);
        String time = Utils.formatLongDateHH();
        User user = new User();
        user.setName(ip);
        user.setNice_name(time);
        user.setAge(new Double(count).intValue());
        LogThread lt = new LogThread(userService, user);
        lt.run();


        request.getSession().getServletContext().setAttribute("syscount",count);
        ModelAndView mv = new ModelAndView();

        String huashu = (String)request.getSession().getServletContext().getAttribute("huashu");
        mv.addObject("huashu",huashu);

        String qs = request.getQueryString();

        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        if(goods==null){
            goods = new Goods();
        }
        if(StringUtils.isNotEmpty(goods.getName())){
            Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
            boolean isnum = pattern.matcher(goods.getName()==null?"":goods.getName()).matches();
            if(isnum){
                goods.setSkuid(goods.getName());
                goods.setName(null);
                goods.setDomain(1);
                return this.webSkuidSearch(pageInfo, goods, request);
            }
        }

        List<Goods> list = null;
        if(pageInfo.getCurPage()==1 && StringUtils.isEmpty(qs) && StringUtils.isEmpty(goods.getName())){// 默认没有查询参数进来使用缓存数据
            list= (List<Goods>)mmap.get("list");
            pageInfo = (PageInfo) mmap.get("pageInfo");
            list = null;
            pageInfo = null;
            if(list==null || list.isEmpty()){
                list = goodsService.findByProperties(goods,pageInfo,0," upindex desc, id ","desc");
                pageInfo = new PageInfo();
                pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
                if(list!=null && list.size()>0){
                    mmap.put("list",list);
                    mmap.put("pageInfo",pageInfo);
                }
            }
        }else{
            list = goodsService.findByProperties(goods,pageInfo,0," upindex desc, id ","desc");
            pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        }

        StringBuffer sb  = new StringBuffer();
       /* for(int i=0;i<list.size();i++){
            //sb.append(list.get(i).getCid3Name() ).append(" ");
            //sb.append(list.get(i).getName()).append(" ");
            if(i<10)
            sb.append(list.get(i).getName().substring(0,12)).append(" ");
            //log.info(list.get(i).getName().substring(0,12));
        }*/
        mv.addObject("dtitle", sb.toString());
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("web/web");
        return mv;
    }

    private ModelAndView webSkuidSearch(PageInfo pageInfo,Goods goods,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String huashu = (String)request.getSession().getServletContext().getAttribute("huashu");
        mv.addObject("huashu",huashu);

        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        String orderby = goods.getOrderby()==null?"id":goods.getOrderby();
        String ascdesc = "desc";
        if(orderby.equals("price")) ascdesc = "asc";
        //skuid 查询 先查出当前sku
        List<Goods> list = new ArrayList<>();
        goods = this.goodsService.findByProperties(goods);
        if(goods==null){
            goods = new Goods();
        }else {
            list.add(goods);
        }
        // 查询 于goods 相同的分类的数据
        String cid3 = goods.getCid3();
        String oldskuid = goods.getSkuid()==null?"":goods.getSkuid();
        goods = new Goods();
        goods.setCid3(cid3);
        List<Goods> glist = goodsService.findByProperties(goods,pageInfo,0,orderby,ascdesc);
        if(glist!=null){
            for(int i=0;i<glist.size();i++){
                if(!oldskuid.equals(glist.get(i).getSkuid())){
                    list.add(glist.get(i));
                }
            }
        }
        pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("web/web");
        return mv;
    }

    @RequestMapping(value = "/more", method = { RequestMethod.GET})
    public ModelAndView more(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String orderby = goods.getOrderby()==null?"id":goods.getOrderby();
        String ascdesc = "desc";
        if(orderby.equals("price")) ascdesc = "asc";
        List<Goods> list = goodsService.findByProperties(goods,pageInfo,0," upindex desc, id ","desc");
        mv.addObject("list", list);
        mv.setViewName("web/more");
        return mv;
    }


    public static String getLocalIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if(index != -1){
                return ip.substring(0,index);
            }else{
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            return ip;
        }
        return request.getRemoteAddr();
    }

}
