package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "WeItemUser")
public class WeItemUser implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column()
    private Long id;

    @Column()
    private String name;

    @Column
    private Long userid;

    @ManyToOne
    @JoinColumn()
    private User user;

    @Column
    private Long weItemid;

    @ManyToOne
    @JoinColumn()
    private WeItem weItem;

    @Column()
    private String cate; //1 喜欢  2 购物车  3 已预订  4 已完成  5已取消已删除
    @Column()
    private Integer num; // 加入购物车数量
    @Column()
    private String yudingdate;// 预定日期
    @Column()
    private String quhuodate;// 取货日期

    @Column()
    private String remark;

    @Column()
    private Double price;
    @Column()
    private Double totalPrice;

    @Column()
    private String createtime;
    @Column()
    private String updatetime;


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

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getWeItemid() {
        return weItemid;
    }

    public void setWeItemid(Long weItemid) {
        this.weItemid = weItemid;
    }

    public WeItem getWeItem() {
        return weItem;
    }

    public void setWeItem(WeItem weItem) {
        this.weItem = weItem;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getYudingdate() {
        return yudingdate;
    }

    public void setYudingdate(String yudingdate) {
        this.yudingdate = yudingdate;
    }

    public String getQuhuodate() {
        return quhuodate;
    }

    public void setQuhuodate(String quhuodate) {
        this.quhuodate = quhuodate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
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
}
