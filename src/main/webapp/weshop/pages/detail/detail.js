const util = require('../../utils/util.js')
const app = getApp()
Page({
  data: {
    baseurl: app.globalData.baseurl,
    weItem:'',
  },
  //事件处理函数
  islogin: function () {
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') {
      util.navigateTo({
        url: '/pages/login/login?goto=detail&id=' + app.globalData.curitemid
      })
    }
  },
  onShareAppMessage: function () {
  },
  showimgTap:function(e){
    console.log('showimgTap ' + JSON.stringify(e))
    console.log('showimgTap ' + e.currentTarget.dataset.imgsrc)
    wx.previewImage({
      current: e.currentTarget.dataset.imgsrc,
      urls: [e.currentTarget.dataset.imgsrc]
    })
  },
    //事件处理函数
    islogin: function () {
      var userid = wx.getStorageSync("userid")
      if (userid == null || userid == '') {
        util.navigateTo({
          url: '/pages/login/login?goto=detail&lineid='
        })
        return
      }
    },
  bindfabu: function(e){
    this.islogin()
    console.log('bindfabu ' + JSON.stringify(e))
    var userid = wx.getStorageSync("userid")
    console.log(" userid " + userid)
    if (userid == null || userid == '') {
      return;
    }
    util.navigateTo({
      url: "/pages/fabu/fabu?id="+e.target.dataset.id,
    });
  },
  taplike: function(e){
    console.log('taplike ' + JSON.stringify(e))
    console.log('curitemid ' + app.globalData.curitemid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/linelike',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curitemid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("taplike res  " +res2.data.data)
        console.log("taplike res  " + JSON.stringify(res2.data.data))
        that.setData({
          'line.like': res2.data.data,
          hasUserInfo: true
        })
      }
    })

  },
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '详情'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl + 'we/getItem',
      header: { 'content-type': 'application/json' },
      data: {
        id: app.globalData.curitemid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("detail onShow  " + JSON.stringify(res2.data))
        that.setData({
          weItem: res2.data.weItem,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function (options) {
    console.log("onLoad-id:"+ options.id)
    app.globalData.curitemid = options.id
  },
})
