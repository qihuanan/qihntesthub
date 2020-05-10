package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Suipian")
public class Suipian implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column()
    private Long baoxiangid;
    @Column()
    private String baoxiangname;

    @Column()
    private Long lineid;

    @ManyToOne
    @JoinColumn()
    private Baoxiang baoxiang;

    @Column()
    private String name;

    @Column()
    private String bianhao;

    //vo
    @Transient
    private String has ="0";
    @Transient
    private String img ="";

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getHas() {
        return has;
    }

    public void setHas(String has) {
        this.has = has;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getLineid() {
        return lineid;
    }

    public void setLineid(Long lineid) {
        this.lineid = lineid;
    }

    public Long getBaoxiangid() {
        return baoxiangid;
    }

    public void setBaoxiangid(Long baoxiangid) {
        this.baoxiangid = baoxiangid;
    }

    public String getBaoxiangname() {
        return baoxiangname;
    }

    public void setBaoxiangname(String baoxiangname) {
        this.baoxiangname = baoxiangname;
    }

    public Baoxiang getBaoxiang() {
        return baoxiang;
    }

    public void setBaoxiang(Baoxiang baoxiang) {
        this.baoxiang = baoxiang;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao;
    }
}
