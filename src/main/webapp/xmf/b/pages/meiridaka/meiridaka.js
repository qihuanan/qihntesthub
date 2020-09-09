const util = require('../../utils/util.js')
const app = getApp()
// 页面从 qiandao2原型来，注意样式和数据结构
Page({
  data: {
    motto: 'Hello World',
    baseurl: app.globalData.baseurl,
    iosDialog1: false,
    unlock: false,
    dakaflag:false,
    photoflag:false,
    cur: 3,
    files: [],
    src: '',
    pictureupres:'',
    cate:'',
    line:{},
    point:{},
    exam: { picture1:''},
    juli: 1,
    inputValue:'',
    ritems: [
      { value: 'USA', name: '北京' },
      { value: 'FRA', name: '上海' },
    ],
    verify:"0",// 答案是否对
  },
  //事件处理函数
  radioChange: function (e) {
    console.log('radio发生change事件，携带value值为：', e.detail.value)
    this.setData({
      inputValue: e.detail.value,
    })
  },
  bindKeyInput: function (e) {
   // console.log('bindKeyInput  ' + JSON.stringify(e))
    this.setData({
      inputValue: e.detail.value,
      //verify: '1', 
    })
    this.data.exam.answer.split(';').forEach(v => {
      if (v == e.detail.value) {
        
      }
    })
  }, 

  mrdksubmit: function(){
    var that = this
    wx.showToast({
      title: '校验中...',
      icon: 'none',
      duration: 2000
    })
    if(that.data.inputValue.trim() == ''){
      wx.showToast({
        title: '请填写答案...',
        icon: 'none',
        duration: 2000
      })
      return;
    }

    wx.request({
      url: app.globalData.baseurl +'wx/qiandao', //
      header: { 'content-type': 'application/json' },
      data: {
        examid: that.data.exam.id,
        answer: that.data.inputValue,
        pointid: app.globalData.curpointid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("mrdksubmit-res  " + JSON.stringify(res2.data))
        if (res2.data.data == 'has') {
          util.navigateTo({ // redirectTo  navigateTo
            url: '/pages/meiridakares/meiridakares?prizeimg=ok&jifen=' + that.data.point.jifen + '&success=' + that.data.exam.success+ '&finish='+ res2.data.finish + '&count='+res2.data.count+"&examname="+that.data.exam.name
          })
        }
        if (res2.data.data == 'err' || res2.data.data == 'errnochance') {
          util.navigateTo({
            url: '/pages/meiridakares/meiridakares?success=' + that.data.exam.fail+'&prizeimg=err'+"&examname="+that.data.exam.name
          })
        }
       
        if (res2.data.data == 'ok') {
          util.navigateTo({ // redirectTo  navigateTo
            url: '/pages/meiridakares/meiridakares?prizeimg=ok&jifen=' + that.data.point.jifen + '&success=' + that.data.exam.success+ '&finish='+ res2.data.finish + '&count='+res2.data.count+"&examname="+that.data.exam.name
          })
        }

      }
    })
  },

  bindViewTap: function() {
    util.navigateTo({
      url: '../logs/logs'
    })
  },
  onShow: function (options){
    wx.setNavigationBarTitle({
      title: '每日打卡'
    })
    var that = this
    wx.request({
      url: app.globalData.baseurl +'wx/exam',
      header: { 'content-type': 'application/json' },
      data: {
        pointid: app.globalData.curpointid,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("detail qiandaotap-res  " + JSON.stringify(res2.data))
        that.setData({
          point: res2.data.point,
          cate: res2.data.exam.cate,
          ritems: res2.data.radiolist,
          exam: res2.data.exam
        })
        
      }
    })

    this.setData({
      cur: 3,
    })
    
  },
  onLoad: function (options) {
    console.log("meiridaka-onLoad-cate " + options.cate)
    this.setData({
      cate: options.cate,
    })
    app.globalData.curpointid = 1
    console.log("meiridaka-onLoad-point " + app.globalData.curpointid)
    
  },

  distance: function (la1, lo1, la2, lo2) { //返回距离(单位千米或公里)
    var La1 = la1 * Math.PI / 180.0;
    var La2 = la2 * Math.PI / 180.0;
    var La3 = La1 - La2;
    var Lb3 = lo1 * Math.PI / 180.0 - lo2 * Math.PI / 180.0;
    var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(La3 / 2), 2) + Math.cos(La1) * Math.cos(La2) * Math.pow(Math.sin(Lb3 / 2), 2)));
    s = s * 6378.137;
    s = Math.round(s * 10000) / 10000;
    
    s = s.toFixed(2);
    s = s * 1000 // 返回米
    return s;
  }
  
  
})