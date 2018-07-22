package com.qihn.pojo;

import java.io.Serializable;

public class Jdobject extends Goods implements Serializable {

    private String commitinfo;
    private String shopinfo;
    private String adwords;
    private String pricestr;

    public String getPricestr() {
        return pricestr;
    }

    public void setPricestr(String pricestr) {
        this.pricestr = pricestr;
    }

    public String getCommitinfo() {
        return commitinfo;
    }

    public void setCommitinfo(String commitinfo) {
        this.commitinfo = commitinfo;
    }

    public String getShopinfo() {
        return shopinfo;
    }

    public void setShopinfo(String shopinfo) {
        this.shopinfo = shopinfo;
    }

    public String getAdwords() {
        return adwords;
    }

    public void setAdwords(String adwords) {
        this.adwords = adwords;
    }
}
