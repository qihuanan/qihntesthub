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
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URL;
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


    @RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getUserlist(@ModelAttribute("goods") Goods goods, @ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();
        if (pageInfo == null) {
            pageInfo = new PageInfo();
        }
        List<Goods> list = this.goodsService.findByProperties(goods,pageInfo,null,"id","desc");
        pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("goods",goods);
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
