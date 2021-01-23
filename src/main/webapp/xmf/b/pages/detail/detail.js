const util = require('../../utils/util.js')
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
    line:'',
    
    
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

  wxpay: function(e){
    this.islogin()
    var openid = wx.getStorageSync("openid")
    wx.request({ // app.globalData.baseurl
      url: app.globalData.baseurl+'wx/wxPay',
      header: { 'content-type': 'application/json' },
      data: {
        openid: wx.getStorageSync("openid"),
        pname: '7天会员1分',
        money: 1
      }, success(res2) {
        console.log("wxPay res  " + JSON.stringify(res2.data))
        wx.requestPayment({
            "timeStamp": res2.data.timeStamp ,
            "nonceStr": res2.data.nonceStr ,
            "package": res2.data.package ,
            "signType": "MD5",
            "paySign": res2.data.paySign ,
            "success":function(res){
              console.log("pay-success res  " + JSON.stringify(res))
              if(res.errMsg == 'requestPayment:ok'){
                wx.request({
                  url: app.globalData.baseurl+'wx/payresup',
                  header: { 'content-type': 'application/json' },
                  data: {
                    lineid: app.globalData.curlineid,
                    money: res2.data.money,
                    out_trade_no: res2.data.out_trade_no,
                    day:7,
                    userid: wx.getStorageSync("userid")
                  }, success(res2) {
                    console.log("payresup res  " + JSON.stringify(res2.data))
                    util.navigateTo({
                      url: '/pages/detailon/detail?lineid=' + app.globalData.curlineid
                    })
                  }
                })

              }
              wx.showToast({
                title: '下单支付ok',
                icon: 'none'
              })
            },
            "fail":function(res){
              wx.showToast({
                title: '统一下单出现异常',
                icon: 'none'
              })
            },
            "complete":function(res){}
          }
        )
        
      }
    })
  },

  dakaflagtap: function(e){
    this.islogin()
    var userid = wx.getStorageSync("userid")
    console.log("onLaunch userid " + userid)
    if (userid == null || userid == '') {
      return;
    }
    var that  = this
    var lineid = e.currentTarget.dataset.lineid
    console.log("dakaflagtap par  " + lineid)
    wx.request({ // app.globalData.baseurl
      url: app.globalData.baseurl+'wx/linedaka',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: lineid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("dakaflagtap res  " + JSON.stringify(res2.data.data))
        util.navigateTo({
          url: '/pages/detailon/detail?lineid=' + lineid
        })
      }
    })

    this.setData({
      dakaflag: true
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

  bindViewTap: function() {
    util.navigateTo({
      url: '../logs/logs'
    })
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
  taplike: function(e){
    console.log('taplike ' + JSON.stringify(e))
    console.log('curlineid ' + app.globalData.curlineid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/linelike',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curlineid,
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
      title: '线路详情'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl + 'wx/linedetail',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: app.globalData.curlineid,
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
      }
    })
  },
  onLoad: function (options) {
    console.log("onLoad-lineid:"+ options.lineid)
    app.globalData.curlineid = options.lineid
    return 
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/linedetail',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: app.globalData.curlineid,
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
