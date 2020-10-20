const util = require('../../utils/util.js')
const app = getApp()
Page({
  data: {
    cur: 5,
    baseurl: app.globalData.baseurl,
    failmsg:'很遗憾，回答错误',
    count:1
  },
  //事件处理函数

  gonext: function (e) {
    util.navigateTo({
      url: "/pages/detailon/detail",
      //url: "/pages/detailqiandao2/detail?fujiati=1" // 沟通确认： 失败页面的再试一次 跳转到答题页面
    });
  },

  gonext3: function (e) {
    util.navigateTo({
      //url: "/pages/detailon/detail",
      url: "/pages/detailqiandao2/detail?fujiati=1" // 沟通确认： 失败页面的再试一次 跳转到答题页面
    });
  },

  //跳过加分任务，后台需要处理，让加分任务的签到点是完成状态。
  gonext2: function (e) {
    console.log("jiafenrenwufinish req-curpointid  " + app.globalData.curpointid )
    wx.request({
      url: app.globalData.baseurl +'wx/jiafenrenwufinish',
      header: { 'content-type': 'application/json' },
      data: {
        pointid: app.globalData.curpointid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("jiafenrenwufinish res  " + JSON.stringify(res2.data.data))
        if (res2.data.data == 'ok') {
          util.navigateTo({ 
            url: "/pages/detailon/detail",
          });
        }
      }
    })


  },

  onShow: function () {

  },
  onLoad: function (options) {
    console.log('qihndebug-options- ' + options)
    var that = this;
    that.setData({
      failmsg: options.failmsg
    })
  },

})
