package com.qihn.controller;


import com.google.common.base.Objects;
import com.google.common.collect.Maps;
import com.qihn.pojo.User;
import com.qihn.service.UserService;
import com.qihn.utils.FutureMap;
import com.qihn.utils.FutureMaps;
import com.qihn.utils.Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;


@Controller
@RequestMapping("/user2")
public class UserAsyncController extends BaseController {
    private static Log log = LogFactory.getLog(UserAsyncController.class);

    private AsyncTaskExecutor asyncTaskExecutor;

    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping(value = "/list4", method = RequestMethod.GET)
    public String test() throws Exception {

        final Map<String, Object> resultMap = Maps.newHashMap();

        FutureMap<String, Future<Object>> futureMap = FutureMaps.newFutureMap();

        log.info("aaaaaa中文测试");
        futureMap.put("count", asyncTaskExecutor.submit(() -> userService.countByProperties(new User()) ));
        log.info("bbbbbbb");
        futureMap.put("list", asyncTaskExecutor.submit(() -> userService.findByProperties(new User()) ));
        log.info("ccccccccc");

        try {
            futureMap.forEach((k, v) -> resultMap.put(k, v.get(100000, TimeUnit.MILLISECONDS)));
        } finally {
            futureMap.forEach((k, v) -> v.cancel(true));
        }

        log.info("ddddddddddd");
        return "user/userList";
    }


    @RequestMapping(value = "/list2", method = RequestMethod.GET)
    public ModelAndView getUserlist2(HttpServletRequest request, Model model) {

        ModelAndView mv = new ModelAndView();
        List<User> userList = null;//userService.findAll(User.class, null, null);
        //System.out.println("log======table 'user' all records:" + userList.size());

        Object obj = asyncContext.submit2(request,()-> userService.findAll(User.class,null,null));
        FutureTask<List<User>> futureTask = (FutureTask<List<User>>)obj;
        try {
            userList = futureTask.get(20000, TimeUnit.MILLISECONDS);
            log.info("aaaaaaaaaa "+userList.size());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        } catch (TimeoutException e) {
            e.printStackTrace();
        }


        mv.addObject("userList", userList );
        mv.setViewName("user/userList");
        return mv;
    }

    @RequestMapping(value = "/list3", method = RequestMethod.GET)
    @ResponseBody
    public void getUserlist3(HttpServletRequest request, Model model) {

        asyncContext.submit(request,()-> userService.findAll(User.class,null,null).toString());


    }


    //GET SET

    public void setAsyncTaskExecutor(AsyncTaskExecutor asyncTaskExecutor) {
        this.asyncTaskExecutor = asyncTaskExecutor;
    }
}
