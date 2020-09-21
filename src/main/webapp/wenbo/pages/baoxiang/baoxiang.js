const util = require('../../utils/util.js')
const app = getApp()

Page({
  data: {
    baseurl: app.globalData.baseurl,
    line:{},
    curbaoxiang:{},
    baoxiangList:{},
    suipianList:{},
    yijiesuo:0,
    zongpianshu:0,
    cur: 4,
    iosDialog1: false,
    background: ['demo-text-1', 'demo-text-2', 'demo-text-3'],
    indicatorDots: true,
    vertical: false,
    autoplay: false,
    interval: 2000,
    duration: 500
    
  },

  goshare: function (e) { 
    util.navigateTo({
      url: "/pages/share/share",
    });
  },

  bindchange: function (options){
    console.log(" bindchange " + JSON.stringify(options))
    console.log(" bindchange " + JSON.stringify(options.detail.current) )
    
    this.setData({
      curbaoxiang: this.data.baoxiangList[options.detail.current],
    })
  },
  close: function () {
    this.setData({
      iosDialog1: false,
    })
  },

  openIOS1: function (e) {
    console.log("detailon openIOS1 " + JSON.stringify(e))
    this.setData({
      iosDialog1: true,
    })
    
  },
  
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '宝箱拼图'
    })
  },
  onLoad: function (options) {
    //console.log("onLoad-lineid:"+ options.lineid)
    //app.globalData.curlineid = options.lineid
    //app.globalData.curlineid = 10
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/baoxiang',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: app.globalData.curlineid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("baoxiang onLoad  " + JSON.stringify(res2.data))
        that.setData({
          line: res2.data.line,
          baoxiangList: res2.data.baoxiangList,
          suipianList: res2.data.suipianList,
          curbaoxiang: res2.data.baoxiangList[0],
          yijiesuo: res2.data.yijiesuo,
          zongpianshu: res2.data.zongpianshu,
        })
      }
    })
    
  },

  
  
  
})
