const util = require('../../utils/util.js')
const app = getApp()
//尺寸比例计算（页面宽度已750为准，即750*scale，所有尺寸乘以scale，即可兼容各种大小屏幕）
const scale = wx.getSystemInfoSync().windowWidth / 750
Page({
  data: {
    userInfo: {},
    baseurl: app.globalData.baseurl,
    iosDialog1: false,
    unlock: false,
    dakaflag:false,
    photoflag:false,
    files: [],
    src: '',
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
  onShareAppMessage: function () {
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
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '分享'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl + 'wx/linedetail',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: 3,
        userid: wx.getStorageSync("userid")
      }, success(res2) { 
        console.log("share onShow  " + JSON.stringify(res2.data.data))
        that.setData({
          line: res2.data.data,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function (options) {

    if (app.globalData.userInfo) {
      console.log('qihndebug-1-app.globalData.score ' + app.globalData.score)
      this.setData({
        userInfo: app.globalData.userInfo,
        //score: app.globalData.score,
        hasUserInfo: true
      })
    }else if (this.data.canIUse) {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        console.log('qihndebug-res1 ' + res.userInfo)
        app.globalData.userInfo = res.userInfo
        wx.setStorageSync("hasUserInfo", true)
        console.log('qihndebug-2-app.globalData.score ' + app.globalData.score)
        this.setData({
          userInfo: res.userInfo,
          //score:app.globalData.score,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          console.log('qihndebug-res22 ' + res.userInfo)
          app.globalData.userInfo = res.userInfo
          wx.setStorageSync("hasUserInfo", true)
          console.log('qihndebug-3-app.globalData.score ' + app.globalData.score)
          this.setData({
            userInfo: res.userInfo,
            //score: app.globalData.score,
            hasUserInfo: true
          })
        }
      })
    }

    this.setData({
      userInfo: app.globalData.userInfo,
      hasUserInfo: true
    })
    
  },

  drawShareImage() {
    //绘制canvas图片
    //创建一个canvas对象
    const ctx = wx.createCanvasContext('shareBox', this);
    // this.drawNormalText(ctx, "canvas生成的图片", 0, 0, 30, '#ffffff', 'left', 'middle')
    //商品主图
    var bgSize1 = 750 / 500
    this.drawImage(ctx, "/pages/images/share_share.png", 20, 20, 710, 710 / bgSize1);
    //绘制商品标题部分
    var bgSize2 = 750 / 246
    this.drawImage(ctx, "/pages/images/share_share.png", 20, 490, 710, 710 / bgSize2);
    //绘制分享标题
    this.drawNormalText(ctx, "canvas生成的图片", 50, 548, 30, '#ffffff', 'left', 'middle')
    this.drawNormalText(ctx, "230.00元", 50, 660, 30, 'red', 'left', 'middle')
    this.drawNormalText(ctx, "230.00元", 50 + 1, 660, 30, 'red', 'left', 'middle')
    this.drawNormalText(ctx, "230.00元", 50, 660 + 1, 30, 'red', 'left', 'middle')
    this.drawNormalText(ctx, "230.00元", 50 + 1, 660 + 1, 30, 'red', 'left', 'middle')
    //绘制canvas标记(绘制圆形并加阴影)
    ctx.arc(120 * scale, 120 * scale, 80 * scale, 0, 5 * scale * Math.PI)
    ctx.setFillStyle('#22aaff')
    ctx.setShadow(0, 0, 20 * scale, "#aaaaaa")
    ctx.fill()
    this.drawNormalText(ctx, "Canvas", 118, 100, 30, 'white', 'center', 'middle')
    this.drawNormalText(ctx, "合成", 118, 140, 30, 'white', 'center', 'middle')

    //绘制画布，并在回调中获取画布文件的临时路径
    var self = this
    ctx.draw(true, function() {
      wx.canvasToTempFilePath({
        canvasId: 'shareBox',
        success(res) {
          console.log(res)
          if (res.tempFilePath) {
            self.setData({
              shareUrl: res.tempFilePath
            })
            wx.setStorageSync("shareUrl", res.tempFilePath)
          }
        }
      })
    });
  },
  //绘制图片封装
  drawImage(ctx, url, x, y, w, h) {
    ctx.drawImage(url, x * scale, y * scale, w * scale, h * scale);
  },
  // 绘制只有一行的文字
  drawNormalText(ctx, str, x, y, font, style, align, baseLine) {
    ctx.setFontSize(font * scale);
    ctx.setFillStyle(style);
    ctx.setTextAlign(align);
    ctx.setTextBaseline(baseLine);
    ctx.fillText(str, x * scale, y * scale);
  },
  
})
