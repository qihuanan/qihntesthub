const app = getApp()
const util = require('../../utils/util.js')
Page({
  data:{
    address:{
      name:'',
      phone:'',
      detail:''
    }
  },
  onLoad(){
    var self = this;
    
    wx.getStorage({
      key: 'address',
      success: function(res){
        self.setData({
          address : res.data
        })
      }
    })
  },
  saveuserinfo(mobile,linkopenid,linkmobile){
    wx.request({
      url: app.globalData.baseurl +'we/setaddress', // 
      header: { 'content-type': 'application/json' },
      data: {
        mobile: mobile,
        linkopenid: linkopenid,
        linkmobile: linkmobile,
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("home saveuserinfo-res  " + JSON.stringify(res2.data))
      }
    })

  },
  formSubmit(e){
    var that = this
    const value = e.detail.value;
    if (value.name && value.phone && value.detail){
      wx.setStorage({
        key: 'address',
        data: value,
        success(){
          that.saveuserinfo(value.phone,value.name,value.detail)         
          wx.navigateBack();
        }
      })
    }else{
      wx.showModal({
        title:'提示',
        content:'请填写完整资料',
        showCancel:false
      })
    }
  }
})