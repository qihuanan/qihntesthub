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
    var needpay = wx.getStorageSync("needpay")
    if(needpay == 1){
      wx.showModal({
        title: '提示',
        content: '您需要付费才能继续签到',
        success (res) {
          if (res.confirm) {
            util.navigateTo({
              url: '/pages/detail/detail?lineid=' + app.globalData.curlineid
            })
          } else if (res.cancel) {
            console.log('用户点击取消')
            util.navigateTo({
              url: '/pages/detail/detail?lineid=' + app.globalData.curlineid
            })
          }
        }
      })
      
      return;
    }

    util.navigateTo({
      url: "/pages/detailon/detail",
    });
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
