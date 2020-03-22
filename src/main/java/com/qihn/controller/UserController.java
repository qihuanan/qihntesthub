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


@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
    private static Log log = LogFactory.getLog(UserController.class);
    @Resource(name = "userService")
    private UserService userService;


}
