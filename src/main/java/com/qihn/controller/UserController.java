package com.qihn.controller;


import java.awt.*;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.qihn.pojo.Goods;
import com.qihn.pojo.User;
import com.qihn.service.UserService;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user")
public class UserController {
    private static Log log = LogFactory.getLog(UserController.class);
    @Resource(name = "userService")
    private UserService userService;

    /**
     * master
     * @return
     */
    @RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getUserlist(@ModelAttribute("goods") User user, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        List<User> userList = userService.findByProperties(user,pageInfo,0,"id ","desc");
        userService.countByProperties(user);
        mv.addObject("userList", userList);
        mv.addObject("pageInfo",pageInfo);
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

            String quan_15_618_300 = "https://coupon.jd.com/ilink/couponSendFront/send_index.action?key=5295463f6ce84ae8afce9624093e2fab&roleId=6932641&to=sale.jd.com/act/bgx0ywve5awmvnxp.html&";
            uri = new URI(quan_15_618_300);
            Desktop.getDesktop().browse(uri);



           /* String ziyingfushi10142022 = "https://coupon.jd.com/ilink/couponSendFront/send_index.action?key=cd5b21c57ccd4cb0b19a2b0c3402943f&roleId=7021161&to=sale.jd.com/act/a3x6w2dhqio.html&";
            uri = new URI(ziyingfushi10142022);
            Desktop.getDesktop().browse(uri);

            ziyingfushi10142022 = "https://coupon.jd.com/ilink/couponSendFront/send_index.action?key=1f58f6b900ac4b21a3bd8ff4bba0dce1&roleId=6917644&to=sale.jd.com/act/yirzxqbsruwv6.html&";
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
