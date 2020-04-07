package com.qihn.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "User")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    public User() {
        super();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "name", length = 500)
    private String name;

    @Column(name = "openid", length = 100)
    private String openid;

    @Column(name = "avatarUrl")
    private String avatarUrl;

    @Column()
    private Integer score=0;
    @Column()
    private String mobile;
    @Column()
    private String linkopenid;
    @Column()
    private String linkmobile;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getLinkopenid() {
        return linkopenid;
    }

    public void setLinkopenid(String linkopenid) {
        this.linkopenid = linkopenid;
    }

    public String getLinkmobile() {
        return linkmobile;
    }

    public void setLinkmobile(String linkmobile) {
        this.linkmobile = linkmobile;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}