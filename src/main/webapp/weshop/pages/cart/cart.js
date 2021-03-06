const app = getApp()
const util = require('../../utils/util.js')
Page({
  data: {
    baseurl: app.globalData.baseurl,
    weItemUserList:[],               // 购物车列表
    hasList:false,          // 列表是否有数据
    totalPrice:0,           // 总价，初始为0
    selectAllStatus:true,    // 全选状态，默认全选
    curpage : 1,
    obj:{
        name:"hello"
    }
  },

  loadlistdate:function(curpage,that){ 
    console.log("home loadlistdate2-curpage  " + curpage)
    if(curpage == 1){ that.setData({ weItemUserList:[] } ) }
    wx.request({
      url: app.globalData.baseurl +'we/getLikeList', // 
      header: { 'content-type': 'application/json' },
      data: {
        curPage: curpage == undefined ? 1 : curpage,
        cate: 2,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("home loadlistdate2-res  " + JSON.stringify(res2.data))
        that.setData({
          weItemUserList: that.data.weItemUserList.concat(res2.data.weItemUserList) ,
        })
        that.getTotalPrice();
      }
    })
  },
  onLoad: function () {
    this.loadlistdate(1,this)
  },
  onPullDownRefresh: function() {
    this.loadlistdate(1,this)
  },
  onReachBottom: function() {
    //this.onShow(++this.data.curpage)
    this.loadlistdate(++this.data.curpage,this)
  },

  todetail: function(e){
    console.log('todetail-'+ e.target.dataset.lineid)
    util.navigateTo({
      url: "/pages/detail/detail?id=" + e.target.dataset.lineid,
    });
  },
  onShow() {
    this.setData({
      hasList: true,
    });
    this.getTotalPrice();
  },
  /**
   * 当前商品选中事件
   */
  selectList(e) {
    const index = e.currentTarget.dataset.index;
    let weItemUserList = this.data.weItemUserList;
    const selected = weItemUserList[index].selected;
    weItemUserList[index].selected = selected == "1" ? "0" : "1";
    this.setData({
      weItemUserList: weItemUserList
    });
    this.getTotalPrice();
    this.setSelectedCart(weItemUserList[index].id)
    
  },

  setSelectedCart(obj) {
    wx.request({
      url: app.globalData.baseurl +'we/setSelectedCart', // 
      header: { 'content-type': 'application/json' },
      data: {
        id: obj,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("changeItem-res  " + JSON.stringify(res2.data))
      }
    })   
  },
  /**
   * 删除购物车当前商品
   */
  deleteList(e) {
    const index = e.currentTarget.dataset.index;
    let weItemUserList = this.data.weItemUserList;
    this.delCart(weItemUserList[index].id)
    weItemUserList.splice(index,1);
    this.setData({
      weItemUserList: weItemUserList
    });
    if(!weItemUserList.length){
      this.setData({
        hasList: false
      });
    }else{
      this.getTotalPrice();
    }
    
  },
  delCart(obj) {
    wx.request({
      url: app.globalData.baseurl +'we/delCart', // 
      header: { 'content-type': 'application/json' },
      data: {
        id: obj,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("changeItem-res  " + JSON.stringify(res2.data))
      }
    })   
  },
  /**
   * 购物车全选事件
   */
  selectAll(e) {
    let selectAllStatus = this.data.selectAllStatus;
    selectAllStatus = !selectAllStatus;
    let weItemUserList = this.data.weItemUserList;

    for (let i = 0; i < weItemUserList.length; i++) {
      weItemUserList[i].selected = selectAllStatus == true ? "1" : "0";
      this.setSelectedCart(weItemUserList[index].id)
    }
    this.setData({
      selectAllStatus: selectAllStatus,
      weItemUserList: weItemUserList
    });
    this.getTotalPrice();
  },

  /**
   * 绑定加数量事件
   */
  addCount(e) {
    const index = e.currentTarget.dataset.index;
    let weItemUserList = this.data.weItemUserList;
    let num = weItemUserList[index].num;
    num = num + 1;
    weItemUserList[index].num = num;
    this.setData({
      weItemUserList: weItemUserList
    });
    this.getTotalPrice();
    this.addreduceCart('addCart',weItemUserList[index].weItemid);
  },

  /**
   * 绑定减数量事件
   */
  minusCount(e) {
    const index = e.currentTarget.dataset.index;
    const obj = e.currentTarget.dataset.obj;
    let weItemUserList = this.data.weItemUserList;
    let num = weItemUserList[index].num;
    if(num <= 1){
      return false;
    }
    num = num - 1;
    weItemUserList[index].num = num;
    this.setData({
      weItemUserList: weItemUserList
    });
    this.getTotalPrice();
    this.addreduceCart('reduceCart',weItemUserList[index].weItemid);
  },
  addreduceCart(op,obj) { // op: reduceCart addCart
    wx.request({
      url: app.globalData.baseurl +'we/'+op, // 
      header: { 'content-type': 'application/json' },
      data: {
        weItemid: obj,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("changeItem-res  " + JSON.stringify(res2.data))
      }
    })   
  },
  /**
   * 计算总价
   */
  getTotalPrice() {
    let weItemUserList = this.data.weItemUserList;                  // 获取购物车列表
    let total = 0;
    for(let i = 0; i<weItemUserList.length; i++) {         // 循环列表得到每个数据
      if(weItemUserList[i].selected == "1") {                     // 判断选中才会计算价格
        total += weItemUserList[i].num * weItemUserList[i].weItem.price;   // 所有价格加起来
      }
    }
    this.setData({                                // 最后赋值到data中渲染到页面
      weItemUserList: weItemUserList,
      totalPrice: total.toFixed(2)
    });
  }

})