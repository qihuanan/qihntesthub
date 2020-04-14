package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Tip")
public class Tip implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column()
    private Long pointid;
    @Column()
    private String pointname;


    @Column(name = "name", length = 500)
    private String name;

    @Column
    private String description;

    @Column
    private String lockflag;

    @Column
    private Integer shunxu;

    @Column
    private String jifen;

    private String img;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPointid() {
        return pointid;
    }

    public void setPointid(Long pointid) {
        this.pointid = pointid;
    }

    public String getPointname() {
        return pointname;
    }

    public void setPointname(String pointname) {
        this.pointname = pointname;
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

    public String getLockflag() {
        return lockflag;
    }

    public void setLockflag(String lockflag) {
        this.lockflag = lockflag;
    }

    public Integer getShunxu() {
        return shunxu;
    }

    public void setShunxu(Integer shunxu) {
        this.shunxu = shunxu;
    }

    public String getJifen() {
        return jifen;
    }

    public void setJifen(String jifen) {
        this.jifen = jifen;
    }
}
