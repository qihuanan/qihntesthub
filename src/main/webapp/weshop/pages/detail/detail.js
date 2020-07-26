const util = require('../../utils/util.js')
const app = getApp()
Page({
  data: {
    baseurl: app.globalData.baseurl,
    weItem:'',
    userid:''
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
          url: '/pages/login/login?goto=detail&id='
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
  bindcart: function(e){
    this.islogin()
    console.log('taplike ' + JSON.stringify(e))
    var that = this
    wx.request({
      url: app.globalData.baseurl +'we/addCart',
      header: { 'content-type': 'application/json' },
      data: {
        weItemid: app.globalData.curitemid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("taplike res  " + JSON.stringify(res2.data))
        wx.showToast({
          title: '加入购物车成功',
          icon: 'success',
          duration: 2000
        })
      }
    })
  },
  
  bindyuding: function(e){
    this.islogin()
    console.log('bindyuding ' + JSON.stringify(e))
    var that = this
    wx.request({
      url: app.globalData.baseurl +'we/yuding',
      header: { 'content-type': 'application/json' },
      data: {
        weItemid: app.globalData.curitemid,
        num:1,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("taplike res  " + JSON.stringify(res2.data))
        wx.showToast({
          title: '预定成功',
          icon: 'success',
          duration: 2000
        })
        util.navigateTo({
          url: '/pages/myorder/myorder'
        });
      }
    })
  },
  taplike: function(e){
    console.log('taplike ' + JSON.stringify(e))
    console.log('curitemid ' + app.globalData.curitemid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'we/like',
      header: { 'content-type': 'application/json' },
      data: {
        weItemid: app.globalData.curitemid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("taplike res  " + JSON.stringify(res2.data))
        that.setData({
          'weItem.like': res2.data.data
        })
      }
    })

  },
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '详情'
    })
    var that = this
    this.setData({
      userid: wx.getStorageSync("userid")
    })
    wx.request({
      url: app.globalData.baseurl + 'we/getItem',
      header: { 'content-type': 'application/json' },
      data: {
        id: app.globalData.curitemid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("detail onShow  " + JSON.stringify(res2.data))
        if(res2.data.weItem.status==0){
          //console.log('curitemid ' + res2.data.weItem.userid + '---'+)
          if(res2.data.weItem.userid == that.data.userid){
            that.setData({
              weItem: res2.data.weItem,
              hasUserInfo: true
            })
          }else{
            that.setData({
              'weItem.name':'非法内容！',          
            })
          }
        }else{
          that.setData({
            weItem: res2.data.weItem,
            hasUserInfo: true
          })
        }
        
      }
    })
  },
  onLoad: function (options) {
    console.log("onLoad-id:"+ options.id)
    app.globalData.curitemid = options.id
    
  },
})
