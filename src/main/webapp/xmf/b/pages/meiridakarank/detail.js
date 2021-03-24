const util = require('../../utils/util.js') //概况页面，首页列表进去后的页面
const app = getApp()

Page({
  data: {
    motto: 'Hello World',
    baseurl: app.globalData.baseurl,
    iosDialog1: false,
    unlock: false,
    dakaflag:false,
    photoflag:false,
    files: [],
    src: '',
    user1list: '', // 当天积分排行
    user0list: '', // 7 天吗，总榜
    line:'',
    showpanel: 1,
  },
  //事件处理函数
  islogin: function () {
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') {
      util.navigateTo({
        url: '/pages/login/login?goto=detail&lineid=' + app.globalData.curlineid
      })
    }
  },
  


  showmyactive: function (e){
    console.log(e.currentTarget.dataset.panel)
    this.setData({ 
      showpanel: e.currentTarget.dataset.panel
    })
  },
  

  mrdatap: function(e){
    this.islogin()
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') { return; }
    var that  = this
    var lineid = e.currentTarget.dataset.lineid
    util.navigateTo({
      url: '/pages/meiridaka/meiridaka?'
    })

  },
  goshare: function (e) { 
    util.navigateTo({
      url: "/pages/share/share",
    });
  },

  bindViewTap: function() {
    util.navigateTo({
      url: '../logs/logs'
    })
  },
  onShareAppMessage: function () {
    return {
      title: '我在“'+ app.globalData.curlinename+ '”，来跟我一起，发现身边世界的精彩吧!',
      //lichunbo,增加分享标题
      url: '/pages/login/login?goto=detail&lineid=' + app.globalData.curlineid
     }
  },

// 排行榜 当天 7天 
  socoreTop: function(e){
    console.log('socoreTop-lineid: ' + app.globalData.curlineid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/scoreTop',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: 2
      }, success(res2) {
        console.log("socoreTop res  " + JSON.stringify(res2.data))
        that.setData({
          user0list: res2.data.user0list
        })
      }
    })

  },
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '每日打卡积分排行榜'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl + 'wx/linedetail',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: 2,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("detail onShow2 " + app.globalData.curlineid)
        console.log("detail onShow  " + JSON.stringify(res2.data.data))
        //that.actvielist = res2.data.data
        that.setData({
          //line: JSON.stringify(res2.data.data),
          line: res2.data.data,
          hasUserInfo: true
        })
        that.socoreTop();
      }
    })
    

  },
  onLoad: function (options) {
    console.log("onLoad-lineid:"+ options.lineid)
    if(options && options.lineid){
      app.globalData.curlineid = options.lineid
    }
   
   
    return 
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/linedetail',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: 2,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        //console.log("login getLineList " + res2.data)
        console.log("detail onLoad  " + JSON.stringify(res2.data.data))
        //that.actvielist = res2.data.data
        that.setData({
          //line: JSON.stringify(res2.data.data),
          line: res2.data.data,
          hasUserInfo: true
        })
      }
    })
  }, 
})
