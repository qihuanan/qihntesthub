package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Line")
public class Line implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "name", length = 500)
    private String name;

    @Column(name = "description", length = 500)
    private String description;

    @Column
    private String picture1;
    @Column
    private String picture2;
    @Column
    private String picture3;

    @Column
    private String jingdu;
    @Column
    private String weidu;

    @Column
    private String changdu;
    @Column
    private String dianshu;
    @Column
    private String jifen;

    @Column
    private Integer qiandaojuli = 1000;

    @Column
    private Integer ditudaxiao = 14;
    @Column
    private Integer qizhidaxiao = 17;

    @Column
    private String shunxu ;
    @Column
    private Long shijian ; // 设定时间  秒
    @Column
    private String onshow;// 是否显示
    @Column
    private String mima;
    @Column
    private String orderflag = "0"; // 是否限制顺序


    //vo
    @Transient
    private String like;
    @Transient
    private String canyu;
    @Transient
    private String yiyongshi;
    @Transient
    private String yidaka;
    @Transient
    private String yijifen = "0";
    @Transient
    private String curpoint; // 需要或正在打卡的签到点

    public String getYiyongshi() {
        return yiyongshi;
    }
    public Long getShijian() {
        return shijian;
    }

    public String getCurpoint() {
        return curpoint;
    }

    public String getMima() {
        return mima;
    }

    public String getOrderflag() {
        return orderflag;
    }

    public void setOrderflag(String orderflag) {
        this.orderflag = orderflag;
    }

    public Integer getQizhidaxiao() {
        return qizhidaxiao;
    }

    public void setQizhidaxiao(Integer qizhidaxiao) {
        this.qizhidaxiao = qizhidaxiao;
    }

    public void setMima(String mima) {
        this.mima = mima;
    }

    public void setCurpoint(String curpoint) {
        this.curpoint = curpoint;
    }

    public void setShijian(Long shijian) {
        this.shijian = shijian;
    }

    public String getOnshow() {
        return onshow;
    }

    public void setOnshow(String onshow) {
        this.onshow = onshow;
    }

    public String getShunxu() {
        return shunxu;
    }

    public void setShunxu(String shunxu) {
        this.shunxu = shunxu;
    }

    public void setYiyongshi(String yiyongshi) {
        this.yiyongshi = yiyongshi;
    }

    public Integer getQiandaojuli() {
        return qiandaojuli;
    }

    public void setQiandaojuli(Integer qiandaojuli) {
        this.qiandaojuli = qiandaojuli;
    }

    public Integer getDitudaxiao() {
        return ditudaxiao;
    }

    public void setDitudaxiao(Integer ditudaxiao) {
        this.ditudaxiao = ditudaxiao;
    }

    public String getYidaka() {
        return yidaka;
    }

    public void setYidaka(String yidaka) {
        this.yidaka = yidaka;
    }

    public String getYijifen() {
        return yijifen;
    }

    public void setYijifen(String yijifen) {
        this.yijifen = yijifen;
    }

    public String getLike() {
        return like;
    }

    public void setLike(String like) {
        this.like = like;
    }

    public String getCanyu() {
        return canyu;
    }

    public void setCanyu(String canyu) {
        this.canyu = canyu;
    }

    public String getChangdu() {
        return changdu;
    }

    public void setChangdu(String changdu) {
        this.changdu = changdu;
    }

    public String getDianshu() {
        return dianshu;
    }

    public void setDianshu(String dianshu) {
        this.dianshu = dianshu;
    }

    public String getJifen() {
        return jifen;
    }

    public void setJifen(String jifen) {
        this.jifen = jifen;
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public void setPicture2(String picture2) {
        this.picture2 = picture2;
    }

    public String getPicture3() {
        return picture3;
    }

    public void setPicture3(String picture3) {
        this.picture3 = picture3;
    }

    public String getJingdu() {
        return jingdu;
    }

    public void setJingdu(String jingdu) {
        this.jingdu = jingdu;
    }

    public String getWeidu() {
        return weidu;
    }

    public void setWeidu(String weidu) {
        this.weidu = weidu;
    }
}
