package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;
@Entity(name = "PointUserinfo")
public class PointUserinfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column()
    private Long lineid;

    @Column()
    private Long pointid;
    @Column()
    private String pointname;

    @ManyToOne
    @JoinColumn()
    private Point point;

    @Column
    private Long userid;
    @Column
    private String username;

    @ManyToOne
    @JoinColumn()
    private User user;

    @Column(name = "name", length = 500)
    private String name;

    @Column
    private String description;

    @Column
    private String picture;

    @Column
    private String finish;
    @Column
    private Integer addScore;
    private Long time;

    public String getPointname() {
        return pointname;
    }

    public Long getTime() {
        return time;
    }

    public Long getLineid() {
        return lineid;
    }

    public void setLineid(Long lineid) {
        this.lineid = lineid;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public void setPointname(String pointname) {
        this.pointname = pointname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column
    private String message;


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

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point point) {
        this.point = point;
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getFinish() {
        return finish;
    }

    public void setFinish(String finish) {
        this.finish = finish;
    }

    public Integer getAddScore() {
        return addScore;
    }

    public void setAddScore(Integer addScore) {
        this.addScore = addScore;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
