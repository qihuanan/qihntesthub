const util = require('../../utils/util.js')
const app = getApp() // 答题成功页面
Page({
  data: {
    cur:5,
    prizeimg:'',
    baseurl: app.globalData.baseurl,
    success:'',
    finish:'0',
    count:'1',
    fujiati:'0',// 默认不是附加题
    jifen:''
  },
  //事件处理函数
  
  gonext: function (e) { 
    // 需要付费，跳转
    var userid = wx.getStorageSync("userid")
    wx.request({
      url: app.globalData.baseurl +'wx/getCanPlayline',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curlineid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("getCanPlayline res  " + JSON.stringify(res2.data))
        wx.setStorageSync("needpay", res2.data.needpay)
        var needpay = wx.getStorageSync("needpay")
        console.log('qihndebug-needpay- ' + needpay)
        if(needpay == 1){
          util.navigateTo({
            url: '/pages/wxpay/wxpay?lineid=' + app.globalData.curlineid
          })
        }else{
          util.navigateTo({
            url: "/pages/detailmap/detail",
          });
        }

      }
    })

  },
  gonext2: function (e) {
    util.navigateTo({
      url: "/pages/detailqiandao2/detail?fujiati=1",
    });
  },
  gobaoxiang: function(e){
    util.navigateTo({
      url: "/pages/baoxiang/baoxiang",
    });
  },

  onShow:function(){
    
  },
  onLoad: function (options) {
    console.log('qihndebug-options- ' + options.count)
    console.log('qihndebug-options-onload-fujiati- ' + options.fujiati)
    var that = this;
    that.setData({
      count: options.count,
      fujiati: options.fujiati,// 上个页面是否是附加题，是的话，就不再显示 额外加分任务了
      finish: options.finish,
      prizeimg: options.prizeimg,
      success: options.success,
      jifen: options.jifen
    })
  },

})
