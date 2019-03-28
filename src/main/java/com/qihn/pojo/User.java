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

    @Column(name = "age")
    private Integer age;



    @Column(name = "gid")
    private Long gid;

    @Column(name = "price")
    private Integer price;

    @Column(name = "price2")
    private Integer price2;//上次价格

    @Column(name = "price3")
    private Integer price3;//本次价格

    @Column(name = "pricelowest")
    private Integer pricelowest;//最低价格

    @Column(name = "oneflag")
    private Integer oneflag;

    @Column(name = "zhekou")
    private Integer zhekou;

    @Column(name = "youhui")
    private Integer youhui;// 和上次比的优惠额

    @Column(name = "yjyouhui")
    private Integer yjyouhui;//和当前 原价比 优惠额

    @Column(name = "updatetime")
    private Long updatetime;

    @Column(name = "couponprom")
    private String couponprom;

    @Column(name = "onsale")
    private String onsale = "1";

    @Column(name = "nice_name", length = 500)
    private String nice_name;
    //vo
    private String updatetime2;
    private String orderby;

    public String getOrderby() {
        return orderby;
    }

    public void setOrderby(String orderby) {
        this.orderby = orderby;
    }

    public String getUpdatetime2() {
        return updatetime2;
    }

    public void setUpdatetime2(String updatetime2) {
        this.updatetime2 = updatetime2;
    }


    @Override
    public String toString() {
        return "User [id=" + id + ", user_name=" + name + ", age=" + age
                + ", nice_name=" + nice_name + "]";
    }

    public String getOnsale() {
        return onsale;
    }

    public void setOnsale(String onsale) {
        this.onsale = onsale;
    }

    public Long getGid() {
        return gid;
    }

    public Integer getZhekou() {
        return zhekou;
    }

    public Integer getPrice3() {
        return price3;
    }

    public void setPrice3(Integer price3) {
        this.price3 = price3;
    }

    public String getCouponprom() {
        return couponprom;
    }

    public void setCouponprom(String couponprom) {
        this.couponprom = couponprom;
    }

    public void setZhekou(Integer zhekou) {
        this.zhekou = zhekou;
    }

    public Long getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Long updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getYouhui() {
        return youhui;
    }

    public void setYouhui(Integer youhui) {
        this.youhui = youhui;
    }

    public Integer getYjyouhui() {
        return yjyouhui;
    }

    public void setYjyouhui(Integer yjyouhui) {
        this.yjyouhui = yjyouhui;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public final Long getId() {
        return id;
    }

    public final void setId(Long id) {
        this.id = id;
    }

    public final String getName() {
        return name;
    }

    public final void setName(String name) {
        this.name = name;
    }

    public final Integer getAge() {
        return age;
    }

    public final void setAge(Integer age) {
        this.age = age;
    }

    public final String getNice_name() {
        return nice_name;
    }

    public final void setNice_name(String nice_name) {
        this.nice_name = nice_name;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getOneflag() {
        return oneflag;
    }

    public void setOneflag(Integer oneflag) {
        this.oneflag = oneflag;
    }

    public Integer getPrice2() {
        return price2;
    }

    public void setPrice2(Integer price2) {
        this.price2 = price2;
    }

    public Integer getPricelowest() {
        return pricelowest;
    }

    public void setPricelowest(Integer pricelowest) {
        this.pricelowest = pricelowest;
    }
}