const util = require('../../utils/util.js')
const app = getApp()

Page({
  data: {
    line:{},
    motto: 'Hello World',
    baseurl: app.globalData.baseurl,
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  //事件处理函数
  bindViewTap: function() { 
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onShareAppMessage: function () {
  },
  bindtolist:function(){
    util.navigateTo({
      url: '/pages/list/list'
    })
  },
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '文博探秘'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl + 'wx/linedetail',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: 1,
        //userid: wx.getStorageSync("userid") 
      }, success(res2) {
        console.log("detail onShow  " + JSON.stringify(res2.data.data))
        that.setData({
          line: res2.data.data,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function (options) {
    //this.onShow()
  }
})
