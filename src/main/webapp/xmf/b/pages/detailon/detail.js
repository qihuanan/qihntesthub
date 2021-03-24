const util = require('../../utils/util.js')
const app = getApp() // 任务点详情页面

Page({
  data: {
    motto: 'Hello World',
    baseurl: app.globalData.baseurl,
    longitude: 116.384537,
    latitude: 40.018720,
    scale: 14,
    scalecur: 14,
    iosDialog1: false,
    unlock: false,
    dakaflag:false,
    photoflag:false,
    files: [],
    line: {},
    pointlist:[],
    tipList:[],
    point:{},
    initmarkers:{},
    prepoint:'', // 上次的点击点
    pointUserinfoList:'',
    kouchujifen:1,
    tipid:0,
    juli: 1,
    src: '',
    curpoint:{id:1,name:'任务点1',desc:'任务描述1', 
      tips:[
        {id:1,tip:'tips1',desc:'tips desc1'},
      ]
    },

    markers: [],
    polyline: [],
    controls: [{
      id: 1, iconPath: '/pages/images/icon_my_location.png', clickable: true,
      position: {left: 10, top:  10,width: 30, height: 30}
    },{
        id: 2, iconPath: '/pages/images/icon_zoom_out.png', clickable: true,
        position: { left: 10, top: 50, width: 30, height: 30 }
      }],
    
    
  },
  //事件处理函数 
  regionchange(e) {
    console.log(e.type)
  },
  totask :function(){
    wx.navigateTo({
      url: '/pages/detailqiandao2/detail'
    })
  },
  showimgTap: function (e) {
    console.log('showimgTap ' + JSON.stringify(e))
    console.log('showimgTap ' + e.currentTarget.dataset.imgsrc)
    wx.previewImage({
      current: e.currentTarget.dataset.imgsrc,
      urls: [e.currentTarget.dataset.imgsrc]
    })
  },
  markertap(e) {
    var that = this
    console.log('markertap ' + JSON.stringify(e) )
    console.log('markertap '+e.markerId)
    if(this.data.line.orderflag == '1'){
      if(app.globalData.curpointid != e.markerId){
        e.markerId = app.globalData.curpointid
        wx.showToast({
          title: '本线路需按顺序签到，请先完成当前签到点！',
          icon: 'none',
          duration: 4000
        })
      }
    }
    app.globalData.curpointid = e.markerId
    console.log('markertap curpointid ' + e.markerId)
    
    var markers = that.data.initmarkers
    for (var i in markers) {
      if (markers[i].iconPath.indexOf("select")) {
        //markers[i].iconPath = "/pages/images/icon-des-d@2x.png"
        markers[i].iconPath = markers[i].iconPath.replace("select","unchecked")
      }
      markers[i].width = "30"
      markers[i].height = "30"
      markers[i].title = ""
    }
    for (var i in markers) {
      if (markers[i].id == that.data.prepoint) {
        //markers[i].iconPath = "/pages/images/icon-des-d@2x.png"
        break;
      }
    }
    for (var i in markers){
      if (markers[i].id == e.markerId){
        //markers[i].iconPath = "/pages/images/icon-flg-ylw@2x.png"
        //markers[i].iconPath = "/pages/images/svg/unchecked/point-unchecked02.svg"
        markers[i].iconPath = markers[i].iconPath.replace("unchecked","select")
        markers[i].width = "40"
        markers[i].height = "40"
        break;
      }
    }
    that.setData({
      markers: markers,
      prepoint: e.markerId
    })
    
    wx.request({
      url: app.globalData.baseurl +'wx/tiplist',
      header: { 'content-type': 'application/json' },
      data: {
        pointid: e.markerId,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("markertap res " + JSON.stringify(res2.data))
        that.setData({
          point: res2.data.point,
          unlock:false,
          scale:res2.data.line.qizhidaxiao,
          markers:markers, // 不导致多次重绘
          'line.jingdu': res2.data.point.jingdu,
          'line.weidu': res2.data.point.weidu,
          tipList: res2.data.tipList
        })
      }
    })
    
  },
  controltap(e) {
    var that = this
    console.log('controltap ' + e.controlId)
    if (e.controlId == 1){
      wx.getLocation({
        //type: 'wgs84',
        type: 'gcj02',
        success(res) {
          console.log('controltap-res ' + JSON.stringify(res))
          that.setData({
            scale: that.data.scalecur,
            'point.weidu': res.latitude,
            'point.jingdu': res.longitude
          })
        },
        fail(res) {
          wx.showToast({
            title: '位置信息获取失败，请前往设置开启位置服务！',
            icon: 'none',
            duration: 1000
          })
        }
      })
    }else{
      this.setData({
        scale: that.data.scalecur,
        'point.weidu': that.data.latitude,
        'point.jingdu': that.data.longitude
      })
    }
    
  },
  dakachaoshi: function(){
    wx.showToast({
      title: '超时啦，不能继续签到！',
      icon: 'none',
      duration: 5000,
    })
  },
  close: function () {
    this.setData({
      iosDialog1: false,
    })
  },
  close2: function (e) { //unlockTip 
    
    var that = this
    console.log("detailon close2 " + that.data.tipid + ' ' + wx.getStorageSync("userid"))
    wx.request({
      url: app.globalData.baseurl +'wx/unlockTip',
      header: { 'content-type': 'application/json' },
      data: {
        tipid: that.data.tipid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("unlockTip " + JSON.stringify(res2.data))
        that.setData({
          mess: '',
          tipList: res2.data.tipList
          //listshow: 1
        })
      }
    })
    this.setData({
      unlock: true,
      iosDialog1: false,
    })
  },
  openIOS1: function (e) {
    console.log("detailon openIOS1 " + JSON.stringify(e))
    var canunlock = e.currentTarget.dataset.canunlock
    if (canunlock != '1'){
      console.log("detailon openIOS1  请按顺序先解锁上面的提示！")
      wx.showToast({
        title: ' 请按顺序先解锁上面的提示！',
        icon: 'none',
        duration: 3000
      })
      return;
    }else{
      this.setData({
        iosDialog1: true,
        kouchujifen: e.currentTarget.dataset.jifen,
        tipid: e.currentTarget.dataset.tipid
      })
    }
    
  },
  dakaflagtap: function(){
    this.setData({
      dakaflag: true
    })
  },
  onShareAppMessage: function () {
    return {
      title: '我在“'+ this.data.line.name +'”，来跟我一起，发现身边世界的精彩吧!',
      //lichunbo,增加分享标题
      url: '/pages/login/login?goto=detail&lineid=' + app.globalData.curlineid
     }
  },

  taplike: function (e) {
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
        console.log("taplike res  " + res2.data.data)
        console.log("taplike res  " + JSON.stringify(res2.data.data))
        that.setData({
          'line.like': res2.data.data,
          hasUserInfo: true
        })
      }
    })

  },
  bindViewTap: function() {
    util.navigateTo({
      url: '../logs/logs'
    })
  },
  verifylocaiton: function () {
     wx.showToast({
            title: '签到位置校验中...',
            icon: 'loading',
            duration: 8000
          })
     //上面为lichunbo添加，获取高精度位置信息，需5秒以上时间，提示用户等待
    var that = this
    var jingdu = this.data.point.jingdu
    var weidu = this.data.point.weidu
    var juli = this.data.juli

    wx.getLocation({
      type: 'gcj02',

      success(res) {
        console.log('verifylocaiton ' + JSON.stringify(res))
        var distance = that.distance(res.latitude, res.longitude, weidu, jingdu);
        var accuracy = res.accuracy;
        console.log("verifylocaiton当前位置距离北京故宫：", distance, "米","定位精度：",accuracy)
        if (parseInt(juli) > parseInt(distance)) {//|| res1 == 1
          console.log("verifylocaiton签到距离内：" + app.globalData.curupimgsrc)
          util.navigateTo({ // reLaunch redirectTo
            url: '/pages/detailqiandao2/detail'
          })
        } else {
          util.navigateTo({
            url: '/pages/msgwarn/msg_warn?distance=' + distance
          })
        }
      },
      fail: () => {
        //不允许打开定位
        wx.getSetting({
          success: function (res) {
            console.log('getSetting...', res)
            if (res.authSetting["scope.userLocation"] == true) {
              console.log("用户已开启定位授权");
            } else {
              wx.showModal({
                title: '开启位置服务',
                content: '位置信息未开启，无法完成签到!',
                confirmText: '开启',
                confirmColor: '#fabf13',
                cancelText: '拒绝',
                cancelColor: '#999999',
                success: function (res) {
                  if (res.confirm) {
                    wx.openSetting({
                      fail: function () {
                        console.log('openSetting.failed')
                      }
                    })
                  }
                  if (res.cancel) {
                    wx.showModal({
                      title: '签到失败',
                      content: '无法使用位置信息，签到失败！',
                      confirmText: '太遗憾了',
                      confirmColor: '#345391',
                      showCancel: false
                    })
                  }
                }
              })
            }
          }
        })
        //上面为lichunbo添加，在用户未开启定位时，再次弹窗提示开启

      }
    })
  },
  gomap: function(e){
    util.navigateTo({
      url: '/pages/detailmap/detail'
    })
  },
  islogin: function () {
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') {
      util.navigateTo({
        url: '/pages/login/login?goto=detailon&lineid=' + app.globalData.curlineid
      })
    }
  },
  getCanPlayline: function () {
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
      }
    })
  },

  // 实时签到信息
  pointLiving: function(e){
    console.log('pointLiving-lineid: ' + app.globalData.curlineid)
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/pointLiving',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curlineid
      }, success(res2) {
        console.log("pointLiving res  " + JSON.stringify(res2.data))
        that.setData({
          pointUserinfoList: res2.data
        })
      }
    })

  },

  onShow: function (options){
    this.islogin()
    var that = this
    //this.getCanPlayline()
    var userid = wx.getStorageSync("userid")
    wx.request({
      url: app.globalData.baseurl +'wx/getCanPlayline',
      header: { 'content-type': 'application/json' },
      data: {
        lineid: app.globalData.curlineid,
        userid: wx.getStorageSync("userid")
      }, success(res1) {
        console.log("getCanPlayline res  " + JSON.stringify(res1.data))
        wx.setStorageSync("needpay", res1.data.needpay)
        
        var userid = wx.getStorageSync("userid")
        console.log("onLaunch userid " + userid)
        if (userid == null || userid == '') {
          return;
        }
        wx.setNavigationBarTitle({
          title: '线索提示'
        })
        
        //this.getLineList(that)
        wx.request({
          url: app.globalData.baseurl +'wx/linedetailon',
          header: { 'content-type': 'application/json' },
          data: {
            code: 1,
            lineid: app.globalData.curlineid,
            // 上个版本没有传递此参数，注意
            pointid: app.globalData.curpointid2,
            userid: wx.getStorageSync("userid")
          }, success(res2) {
            console.log("detailon linedetailon  " + JSON.stringify(res2.data))
            //that.actvielist = res2.data.data
            console.log("测试  " + res2.data.line.yidaka +"abc" + res2.data.line.dianshu)
            if(res2.data.point.id){
              app.globalData.curpointid = res2.data.point.id
              app.globalData.curlinename = res2.data.line.name 
            }
            //扫码用过后清空
            app.globalData.curpointid2 = 0
            that.setData({
              line: res2.data.line, //parseFloat
              pointlist: res2.data.pointlist,
              tipList: res2.data.tipList,
              point: res2.data.point,
              longitude: res2.data.line.jingdu,
              latitude: res2.data.line.weidu,
              markers: res2.data.marklist,
              initmarkers: res2.data.marklist,
              scale: res2.data.line.ditudaxiao,
              scalecur: res2.data.line.ditudaxiao,
              juli: res2.data.line.qiandaojuli,
              hasUserInfo: true
              
            })
            that.pointLiving()
            if(res2.data.line.yidaka*3 == res2.data.line.dianshu || (res2.data.line.yidaka*3-1)==res2.data.line.dianshu || (res2.data.line.yidaka*3 - 2) == res2.data.line.dianshu){
              wx.showModal({
                title: '探索小能手！',
                content: '很棒哦，已经完成三分之一的签到任务啦！',
                confirmText: '继续探索',
                confirmColor: '#fabf13',
                showCancel:false,
              })
            }

            if(res2.data.line.yidaka*2 == res2.data.line.dianshu || (res2.data.line.yidaka*2-1)==res2.data.line.dianshu){
              wx.showModal({
                title: '探索小能手！',
                content: '很棒哦，已经完成一半的签到任务啦！',
                confirmText: '继续探索',
                confirmColor: '#fabf13',
                showCancel:false,
              })
            }
            if(res2.data.line.yidaka == res2.data.line.dianshu){
              wx.showModal({
                title: '探索小能手！',
                content: '太棒啦，你完成了全部签到任务！获得了'+ res2.data.line.jifen + '积分！',
                confirmText: '确定',
                confirmColor: '#fabf13',
                showCancel:false,
              })
            }
          }
        })

      }
    })

    setTimeout(function(){
      console.log(1);
     }, 2000)
    
  },
  onLoad: function (options) {
    console.log("detailon onLoad " + JSON.stringify(options))
    var curlineid = app.globalData.curlineid
    console.log("detailon onLoad-curlineid " + curlineid)
    if (options && options.lineid){
      console.log("detailon onLoad" + options.lineid)
      app.globalData.curlineid = options.lineid
      curlineid = app.globalData.curlineid
      console.log("detailon onLoad-curlineid2 " + curlineid)
    }else{
      //app.globalData.curlineid = 10
    }
    //app.globalData.curpointid2 = 120 
    //options.pointid = 122
    if (options && options.pointid){
      app.globalData.curpointid2 = options.pointid
      console.log("detailon onLoad-curpointid2 " + options.pointid)
    }


   },

  distance: function (la1, lo1, la2, lo2) { //返回距离(单位千米或公里) 
    var La1 = la1 * Math.PI / 180.0;
    var La2 = la2 * Math.PI / 180.0;
    var La3 = La1 - La2;
    var Lb3 = lo1 * Math.PI / 180.0 - lo2 * Math.PI / 180.0;
    var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(La3 / 2), 2) + Math.cos(La1) * Math.cos(La2) * Math.pow(Math.sin(Lb3 / 2), 2)));
    s = s * 6378.137;
    s = Math.round(s * 10000) / 10000;
    s = s.toFixed(3);
    s = s * 1000 // 返回米
    return s;
  }
  
  
})
/**
 * label: {
        content: '金水区绿地原盛国际',  //文本
        color: '#FF0202',  //文本颜色
        borderRadius: 3,  //边框圆角
        borderWidth: 1,  //边框宽度
        borderColor: '#FF0202',  //边框颜色
        bgColor: '#ffffff',  //背景色
        padding: 5,  //文本边缘留白
        textAlign: 'center'  //文本对齐方式。有效值: left, right, center
      }
 * 
 */