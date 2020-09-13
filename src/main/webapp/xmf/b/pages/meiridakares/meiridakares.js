const util = require('../../utils/util.js')
const app = getApp()
Page({
  data: {
    cur:5,
    prizeimg:'',
    baseurl: app.globalData.baseurl,
    success:'',
    finish:'0',
    count:'1',
    examname:'',
    jifen:''
  },
  //事件处理函数
  
  gonext: function (e) { 
    util.navigateTo({
      url: "/pages/detailon/detail",
    });
  },


  onShow:function(){
    wx.setNavigationBarTitle({
      title: '每日打卡'
    })
  },
  onLoad: function (options) {
    console.log('qihndebug-options- ' + options.count)
    var that = this;
    that.setData({
      count: options.count,
      finish: options.finish,
      prizeimg: options.prizeimg,
      success: options.success,
      examname: options.examname,
      jifen: options.jifen
    })
  },

})