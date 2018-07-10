package com.qihn.controller;

import com.qihn.pojo.Goods;
import com.qihn.service.GoodsService;
import com.qihn.service.GoodsService;
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
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

    private static Log log = LogFactory.getLog(GoodsController.class);
    @Resource(name = "goodsService")
    private GoodsService goodsService;

    public static Map<String,Object> mmap = new HashMap<String, Object>();

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

    public static void main(String args[]){
        String str = "23.9";
        System.out.println(new Double(str).longValue());
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


    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView list(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        List<Goods> list = goodsService.findByProperties(goods,pageInfo,0,"id","desc");
        pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("goods/list");
        return mv;
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

}
