const app = getApp()
const util = require('../../utils/util.js')
Page({
  data: {
    baseurl: app.globalData.baseurl,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  //事件处理函数
  onShareAppMessage: function () {
  },
  onShow:function(){
    var userid = wx.getStorageSync("userid")
    console.log("onLaunch userid " + userid)
    if (userid == null || userid == '') {
      //return;
    }
    this.setData({
      cur:1
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl +'we/getItemList',
      header: { 'content-type': 'application/json' },
      data: {
        curPage: 1,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("onShow-getItemList " + JSON.stringify(res2.data))
        that.setData({
          weItemList: res2.data.weItemList,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function () {
    //this.islogin()
  },
  onPullDownRefresh: function() {
    this.onShow()
  },
  onReachBottom: function() {
    this.onShow()
  },

  todetail: function(e){
    console.log('todetail-'+ e.target.dataset.lineid)
    util.navigateTo({
      url: "/pages/detail/detail?id=" + e.target.dataset.lineid,
    });
  },

})
