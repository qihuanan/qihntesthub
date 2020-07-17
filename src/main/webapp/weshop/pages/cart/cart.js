const app = getApp()
const util = require('../../utils/util.js')
Page({
  data: {
    baseurl: app.globalData.baseurl,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    weItemList:[],
    curpage : 1,
    minusStatus: 'disabled',
    item:{},
  },
  //事件处理函数
  onShareAppMessage: function () {
  },
  onShow:function(curpage){
    
  },
  loadlistdate:function(curpage,that){
    var userid = wx.getStorageSync("userid")
    console.log("onShow userid " + userid+ " curpage:"+curpage)
    if(curpage == 1){ that.setData({ weItemList:[] } ) }
    that.setData({ cur:1  })
    wx.request({
      url: app.globalData.baseurl +'we/getItemList',
      header: { 'content-type': 'application/json' },
      data: {
        curPage: curpage == undefined ? 1 : curpage,
        status:1,
        //userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("onShow-getItemList " + JSON.stringify(res2.data))
        that.setData({
          weItemList: that.data.weItemList.concat(res2.data.weItemList) ,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad: function () {
    this.loadlistdate(1,this)
  },
  onPullDownRefresh: function() {
    this.loadlistdate(1,this)
  },
  onReachBottom: function() {
    //this.onShow(++this.data.curpage)
    this.loadlistdate(++this.data.curpage,this)
  },

  todetail: function(e){
    console.log('todetail-'+ e.target.dataset.lineid)
    util.navigateTo({
      url: "/pages/detail/detail?id=" + e.target.dataset.lineid,
    });
  },
  /* 点击减号 */  
  bindMinus: function() {  
    var num = this.data.num;  
    // 如果大于1时，才可以减  
    if (num > 1) {  
        num --;  
    }  
    // 只有大于一件的时候，才能normal状态，否则disable状态  
    var minusStatus = num <= 1 ? 'disabled' : 'normal';  
    // 将数值与状态写回  
    this.setData({  
        num: num,  
        minusStatus: minusStatus  
    });  
  },  
  /* 点击加号 */  
  bindPlus: function() {  
    var num = this.data.num;  
    // 不作过多考虑自增1  
    num ++;  
    // 只有大于一件的时候，才能normal状态，否则disable状态  
    var minusStatus = num < 1 ? 'disabled' : 'normal';  
    // 将数值与状态写回  
    this.setData({  
        num: num,  
        minusStatus: minusStatus  
    });  
  },  
/* 输入框事件 */  
  bindManual: function(e) {  
    var num = e.detail.value;  
    // 将数值与状态写回  
    this.setData({  
        num: num  
    });  
  }

})
