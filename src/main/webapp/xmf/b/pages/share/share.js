const util = require('../../utils/util.js')
const app = getApp() // 分享页面
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
    shareimgpath: '',
    src: '',
    point:{},
    line:{},
    
    
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
    return {
      title: '我参与了绿色家园建设每日打卡行动，邀请你一起来!',
      //desc: '我参与了绿色家园建设每日打卡行动，邀请你一起来!',
      path: '/pages/meiridaka/meiridaka' // 路径，传递参数到指定页面。
     }
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

  showimgTap:function(e){
    console.log('showimgTap ' + JSON.stringify(e))
    console.log('showimgTap ' + e.currentTarget.dataset.imgsrc)
    wx.previewImage({
      current: e.currentTarget.dataset.imgsrc,
      urls: [e.currentTarget.dataset.imgsrc]
    })
  },
  createshareimg: function(e){
    //console.log('createshareimg ' + JSON.stringify(e))
    console.log('createshareimg-curlineid ' + app.globalData.curlineid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/createshareimg',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curlineid,
        nickname: that.data.userInfo.nickName,
        avatarurl: that.data.userInfo.avatarUrl,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("createshareimg res  " + JSON.stringify(res2.data))
        that.setData({
          shareimgpath: res2.data.shareimgpath,
          hasUserInfo: true
        })

        //获取相册授权
        wx.getSetting({ success(res) {
          if (!res.authSetting['scope.writePhotosAlbum']) {
            wx.authorize({
              scope:'scope.writePhotosAlbum',
              success() {
                console.log('授权成功')
              }
            })
          }
        }})

        var imgSrc = that.data.baseurl+"download?filename="+that.data.shareimgpath
        console.log("imgSrc: "+imgSrc)
  
        let fileName = new Date().valueOf();
        let filePath = wx.env.USER_DATA_PATH + '/' + fileName + '.jpg'
        wx.downloadFile({
        url: imgSrc,
        filePath:filePath,
        success: function (res) {
          console.log(res);
        //图片保存到本地
        wx.saveImageToPhotosAlbum({
          //filePath: res.tempFilePath,
          filePath: filePath,
          success: function (data) {
          wx.showToast({
            title: '保存成功',
            icon: 'success',
            duration: 2000
          })
        },
        fail: function (err) {
          console.log(err);
          if (err.errMsg === "saveImageToPhotosAlbum:fail auth deny") {
            console.log("当初用户拒绝，再次发起授权")
          wx.openSetting({
            success(settingdata) {
              console.log(settingdata)
              if (settingdata.authSetting['scope.writePhotosAlbum']) {
                console.log('获取权限成功，给出再次点击图片保存到相册的提示。')
              } else {
                console.log('获取权限失败，给出不给权限就无法正常使用的提示')
              }
            }
           })
          }
        },
        complete(res){
          console.log(res);
        }
        })

        }
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
      url: app.globalData.baseurl + 'wx/linedetailshare',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: 3,
        userid: wx.getStorageSync("userid")
      }, success(res2) { 
        console.log("share onShow  " + JSON.stringify(res2.data.data))
        that.setData({
          line: res2.data.data,
          point: res2.data.point,
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

  
})
