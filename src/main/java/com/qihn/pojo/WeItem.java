package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "WeItem")
public class WeItem implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column()
    private Long id;

    @Column()
    private String name;
    @Column()
    private String remark;

    @Column
    private String picture1;
    @Column
    private String picture2;
    @Column
    private String picture3;

    @Column()
    private Integer status;

    @Column()
    private Integer index;
    @Column()
    private Double price;
    @Column()
    private String priceUnit;

    @Column()
    private String createtime;
    @Column()
    private String updatetime;

    @Column
    private Long userid;

    @ManyToOne
    @JoinColumn()
    private User user;

    @Column
    private Long weShopid;
    @ManyToOne
    @JoinColumn()
    private WeShop weShop;

    @ManyToOne
    @JoinColumn()
    private WeCate weCate;

    public Long getId() {
        return id;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPicture1() {
        return picture1;
    }

    public void setPicture1(String picture1) {
        this.picture1 = picture1;
    }

    public String getPicture2() {
        return picture2;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Long getWeShopid() {
        return weShopid;
    }

    public void setWeShopid(Long weShopid) {
        this.weShopid = weShopid;
    }

    public void setPicture2(String picture2) {
        this.picture2 = picture2;
    }

    public String getPicture3() {
        return picture3;
    }

    public void setPicture3(String picture3) {
        this.picture3 = picture3;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPriceUnit() {
        return priceUnit;
    }

    public void setPriceUnit(String priceUnit) {
        this.priceUnit = priceUnit;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public WeShop getWeShop() {
        return weShop;
    }

    public void setWeShop(WeShop weShop) {
        this.weShop = weShop;
    }

    public WeCate getWeCate() {
        return weCate;
    }

    public void setWeCate(WeCate weCate) {
        this.weCate = weCate;
    }
}
