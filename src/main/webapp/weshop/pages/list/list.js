const app = getApp()
Page({
  data: {
    baseurl: app.globalData.baseurl,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  //事件处理函数
  onShareAppMessage: function () {
  },
  onShow:function(){
    var userid = wx.getStorageSync("userid")
    console.log("onLaunch userid " + userid)
    if (userid == null || userid == '') {
      //return;
    }
    this.setData({
      cur:1
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/getLineList',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("login getLineList2 " + JSON.stringify(res2.data.data))
        that.setData({
          actvielist: res2.data.data,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function () {
    //this.islogin()
  },

  todetail: function(e){
    console.log('todetail-'+ e.target.dataset.lineid)
    wx.navigateTo({
      url: "/pages/detail/detail?lineid=" + e.target.dataset.lineid,
    });
  },

})
