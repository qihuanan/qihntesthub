package com.qihn.service;

import com.qihn.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by qihuanan on 2017/5/19.
 */


public interface UserService extends BaseService<User> {

    public void testexception(List<User> list) throws  Exception;


}
