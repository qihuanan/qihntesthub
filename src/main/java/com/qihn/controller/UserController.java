package com.qihn.controller;


import java.awt.*;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

import javax.annotation.Resource;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.qihn.pojo.Goods;
import com.qihn.pojo.User;
import com.qihn.service.UserService;
import com.qihn.utils.HttpClientUtils;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * https://wq.qihn.com/webportal/cgigw/sku_real_new_price?skuIds=39409291956,33267670921&source=wxsqpage&showJson=1&action=sku_info,real_time_price,new_user_price
 *
 * http://pjapi-test.qihn.com/goods/baseInfo?skuList=761680,100012,313382&baseField=name,category,skuId,shopId,imagePath,brandId

 http://yx.3.cn/service/info.action?id=1823500

 http://d.3.cn/basic/761680?type=scp&source=wxsq

 */

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
    private static Log log = LogFactory.getLog(UserController.class);
    @Resource(name = "userService")
    private UserService userService;



    public static void readFile02() throws IOException {
        FileInputStream fis=new FileInputStream("D:\\201904\\me3.csv");
        InputStreamReader isr=new InputStreamReader(fis, "GBK");
        BufferedReader br = new BufferedReader(isr);
        //简写如下
        //BufferedReader br = new BufferedReader(new InputStreamReader(
        //        new FileInputStream("E:/phsftp/evdokey/evdokey_201103221556.txt"), "UTF-8"));
        String line="";
        String[] arrs=null;
        Map<String,String> camap1 = new HashMap<>();
        Map<String,String> camap2 = new HashMap<>();
        Map<String,String> camap3 = new HashMap<>();
        while ((line=br.readLine())!=null) {
            arrs=line.split(",");
            System.out.println(arrs[0] + " : " + arrs[1] + " : " + arrs[2]+ " : " + arrs[3]+ " : " + arrs[4]+ " : " + arrs[5]);
            camap1.put(arrs[1],arrs[0]);
            camap2.put(arrs[3],arrs[2]);
            camap3.put(arrs[5],arrs[4]);

        }
        System.out.println(" "+camap1.size()+" "+ camap2.size()+" "+camap3.size());
        br.close();
        isr.close();
        fis.close();
    }

    @RequestMapping(value = "/edityh", method = {RequestMethod.GET,RequestMethod.POST})
    public void edityh(@ModelAttribute("user") User user) {
       user = this.userService.findById(User.class,user.getId());
       user.setZhekou(100);
       this.userService.update(user);
        this.print(user.getId());
    }

    @RequestMapping(value = "/del", method = {RequestMethod.GET,RequestMethod.POST})
    public void del(@ModelAttribute("user") User user) {
        this.userService.delete(User.class,user.getId());
        this.print(user.getId());
    }

    /**
     * master
     * @return
     */
    @RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getUserlist(@ModelAttribute("user") User user, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        if(user.getUpdatetime2()==null || user.getUpdatetime2().equals("")){
            user.setUpdatetime2("6");
        }
        user.setUpdatetime(Utils.getDate6(- new Integer(user.getUpdatetime2())).getTime());
        pageInfo.setTotalCount(10000); //userService.countByProperties(user);
        List<User> ulist =null;
        if(StringUtils.isNotEmpty(user.getOrderby())){
            if(user.getOrderby().equals("zhekou")){
                ulist =  this.userService.findByProperties(user,pageInfo,null,"zhekou","asc" );
            }else if(user.getOrderby().equals("youhui") || user.getOrderby().equals("yjyouhui")){
                ulist =  this.userService.findByProperties(user,pageInfo,null,"youhui","desc" );
            }else if( user.getOrderby().equals("yjyouhui")){
                ulist =  this.userService.findByProperties(user,pageInfo,null,"yjyouhui","desc" );
            }else {
                ulist =  this.userService.findByProperties(user,pageInfo,null,"zhekou","asc" );
            }
        }else {
            ulist =  this.userService.findByProperties(user,pageInfo,null,"zhekou","asc" );
        }

        if(ulist!=null){
            this.setgoodsname(ulist);
            for(int i=0;i<ulist.size();i++ ){
                ulist.get(i).setNice_name(Utils.formatLongDate(new Date(ulist.get(i).getUpdatetime()) ) );
            }
        }
        List<User> lastupdate =  this.userService.findByProperties(new User(),null,1,"updatetime","desc" );
        List<User> forestupdate =  this.userService.findByProperties(new User(),null,1,"updatetime","asc" );
        List<User> lastid =  this.userService.findByProperties(new User(),null,1,"id","desc" );
        mv.addObject("ulist",ulist);
        if(lastupdate!=null && lastupdate.size()>0)
            mv.addObject("lastupdate",lastupdate.get(0));
        if(lastid!=null && lastid.size()>0)
            mv.addObject("lastid",lastid.get(0));
        if(forestupdate!=null && forestupdate.size()>0)
            mv.addObject("forestupdate",Utils.formatLongDate(new Date(forestupdate.get(0).getUpdatetime())) );
        mv.addObject("forest",forestupdate.get(0) );

        mv.addObject("userList", ulist);
        mv.addObject("userList", ulist);
        mv.addObject("pageInfo",pageInfo);

        mv.addObject("get1w",GoodsController.get1w);
        mv.addObject("cc",GoodsController.cc);


        mv.addObject("updateflag",GoodsController.updateflag);
        mv.addObject("runflag",GoodsController.runflag);
        mv.addObject("user",user);
        mv.setViewName("user/userList");
        return mv;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView getAdd(@ModelAttribute("user") User user) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(user) && Utils.isNotNullOrEmpty(user.getId())) {
            user = this.userService.findByProperties(user);
            mv.addObject(user);
            mv.setViewName("user/userMerge");
        }
        mv.setViewName("user/userMerge");
        return mv;
    }

    @RequestMapping(value = "/editDone", method = RequestMethod.POST)
    public String add(@ModelAttribute("user") User user) throws Exception{

       /* User suser = new User();
        BeanUtils.copyProperties(user,suser);
        List<User> list = new ArrayList<>();
        list.add(user);
        list.add(suser);
        userService.testexception(list);*/

        if(user.getId()==null){
            userService.save(user);
        }else{
            userService.update(user);
        }
        return "redirect:/user/list";
    }


    @RequestMapping(value = "/save/{userid}", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("userAttribute") User user, @PathVariable Long userid) {
        userService.update(user);
        return "redirect:/user/list";
    }



    public void setgoodsname(List<User> userList){
        try{
            StringBuffer skuids = new StringBuffer();
            for(int i=0;i<userList.size();i++){
                if(StringUtils.isEmpty(userList.get(i).getName())){
                    skuids.append(userList.get(i).getGid()).append(",");
                }
            }
            skuids = new StringBuffer( skuids.toString().substring(0,skuids.length()-1));
            String url = "https://wq.qihn.com/webportal/cgigw/sku_real_new_price?source=wxsqpage&showJson=1&action=sku_info,real_time_price,new_user_price&skuIds=";

            String str =  HttpClientUtils.getDataFromUri(url+skuids,null);
            log.info("url: "+url+skuids );
            if(str!=null){
                JSONObject json = new JSONObject(str);
                if(json.getInt("errCode")==0){
                    JSONObject skujson = json.getJSONObject("data").getJSONObject("skuInfo");
                    for(int i=0;i<userList.size();i++){
                        User u = userList.get(i);
                        if(StringUtils.isEmpty(u.getName())){
                            String name = skujson.getJSONObject(u.getGid()+"").getJSONObject("info").getString("name");
                            u.setName(name);
                            this.userService.update(u);
                            userList.get(i).setName(name);
                        }
                    }

                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void main(String args[]){
        try {

        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        String curDate = df.format(new Date());
        String curDate1 = "14:59:59";
        String curDate2 = "15:00:01";
        System.out.println(df.format(new Date()));
        //sdf.parse(sdf.format(new Date()));
            long t = df.parse(curDate).getTime();
            long t1 = df.parse(curDate1).getTime();
            long t2 = df.parse(curDate2).getTime();

             //t1 = t+1000;
             //t2 = t+2000;
            int i=0;
            while (t<t1){
                t = df.parse(df.format(new Date())).getTime();
                Thread.sleep(100);
                System.out.println("不到."+df.format(new Date())+" "+i++);
            }
            //Thread.sleep(100);
            int j=0;
        while (t< t2 && j<10){
            j++;
            t = df.parse(df.format(new Date())).getTime();
            System.out.println("hit: "+t +" "+" t1:"+t1+" t2:"+t2 );
            URI uri =null;

            String quan_15_618_300 = "https://coupon.qihn.com/ilink/couponSendFront/send_index.action?key=5295463f6ce84ae8afce9624093e2fab&roleId=6932641&to=sale.qihn.com/act/bgx0ywve5awmvnxp.html&";
            uri = new URI(quan_15_618_300);
            Desktop.getDesktop().browse(uri);



           /* String ziyingfushi10142022 = "https://coupon.qihn.com/ilink/couponSendFront/send_index.action?key=cd5b21c57ccd4cb0b19a2b0c3402943f&roleId=7021161&to=sale.qihn.com/act/a3x6w2dhqio.html&";
            uri = new URI(ziyingfushi10142022);
            Desktop.getDesktop().browse(uri);

            ziyingfushi10142022 = "https://coupon.qihn.com/ilink/couponSendFront/send_index.action?key=1f58f6b900ac4b21a3bd8ff4bba0dce1&roleId=6917644&to=sale.qihn.com/act/yirzxqbsruwv6.html&";
            uri = new URI(ziyingfushi10142022);
            Desktop.getDesktop().browse(uri);*/

            //
            System.out.println("hit: "+ new SimpleDateFormat("HH:mm:ss:SSS").format(new Date()) );
            Thread.sleep(50);

        }

            System.out.println("end ");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
