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
        cate: 2,//购物车 待
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("home loadlistdate2-res  " + JSON.stringify(res2.data))
        that.setData({
          weItemUserList: that.data.weItemUserList.concat(res2.data.weItemUserList) ,
        })
        that.getTotalPrice();
      }
    })
  },
  onReady() {
    this.getTotalPrice();
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
  },

  /**
   * 计算总价
   */
  getTotalPrice() {
    let weItemUserList = this.data.weItemUserList;                  // 获取购物车列表
    let total = 0;
    for(let i = 0; i<weItemUserList.length; i++) {         // 循环列表得到每个数据
      if(weItemUserList[i].selected == '1') {                     // 判断选中才会计算价格
        total += weItemUserList[i].num * weItemUserList[i].weItem.price;   // 所有价格加起来
      }
    }
    this.setData({                                // 最后赋值到data中渲染到页面
      weItemUserList: weItemUserList,
      totalPrice: total.toFixed(2)
    });
  },

  toPay() {
    if(!this.data.hasAddress){
      wx.showToast({
        title: '请填写收货信息！',
        icon: 'none',
        duration: 2000
      })
      return false;
    }
    wx.showModal({
      title: '提示',
      content: '下单后请按约定时间地点支付取货收货',
      text:'center',
      complete() {
        wx.request({
          url: app.globalData.baseurl +'we/cartyuding', // 
          header: { 'content-type': 'application/json' },
          data: {
            userid: wx.getStorageSync("userid")
          }, success(res2) {
            console.log("home loadlistdate2-res  " + JSON.stringify(res2.data))
          }
        })

      }
    })
  }

})