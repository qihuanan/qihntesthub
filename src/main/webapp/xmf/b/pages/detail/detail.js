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
  gopay: function(e){
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') {
      util.navigateTo({
        url: '/pages/login/login?goto=detail&lineid=' + app.globalData.curlineid
      })
    }
    else{
      util.navigateTo({
      url: '/pages/wxpay/wxpay'
      })
     }
  },
  wxpay: function(e){
    var paytype = e.currentTarget.dataset.paytype
    this.islogin()
    var payday1 = '7'
    var paymoney1 = '1'
    var payday2 = '30'
    var paymoney2 = '2'
    var payday3 = '365'
    var paymoney3 = '3'
    var payday = '7'
    var paymoney = '1'

    wx.request({
      url: app.globalData.baseurl+'wx/getpayset',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: 4,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("getpayset res  " + JSON.stringify(res2.data))
        payday1 = res2.data.payday1
        paymoney1 = res2.data.paymoney1
        payday2 = res2.data.payday2
        paymoney2 = res2.data.paymoney2
        payday3 = res2.data.payday3
        paymoney3 = res2.data.paymoney3
        if(paytype == 1){
          payday = payday1;
          paymoney = paymoney1;
        }
        if(paytype == 2){
          payday = payday2;
          paymoney = paymoney2;
        }
        if(paytype == 3){
          payday = payday3;
          paymoney = paymoney3;
        }

        var openid = wx.getStorageSync("openid")
        wx.request({ // app.globalData.baseurl
          url: app.globalData.baseurl+'wx/wxPay',
          header: { 'content-type': 'application/json' },
          data: {
            openid: wx.getStorageSync("openid"),
            pname: payday+'-'+paymoney,
            money: paymoney
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
                        wx.setStorageSync("endtime", res2.data.endtime)
                        console.log("payresup-cache endtime-get  " + wx.getStorageSync("endtime"))
                      
                        util.navigateTo({
                          url: '/pages/detailon/detail?lineid=' + app.globalData.curlineid
                        })
                      }
                    })

                  }
                  wx.showToast({
                    title: '支付成功',
                    icon: 'none'
                  })
                },
                "fail":function(res){
                  wx.showToast({
                    title: '支付失败',
                    icon: 'none'
                  })
                },
                "complete":function(res){}
              }
            )
            
          }
        })

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
    return {
      title: '我在“'+ app.globalData.curlinename+ '”，来跟我一起，发现身边世界的精彩吧!',
      //lichunbo,增加分享标题
      url: '/pages/login/login?goto=detail&lineid=' + app.globalData.curlineid
     }
  },
  onShareTimeline: function () {
    return {
      title: '我在“'+ app.globalData.curlinename+ '”，来跟我一起，发现身边世界的精彩吧!',
      //lichunbo,增加分享标题
      query:'lineid=' + app.globalData.curlineid
     }
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
// 排行榜 当天 7天 
  socoreTop: function(e){
    console.log('socoreTop-lineid: ' + app.globalData.curlineid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/scoreTop',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curlineid
      }, success(res2) {
        console.log("socoreTop res  " + JSON.stringify(res2.data))
        that.setData({
          user1list: res2.data.user1list,
          user0list: res2.data.user0list
        })
      }
    })

  },
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '叫上朋友一起探索吧-->'
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
        app.globalData.curlinename = res2.data.data.name
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
