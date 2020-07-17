const util = require('../../utils/util.js')
const app = getApp()

Page({
  data: {
    curpage:1,
    baseurl: app.globalData.baseurl,
    userInfo: {},
    score:0,
    weItemList:[],
    hasUserInfo: false,
    showpanel: 1,
    user:{},
    cur:5,
    weItemUserList:[],
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  getPhoneNumber(e) {
    console.log(e.detail.errMsg)
    console.log(e.detail.iv)
    console.log(e.detail.encryptedData)
  },
  todetail: function(e){
    console.log('todetail-'+ e.target.dataset.lineid)
    util.navigateTo({
      url: "/pages/detail/detail?id=" + e.target.dataset.lineid,
    });
  },
  islogin: function () {
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') {
      wx.reLaunch({
        url: '/pages/login/login'
      })
    }
  },
  showmyactive: function (e){
    console.log(e.currentTarget.dataset.panel)
    this.setData({
      showpanel: e.currentTarget.dataset.panel
    })
    this.onPullDownRefresh()
  },
  onShow:function(curpage){
    console.log('qihndebug-onShow-curpage ' + curpage )
  },
  loadlistdate1:function(curpage,that){
    if(curpage == 1){ that.setData({ weItemList:[] } ) }
    wx.request({
      url: app.globalData.baseurl +'we/wode', // 
      header: { 'content-type': 'application/json' },
      data: {
        curPage: curpage == undefined ? 1 : curpage,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("home onShow-res  " + JSON.stringify(res2.data))
        app.globalData.score = res2.data.user.score
        wx.setStorageSync("score", app.globalData.score)
        that.setData({
          weItemList: that.data.weItemList.concat(res2.data.weItemList) ,
          user: res2.data.user,
        })
      }
    })
  },
  loadlistdate2:function(curpage,that){ //收藏记录
    console.log("home loadlistdate2-curpage  " + curpage)
    if(curpage == 1){ that.setData({ weItemUserList:[] } ) }
    wx.request({
      url: app.globalData.baseurl +'we/getLikeList', // 
      header: { 'content-type': 'application/json' },
      data: {
        curPage: curpage == undefined ? 1 : curpage,
        cate: 1,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("home loadlistdate2-res  " + JSON.stringify(res2.data))
        that.setData({
          weItemUserList: that.data.weItemUserList.concat(res2.data.weItemUserList) ,
        })
      }
    })
  },
  onLoad: function (options) {
    this.islogin()
    console.log('qihndebug-options- ' + options)
    var that = this;
    if (app.globalData.userInfo) {
      this.setData({
        cur: 5,
        userInfo: app.globalData.userInfo,
        score: wx.getStorageSync("score"),
        hasUserInfo: true
      })
    }
    this.loadlistdate1(1,this)
  },
  onPullDownRefresh: function() {
    if(this.data.showpanel == 1){
      this.loadlistdate1(1,this)
    }else{
      this.loadlistdate2(1,this)
    }
    
  },
  onReachBottom: function() {
    if(this.data.showpanel == 1){
      this.loadlistdate1(++this.data.curpage,this)
    }else{
      this.loadlistdate2(++this.data.curpage,this)
    }
    
  },

})
