package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "WeShop")
public class WeShop implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column()
    private Long id;

    @Column()
    private String name;
    @Column()
    private String remark;

    @Column()
    private Integer status;

    @ManyToOne
    @JoinColumn()
    private User user;

    @Column
    private Long userid;


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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
