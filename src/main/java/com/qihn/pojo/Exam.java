package com.qihn.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "Exam")
public class Exam implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column()
    private Long id;

    @Column()
    private Long pointid;
    @Column()
    private String pointname;

    @Column()
    private String name;
    @Column(length = 500)
    private String description;

    @Column
    private String picture1;
    @Column
    private String answer;
    @Column
    private String prize;// 奖品文字描述
    @Column
    private String prizeimg;

    @Column
    private String chance = "10"; // 机会 选择题只有一次机会，预留
    @Column
    private String success;
    @Column
    private String fail;
    @Column
    private String showanswer = "0";// 答错是否显示 正确答案。

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getPointid() {
        return pointid;
    }

    public void setPointid(Long pointid) {
        this.pointid = pointid;
    }

    public String getPicture1() {
        return picture1;
    }

    public void setPicture1(String picture1) {
        this.picture1 = picture1;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public String getPrizeimg() {
        return prizeimg;
    }

    public void setPrizeimg(String prizeimg) {
        this.prizeimg = prizeimg;
    }

    public String getChance() {
        return chance;
    }

    public void setChance(String chance) {
        this.chance = chance;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getFail() {
        return fail;
    }

    public void setFail(String fail) {
        this.fail = fail;
    }

    public String getShowanswer() {
        return showanswer;
    }

    public void setShowanswer(String showanswer) {
        this.showanswer = showanswer;
    }
}
