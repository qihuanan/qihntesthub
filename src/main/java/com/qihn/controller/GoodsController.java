package com.qihn.controller;

import com.qihn.pojo.Goods;
import com.qihn.pojo.User;
import com.qihn.service.GoodsService;
import com.qihn.service.GoodsService;
import com.qihn.service.UserService;
import com.qihn.utils.*;
import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

    private static Log log = LogFactory.getLog(GoodsController.class);
    @Resource(name = "goodsService")
    private GoodsService goodsService;
    @Resource(name = "userService")
    private UserService userService;


    public static Map<String,Object> mmap = new HashMap<String, Object>();




    public  static void main(String args[]){
        Goods goods = new Goods();
        goods.setRecpoint(" 宝宝最喜欢的小鞋子！多种款式选择~加绒加厚不受冻，宝防滑耐磨鞋底，妈更放心！\n" +
                "\n" +
                " 儿童ins超火运动鞋男童休闲棉鞋子\n" +
                "-------------\n" +
                "商城价：89\n" +
                "内购价：49\n" +
                "\n" +
                "抢券+下单：https://u.jd.com/25Q7Zf\n" +
                "抢券+下单2：https://u.jd.com/KhvxjC \n" +
                "--------------\n" +
                "赠运费险购物无忧");

        Matcher matcher = Patterns.WEB_URL.matcher(goods.getRecpoint());
        Map<String,String> tmap = new HashMap<>();
        if (matcher.find()){
            String url = matcher.group();
            String result = goods.getRecpoint();
            System.out.println(url);
            String uuid = UUID.randomUUID().toString();
            result = result.replace(url,uuid);
            tmap.put(uuid,url);
            while (geturlfirst(result)!=null){
                 url  = geturlfirst(result);
                System.out.println(url);
                uuid = UUID.randomUUID().toString();
                result = result.replace(url,uuid);
                tmap.put(uuid,url);
            }
            System.out.println(result);
            for (Map.Entry<String, String> entry : tmap.entrySet()) {
                //resultText += "<a href=\"" + matcher.group() + "\">" + matcher.group() + "</a>";
               result = result.replace(entry.getKey(), "<a href=\"" + entry.getValue() + "\">" + entry.getValue() + "</a>");
            }
            System.out.println(result);
        }



        //System.out.println("rec:"+goods.getRecpoint());
        String url = "http://japi.jingtuitui.com/api/universal";
        String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&content="+goods.getRecpoint();
        String str =  HttpUtil.sendPost(url,data);
        System.out.println(str);
        Map remap = JSONUtils.fromJson(str,Map.class);

    }

    @RequestMapping(value = "/upindex", method = {RequestMethod.POST, RequestMethod.GET})
    public String upindexbyUV(){
        List<Object> list = this.userService.findByHQL(" SELECT DISTINCT(gid) as cgid from `user` WHERE gid is not null GROUP BY gid,nice_name ORDER BY nice_name DESC, cgid DESC LIMIT 3;",null);
        if(list!=null && list.size()>0){
            Goods goods = null;
            for(int i=0;i<list.size();i++){
                long gid = new Long(list.get(i).toString());
               goods = this.goodsService .findById(Goods.class,gid);
                if(goods!=null){
                    goods.setUpindex(2);
                    this.goodsService.update(goods);
                }
            }
        }

        return "redirect:/goods/list";
    }

    @RequestMapping(value = "/resetindex", method = {RequestMethod.POST, RequestMethod.GET})
    public String resetindex(){
        List<Object> list = this.userService.findByHQL(" SELECT DISTINCT(gid) as cgid from `user` WHERE gid is not null GROUP BY gid,nice_name ORDER BY nice_name DESC, cgid DESC LIMIT 3;",null);
        if(list!=null && list.size()>0){
            Goods goods = null;
            for(int i=0;i<list.size();i++){
                long gid = new Long(list.get(i).toString());
                goods = this.goodsService .findById(Goods.class,gid);
                if(goods!=null){
                    goods.setUpindex(0);
                    this.goodsService.update(goods);
                }
            }
        }

        return "redirect:/goods/list";
    }

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView list(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        List<Goods> list = goodsService.findByProperties(goods,pageInfo,0," upindex desc, id ","desc");
        pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);

        StringBuffer sb = new StringBuffer();
        if(list!=null){
            for(int i=0;i<list.size();i++){
                if(i>5) break;
                String newurl = "http://in-qq.com/#"+list.get(i).getId();
                String temp ="^^^^";
                String result = list.get(i).getRecpoint();
                while (geturlfirst(result)!=null){
                   String url  = geturlfirst(result);
                    result = result.replace(url,temp);
                }
                result = result.replace(temp,newurl);
                sb.append(result).append(" \n\n ");
            }
        }
        mv.addObject("linestr",sb.toString());
        mv.setViewName("goods/list");
        return mv;
    }

    @RequestMapping(value = "/mergeUIRecpoint", method = RequestMethod.POST)
    public ModelAndView mergeUIRecpoint(@ModelAttribute("goods") Goods goods) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(goods) && Utils.isNotNullOrEmpty(goods.getRecpoint())) {
            try {
            //goods.setRecpoint(Html2Text(goods.getRecpoint()));
            goods.setRecpoint(URLEncoder.encode(goods.getRecpoint(),"UTF-8"));
            log.error("recpoint: "+goods.getRecpoint());
            String url = "http://japi.jingtuitui.com/api/universal";
            String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&content="+goods.getRecpoint();
            String str =  HttpUtil.sendPost(url,data);
            log.error("转链后str:"+str);

                JSONObject json = new JSONObject(str);
                if(json.get("return").equals("0")){
                    goods.setSkupicture(json.getString("imgUrl"));
                    String result = json.getString("result");
                    goods.setRecpoint(result);//转链接后的原始内容
                    Matcher matcher = Patterns.WEB_URL.matcher(result);

                    Map<String,String> tmap = new HashMap<>();
                    if (matcher.find()){
                         url = matcher.group();
                        goods.setSkulink(url);// 单个商品的链接 设置链接，如果是线报，不设置此链接
                        String uuid = UUID.randomUUID().toString();
                        result = result.replace(url,uuid);
                        tmap.put(uuid,url);
                        while (geturlfirst(result)!=null){
                            goods.setSkulink(null);// 线报多个url的时候清空单个sku的链接
                            url  = geturlfirst(result);
                            //System.out.println(url);
                            uuid = UUID.randomUUID().toString();
                            result = result.replace(url,uuid);
                            tmap.put(uuid,url);
                        }
                        System.out.println("uuid替换后："+result);
                        for (Map.Entry<String, String> entry : tmap.entrySet()) {
                            //resultText += "<a href=\"" + matcher.group() + "\">" + matcher.group() + "</a>";
                            result = result.replace(entry.getKey(), "<a href=\"" + entry.getValue() +  "\""+ " style=\"color:#f85000;\"" + ">" + entry.getValue() + "</a>");
                            result = result.replace("抢券","");
                            result = result.replace("+","");
                            result = result.replace("下单","内购");
                            result = result.replace("抢购","内购");
                        }
                        System.out.println("自动链接后："+result);
                        // 网页显示使用的字段，自带链接的
                        goods.setName(result);
                    }
                    /*if (matcher.find()){
                        String skulink = matcher.group();
                        //result = result.replace(skulink,"点击直达！");
                        goods.setSkulink(skulink);
                        goods.setRecpoint(result);
                    }*/
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            //goods.setName(yinhao(goods.getName()));
            //goods.setRecpoint(yinhao(goods.getRecpoint()));
            mv.addObject(goods);
            mv.setViewName("goods/merge");
        }

        mv.setViewName("goods/merge");
        return mv;
    }

    @RequestMapping(path = "/skuExist",method = RequestMethod.GET)
    @ResponseBody
    public Object skuExist(HttpServletRequest request, HttpServletResponse response) {
        String skuid = request.getParameter("skuid");
        Goods g = new Goods();
        g.setSkuid(skuid);
        g.setDomain(1);
        g = this.goodsService.findByProperties(g);
        if(g!=null && g.getId()!=null){
            return g.getSkuid()+"";
        }else{
            return "0";
        }
    }



    @RequestMapping(value = "/web", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView web(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo,HttpServletRequest request) {
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
        String orderby = goods.getOrderby()==null?"id":goods.getOrderby();
        String ascdesc = "desc";
        if(orderby.equals("price")) ascdesc = "asc";
        List<Goods> list = null;
        if(orderby.equals("id") && ascdesc.equals("desc") && StringUtils.isEmpty(qs) && StringUtils.isEmpty(goods.getName())){// 默认没有查询参数进来使用缓存数据
            list= (List<Goods>)mmap.get("list");
            pageInfo = (PageInfo) mmap.get("pageInfo");
            if(list==null || list.isEmpty()){
                list = goodsService.findByProperties(goods,pageInfo,0,goods.getOrderby(),ascdesc);
                pageInfo = new PageInfo();
                pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
                if(list!=null && list.size()>0){
                    mmap.put("list",list);
                    mmap.put("pageInfo",pageInfo);
                }
            }
        }else{
            list = goodsService.findByProperties(goods,pageInfo,0,goods.getOrderby(),ascdesc);
            pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        }

        StringBuffer sb  = new StringBuffer();
        for(int i=0;i<list.size();i++){
            //sb.append(list.get(i).getCid3Name() ).append(" ");
            //sb.append(list.get(i).getName()).append(" ");
            if(i<10)
            sb.append(list.get(i).getName().substring(0,12)).append(" ");
            //log.info(list.get(i).getName().substring(0,12));
        }
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

    @RequestMapping(path = "/hisPrice2",method = RequestMethod.GET)
    @ResponseBody
    public Object getMMMPrice2(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getParameter("url");
        String token = request.getParameter("token");
        //http://tool.manmanbuy.com/history.aspx?action=gethistory&url=http%253A%2F%2Fitem.jd.com%2F3734874.html&token=4sze53bc96e9093faf34eaed11d0bc544a7e
        String url = "http://tool.manmanbuy.com/history.aspx?action=gethistory&url="+uri+"&token="+token;
        String str =  HttpClientUtils.getDataFromUri(url,null);
        log.info("res: "+str);
        JSONObject json = new JSONObject(str);
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        StringBuffer sb = new StringBuffer();
        try{
            if(json.get("lowerPrice")!=null){
                if(json.get("spName").toString().contains("一步赢")){
                    log.error("获取价格失败 "+url);
                    return "暂未收藏";
                }
                sb.append(json.get("lowerPrice").toString().replace("\"",""));
            }

            return sb.toString();

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(path = "/hisPrice",method = RequestMethod.GET)
    @ResponseBody
    public Object getMMMPrice(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getParameter("url");
        String token = request.getParameter("token");
        String gid = request.getParameter("id");
        //http://tool.manmanbuy.com/history.aspx?action=gethistory&url=http%253A%2F%2Fitem.jd.com%2F3734874.html&token=4sze53bc96e9093faf34eaed11d0bc544a7e
        String url = "http://tool.manmanbuy.com/history.aspx?action=gethistory&url="+uri+"&token="+token;
        String str =  HttpClientUtils.getDataFromUri(url,null);
        log.info("res: "+str);
        JSONObject json = new JSONObject(str);
        log.info("处理完成。");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        StringBuffer sb = new StringBuffer();
        try{
            if(json.get("lowerPrice")!=null){
                if(json.get("spName").toString().contains("一步赢")){
                    log.error("获取价格失败 "+url);
                    return "暂未收藏价格";
                }
                sb.append(json.get("lowerPrice").toString().replace("\"",""));
                Goods g = this.goodsService.findById(Goods.class,new Long(gid));
                if(g!=null){
                    log.info(sb.toString());
                    g.setPricel(new Float(sb.toString()));
                    this.goodsService.update(g);
                    log.info("历史价格更新成功 "+g.getId());
                }

            }

            return sb.toString();

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }



    @RequestMapping(path = "/jttGoodDetail",method = RequestMethod.GET)
    @ResponseBody
    public String jttGoodDetail(HttpServletRequest request, HttpServletResponse response){
        Map remap =new HashMap();
        //url: "http://japi.jingtuitui.com/api/get_goods_info",
        //            //data:"appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&gid="+skuid,
        String skuid = request.getParameter("skuid");
        String addupdate = request.getParameter("type");// 1 add 2 upate
        log.error("skuid  "+skuid+ " addupdate "+addupdate);
        if(addupdate.equals("1")){
            Goods g = new Goods();
            g.setSkuid(skuid);
            g.setDomain(1);
            g = this.goodsService.findByProperties(g);
            if(g!=null && g.getId()!=null){
                return g.getId()+"";
            }
        }

        String url = "http://japi.jingtuitui.com/api/get_goods_info";
        String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&gid="+skuid;
        String str =  HttpUtil.sendPost(url,data);
        log.error("jtt2 "+str);
        remap = JSONUtils.fromJson(str,Map.class);

        url = "http://japi.jingtuitui.com/api/get_goods_link";
        data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&gid="+skuid;
        str =  HttpUtil.sendPost(url,data);
        log.error("jtt3 "+str);

        Map remap2 =JSONUtils.fromJson(str,Map.class);
        if(remap2!=null && remap2.get("return").equals("0")){
            remap.put("result2",remap2.get("result"));
        }

        try {
            log.error("reobj: "+JSONUtils.toJSON(remap));
            return saveGoods(remap,skuid);
            //return JSONUtils.toJSON(remap);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }

    public static String geturlfirst(String str){
        Matcher matcher = Patterns.WEB_URL.matcher(str);
        if (matcher.find()){
            return matcher.group();
        }
        return null;
    }
    /**
     * {
     * 	"return": "0",
     * 	"result": {
     * 		"cid": 1320,
     * 		"cid2": 5019,
     * 		"cid2Name": "进口食品",
     * 		"cid3": 5023,
     * 		"cid3Name": "冲调品",
     * 		"cidName": "食品饮料",
     * 		"commisionRatioPc": 5,
     * 		"commisionRatioWl": 5,
     * 		"endDate": 32472115200000,
     * 		"goodsName": "韩国进口 家乐氏（Kellogg’s）谷脆格 进口谷物 即食冲饮 营养谷物早餐300g",
     * 		"imgUrl": "http://img14.360buyimg.com/n1/jfs/t20032/25/947831366/234812/4ab2b6da/5b0f6a07Nabecdcbc.jpg",
     * 		"inOrderCount": 5478,
     * 		"isFreeFreightRisk": 0,
     * 		"isFreeShipping": 2,
     * 		"isJdSale": 1,
     * 		"isSeckill": 0,
     * 		"materialUrl": "http://item.jd.com/874171.html",
     * 		"shopId": 1000013642,
     * 		"skuId": 874171,
     * 		"startDate": 1528473600000,
     * 		"unitPrice": 24.8,
     * 		"vid": 1000013642,
     * 		"wlUnitPrice": 24.8
     *        },
     * 	"result2": {
     * 		"link": "https://union-click.jd.com/jdc?d=3GvDtm"
     *    }
     * }
     * @param remap2
     */
    private String saveGoods( Map remap2,String skuid){
        try {
            JSONObject obj = new JSONObject(JSONUtils.toJSON(remap2)) ;
            Goods g = new Goods();
            g.setSkuid(skuid);
            g.setDomain(1);
            g = this.goodsService.findByProperties(g);
            if(g!=null && g.getId()!=null){
            }else{
                g = new Goods();
            }

            g.setDomain(1);
            g.setBrand("");
            g.setCate("");
            g.setEndtime(obj.getJSONObject("result").getLong("endDate"));
            g.setLinktype("jtt");
            g.setName(obj.getJSONObject("result").getString("goodsName"));
            g.setPrice(Float.parseFloat(obj.getJSONObject("result").get("wlUnitPrice").toString()));
            g.setPricel(Float.parseFloat(obj.getJSONObject("result").get("wlUnitPrice").toString()));
            g.setRatio(obj.getJSONObject("result").getInt("commisionRatioWl"));
            g.setRecpoint(new SimpleDateFormat("MM-dd HH:mm").format(new Date()));
            g.setSkuid(skuid);
            g.setSkulink(obj.getJSONObject("result2").getString("link"));
            g.setSkupicture(obj.getJSONObject("result").getString("imgUrl"));
            g.setUpdatetime(new Date().getTime());
            g.setUpindex(0);
            g.setCid(obj.getJSONObject("result").getInt("cid")+"");
            g.setCid2(obj.getJSONObject("result").getInt("cid2")+"");
            g.setCid3(obj.getJSONObject("result").getInt("cid3")+"");
            g.setCidName(obj.getJSONObject("result").getString("cidName")+"");
            g.setCid2Name(obj.getJSONObject("result").getString("cid2Name"));
            g.setCid3Name(obj.getJSONObject("result").getString("cid3Name"));
            g.setMaterialUrl(obj.getJSONObject("result").getString("materialUrl"));
            g.setInOrderCount(obj.getJSONObject("result").getInt("inOrderCount"));

            g.setUpdatetime(new Date().getTime());
            g.setRemark(new SimpleDateFormat("MM-dd HH:mm").format(new Date()));


            if(g.getId()==null){
                this.goodsService.save(g);
                g = goodsService.findByProperties(g);
            }else {
                this.goodsService.update(g);
            }

            return g.getId()+"";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }




    @RequestMapping(value = "/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("goods") Goods goods) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(goods) && Utils.isNotNullOrEmpty(goods.getId())) {
            goods = this.goodsService.findByProperties(goods);
            mv.addObject(goods);
            mv.setViewName("goods/merge");
        }
        mv.setViewName("goods/merge");
        return mv;
    }

    @RequestMapping(value = "/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("goods") Goods goods,HttpServletRequest request) throws Exception{

        String huashu = goods.getHuashu();
        request.getSession().getServletContext().setAttribute("huashu",huashu);
        goods.setHuashu(null);
        goods.setUpdatetime(new Date().getTime());
        goods.setRemark(new SimpleDateFormat("MM-dd HH:mm").format(new Date()));
        if(goods.getId()==null){
            goodsService.save(goods);
        }else{
            goodsService.update(goods);
        }
        return "redirect:/goods/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("goods") Goods goods) throws Exception{

        goodsService.delete(goods);
        return "redirect:/goods/list";
    }

    public static String yinhao(String str){
        if(str==null) return null;
        if (str.indexOf("'") >= 0)
            str = str.replaceAll("'", "~~~");
        if (str.indexOf("\"") >= 0)
            str = str.replaceAll("\"", "^^^");
        return str;
    }

    public static String yinhaoback(String str){
        if(str==null) return null;
        if (str.indexOf("~~~") >= 0)
            str = str.replaceAll("~~~", "'");
        if (str.indexOf("^^^") >= 0)
            str = str.replaceAll("^^^", "\"");
        return str;
    }
}
