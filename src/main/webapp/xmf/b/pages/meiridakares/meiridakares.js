const util = require('../../utils/util.js')
const app = getApp() // 每日打卡结果页
Page({
  data: {
    cur:5,
    prizeimg:'',
    baseurl: app.globalData.baseurl,
    success:'',
    finish:'0',
    count:'1',
    examname:'',
    jifen:'',
    line: {},
  },
  //事件处理函数
  
  gorank: function (e) { 
    util.navigateTo({
      url: "/pages/meiridakarank/detail",
    });
  },
  mrdatap: function(e){
    util.navigateTo({
      url: '/pages/meiridaka/meiridaka?'
    })

  },

  onShow:function(){
    wx.setNavigationBarTitle({
      title: '每日打卡'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/linedetailon',
      header: { 'content-type': 'application/json' },
      data: {
        code: 1,
        lineid: 2,
        // 上个版本没有传递此参数，注意
        userid: wx.getStorageSync("userid")
      }, success(res) {
        console.log("detailon linedetailon  " + JSON.stringify(res.data))
        that.setData({
          line: res.data.line, //parseFloat
          hasUserInfo: true
         })
      }
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
