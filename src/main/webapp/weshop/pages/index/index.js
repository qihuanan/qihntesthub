const app = getApp()
const util = require('../../utils/util.js')

Page({
  data: {
    imgUrls: [
      '/pages/images/logo.png',
      '/pages/images/logo.png',
      '/pages/images/logo.png',
    ],
    indicatorDots: false,
    autoplay: false,
    interval: 3000,
    duration: 800,
    baseurl: app.globalData.baseurl,
    weItemList:[],
    curpage : 1,
  },

  //事件处理函数
  onShareAppMessage: function () {
  },
  onShow:function(curpage){
    
  },
  loadlistdate:function(curpage,that){
    var userid = wx.getStorageSync("userid")
    console.log("onShow userid " + userid+ " curpage:"+curpage)
    if(curpage == 1){ that.setData({ weItemList:[] } ) }
    that.setData({ cur:1  })
    wx.request({
      url: app.globalData.baseurl +'we/getItemList',
      header: { 'content-type': 'application/json' },
      data: {
        curPage: curpage == undefined ? 1 : curpage,
        status:1,
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
  onLoad: function (options) {
    console.log('onLoad options ' + JSON.stringify(options))
    if (options && options.weCateid) {
      app.globalData.goto = options.goto
    }
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

})
