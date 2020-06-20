package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;
@Entity(name = "Score")
public class Score implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "name", length = 500)
    private String name;

    @Column(name = "openid", length = 100)
    private String openid;

    @Column
    private Integer score = 0;

}
