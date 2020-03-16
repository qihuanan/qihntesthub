const util = require('../../utils/util.js')
const app = getApp() // 答题失败页面功能
Page({
  data: {
    cur: 5,
    baseurl: app.globalData.baseurl,
    failmsg:'很遗憾，回答错误',
    count: 1
  },
  //事件处理函数

  gonext: function (e) {
    wx.reLaunch({
      url: "/pages/detailon/detail",
      //lichunbo，失败重试跳转到提示页，重置页面深度
    });
  },
  gonext4: function (e) {
    wx.reLaunch({
      url: "/pages/detailon/detail",
      //lichunbo，对应再试一次，跳转提示页面
    });
  },
  gonext3: function (e) {
    util.navigateTo({
       url: "/pages/detailqiandao2/detail?fujiati=1" 
       // 沟通确认： 失败页面的再试一次 跳转到答题页面
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
          wx.reLaunch({
           url: "/pages/detailon/detail",
           //lichunbo,跳过加分任务，重置页面深度，跳转到地图页
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
      failmsg: options.failmsg,
      count: options.count,
      fujiati: options.fujiati,// 上个页面是否是附加题
    })
  },

})
