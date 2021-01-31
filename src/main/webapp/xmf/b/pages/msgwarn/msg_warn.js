const app = getApp() // 留言失败页面
Page({
  data: {
    baseurl: app.globalData.baseurl,
    distance: '',
  },
  //事件处理函数
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  goback: function (options) {
    wx.navigateBack({
      delta: 1
    })
  },
  gonext: function (e) { 
    wx.redirectTo({
        url: "/pages/detailon/detail",
      });
    },
  
  onLoad: function (options) {
    console.log("onLoad " + options)
    this.setData({
      //point: res2.data.point,
      distance: options.distance
    })
  }


})
