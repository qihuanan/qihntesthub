const app = getApp()
const util = require('../../utils/util.js')
Page({
  data: {
    baseurl: app.globalData.baseurl,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    weItemList:[],
    curpage : 1,
  },
  //事件处理函数
  onShareAppMessage: function () {
  },
  onShow:function(curpage){
    var userid = wx.getStorageSync("userid")
    console.log("onShow userid " + userid+ " curpage:"+curpage)
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
        curPage: curpage == undefined ? 1 : curpage,
        //userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("onShow-getItemList " + JSON.stringify(res2.data))
        that.setData({
          weItemList: that.data.weItemList.concat(res2.data.weItemList) ,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function () {
    //this.islogin()
  },
  onPullDownRefresh: function() {
    this.onShow(1)
  },
  onReachBottom: function() {
    this.onShow(++this.data.curpage)
  },

  todetail: function(e){
    console.log('todetail-'+ e.target.dataset.lineid)
    util.navigateTo({
      url: "/pages/detail/detail?id=" + e.target.dataset.lineid,
    });
  },

})
