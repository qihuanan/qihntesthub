const util = require('../../utils/util.js')
const app = getApp()
// 支付功能页面
Page({
  data: {
    motto: '',
    baseurl: app.globalData.baseurl,
    iosDialog1: false,
    unlock: false,
    dakaflag:false,
    photoflag:false,
    cur: 3,
    files: [],
    src: '',
    pictureupres:'',
    cate:'',
    line:{},
    point:{},
    exam: { picture1:''},
    money: 1000,
    days:7,
    inputValue:'1000',
    ritems: [
      { value: 'USA', name: '北京' },
      { value: 'FRA', name: '上海' },
    ],
    verify:"0",// 答案是否对
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
  radioChange: function (e) {
    console.log('radio发生change事件，携带value值为：', e.detail.value)
    console.log('radio发生change事件，携带name值为：', e.detail)
    this.setData({
      inputValue: e.detail.value,
      money: e.detail.value.split('-')[1],
      days: e.detail.value.split('-')[0]
    })
  },

  bindViewTap: function() {
    util.navigateTo({
      url: '../logs/logs'
    })
  },

  wxpay: function(e){
    this.islogin()
    var openid = wx.getStorageSync("openid")
    var that = this
    wx.request({ // app.globalData.baseurl
      url: app.globalData.baseurl+'wx/wxPay',
      header: { 'content-type': 'application/json' },
      data: {
        openid: wx.getStorageSync("openid"),
        pname: app.globalData.curlineid+'-'+that.data.days+'-'+that.data.money,
        money: that.data.money
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
                    day:that.data.days,
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
                title: '下单支付ok',
                icon: 'none'
              })
            },
            "fail":function(res){
              wx.showToast({
                title: '下单支付失败',
                icon: 'none'
              })
            },
            "complete":function(res){}
          }
        )
        
      }
    })


  },

  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '成为会员'
    })
    var that = this
    var payday1 = '7'
    var paymoney1 = '10'
    var payday2 = '30'
    var paymoney2 = '20'
    var payday3 = '365'
    var paymoney3 = '30'
    var payday = '7'
    var paymoney = '10'
    wx.request({
      url: app.globalData.baseurl +'wx/getpayset',
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
        that.setData({
          line: res2.data.line,
          ritems: [
            {value: paymoney1, name: payday1},
            {value: paymoney2, name: payday2},
            {value: paymoney3, name: payday3}
          ]
        })
        
      }
    })

    this.setData({
      cur: 3,
    })
    
  },
  onLoad: function (options) {

  },
  
})