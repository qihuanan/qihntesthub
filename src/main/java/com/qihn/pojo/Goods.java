package com.qihn.pojo;

import com.qihn.controller.GoodsController;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Goods")
public class Goods implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column()
    private String skuid;

    @Column()
    private String name;

    @Column()
    private String skupicture;

    @Column()
    private String skulink;


    @Column()
    private Float price;

    @Column()
    private Float pricel;

    @Column()
    private Integer upindex = 0;

    @Column()
    private String recpoint;

    @Column()
    private Integer domain;

    @Column()
    private String remark;

    @Column()
    private String brand;

    @Column()
    private String cate;
    @Column()
    private Long updatetime;


    @Column()
    private String linktype;

    @Column()
    private Long endtime;
    @Column()
    private Integer ratio;
    @Column()
    private String cid;
    @Column()
    private String cid2;
    @Column()
    private String cid3;
    @Column()
    private String cidName;
    @Column()
    private String cid2Name;
    @Column()
    private String cid3Name;

    @Column
    private String materialUrl;
    @Column
    private Integer inOrderCount = 100;

    //vo pop
    private String orderby = "id";

    private String huashu;
    private String q;

    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }

    public String getHuashu() {
        return huashu;
    }

    public void setHuashu(String huashu) {
        this.huashu = huashu;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", skuid='" + skuid + '\'' +
                ", name=" + name +
                ", skupicture='" + skupicture + '\'' +
                ", skulink='" + skulink + '\'' +
                ", price=" + price +
                ", pricel=" + pricel +
                ", upindex=" + upindex +
                ", recpoint='" + recpoint + '\'' +
                ", domain=" + domain +
                ", remark='" + remark + '\'' +
                '}';
    }

    public String getLinktype() {
        return linktype;
    }

    public Integer getRatio() {
        return ratio;
    }

    public void setRatio(Integer ratio) {
        this.ratio = ratio;
    }

    public void setLinktype(String linktype) {
        this.linktype = linktype;
    }

    public Long getEndtime() {
        return endtime;
    }

    public void setEndtime(Long endtime) {
        this.endtime = endtime;
    }

    public String getBrand() {
        return brand;
    }

    public String getOrderby() {
        return orderby;
    }

    public void setOrderby(String orderby) {
        this.orderby = orderby;
    }

    public Long getUpdatetime() {
        return updatetime;
    }

    public Integer getInOrderCount() {
        return inOrderCount;
    }

    public void setInOrderCount(Integer inOrderCount) {
        this.inOrderCount = inOrderCount;
    }

    public void setUpdatetime(Long updatetime) {
        this.updatetime = updatetime;
    }

    public String getCid() {
        return cid;
    }

    public String getMaterialUrl() {
        return materialUrl;
    }

    public void setMaterialUrl(String materialUrl) {
        this.materialUrl = materialUrl;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCid2() {
        return cid2;
    }

    public void setCid2(String cid2) {
        this.cid2 = cid2;
    }

    public String getCid3() {
        return cid3;
    }

    public void setCid3(String cid3) {
        this.cid3 = cid3;
    }

    public String getCidName() {
        return cidName;
    }

    public void setCidName(String cidName) {
        this.cidName = cidName;
    }

    public String getCid2Name() {
        return cid2Name;
    }

    public void setCid2Name(String cid2Name) {
        this.cid2Name = cid2Name;
    }

    public String getCid3Name() {
        return cid3Name;
    }

    public void setCid3Name(String cid3Name) {
        this.cid3Name = cid3Name;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSkuid() {
        return skuid;
    }

    public void setSkuid(String skuid) {
        this.skuid = skuid;
    }


    public String getSkupicture() {
        return skupicture;
    }

    public void setSkupicture(String skupicture) {
        this.skupicture = skupicture;
    }

    public String getSkulink() {
        return skulink;
    }

    public void setSkulink(String skulink) {
        this.skulink = skulink;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getPricel() {
        return pricel;
    }

    public void setPricel(Float pricel) {
        this.pricel = pricel;
    }

    public Integer getUpindex() {
        return upindex;
    }

    public void setUpindex(Integer upindex) {
        this.upindex = upindex;
    }


    public Integer getDomain() {
        return domain;
    }

    public void setDomain(Integer domain) {
        this.domain = domain;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
