package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "WeCate")
public class WeCate implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column()
    private Long id;

    @Column()
    private String name;
    @Column()
    private String remark;


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
}
