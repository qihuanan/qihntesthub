const app = getApp() 
const util = require('../../utils/util.js')
Page({
  data:{
    baseurl: app.globalData.baseurl,
    weItemUserList:[], 
    curpage : 1,
    address:{},
    hasAddress: false,
    totalPrice:0,
    
  },

  loadlistdate:function(curpage,that){ 
    console.log("home loadlistdate2-curpage  " + curpage)
    if(curpage == 1){ that.setData({ weItemUserList:[] } ) }
    wx.request({
      url: app.globalData.baseurl +'we/getLikeList', // 
      header: { 'content-type': 'application/json' },
      data: {
        curPage: curpage == undefined ? 1 : curpage,
        cate: 3,//我的订单
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("home loadlistdate2-res  " + JSON.stringify(res2.data))
        that.setData({
          weItemUserList: that.data.weItemUserList.concat(res2.data.weItemUserList) ,
        })
        
      }
    })
  },
  onReady() {
    
  },
  onLoad: function () {
    this.loadlistdate(1,this)
  },
  onShow:function(){
    const self = this;
    wx.getStorage({
      key:'address',
      success(res) {
        self.setData({
          address: res.data,
          hasAddress: true
        })
      }
    })
  }

})