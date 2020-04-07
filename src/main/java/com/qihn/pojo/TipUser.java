package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;
@Entity(name = "TipUser")
public class TipUser implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;


    @Column()
    private Long tipid;
    @Column()
    private String tipname;


    @Column
    private Long userid;
    @Column
    private String username;

    @Column
    private Integer reduceScore;
    @Column
    private Long time;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTipid() {
        return tipid;
    }

    public void setTipid(Long tipid) {
        this.tipid = tipid;
    }

    public String getTipname() {
        return tipname;
    }

    public void setTipname(String tipname) {
        this.tipname = tipname;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getReduceScore() {
        return reduceScore;
    }

    public void setReduceScore(Integer reduceScore) {
        this.reduceScore = reduceScore;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }
}
