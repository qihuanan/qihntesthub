const util = require('../../utils/util.js')
const app = getApp()
Page({
    data: {
        inputShowed: false,
        inputVal: ""
    },
    showInput: function () {
        this.setData({
            inputShowed: true
        });
    },
    hideInput: function () {
        this.setData({
            inputVal: "",
            inputShowed: false
        });
    },
    clearInput: function () {
        this.setData({
            inputVal: ""
        });
    },
    // 键盘抬起事件
  inputTyping: function (e) {
    console.log(e.detail.value)
    var that = this;
    if (e.detail.value == '') {
      return;
    }
    that.setData({
      inputVal: e.detail.value
    });
    wx.request({
      url: app.globalData.baseurl +'wx/getLineList',
      header: { 'content-type': 'application/json' },
      data: {
        userid: wx.getStorageSync("userid")
      }, success(res2) {
        console.log("login getLineList2 " + JSON.stringify(res2.data.data))
        that.setData({
          list: res2.data.data,
        })
      }
    })
  },
  // 获取选中推荐列表中的值
  btn_name: function (res) {
    var that = this;
    //that.hideInput();
    console.log('name:  ' + res.currentTarget.dataset.name);
    console.log('nameid:  ' + res.currentTarget.dataset.id);
    util.navigateTo({
      url: "/pages/detail/detail?lineid=" + res.currentTarget.dataset.id,
    });
  },
// 回车搜索
search: function (e) {
  console.log(e.detail.value)
  var that = this;
  if (e.detail.value == '') {
    return;
  }
  that.setData({
    inputVal: e.detail.value
  });
  util.navigateTo({
    url: "/pages/list/list?name=" + e.detail.value,
  });
  wx.request({
    url: app.globalData.baseurl +'wx/getLineList',
    header: { 'content-type': 'application/json' },
    data: {
      userid: wx.getStorageSync("userid")
    }, success(res2) {
      console.log("login getLineList2 " + JSON.stringify(res2.data.data))
      that.setData({
        list: res2.data.data,
      })
    }
  })
},

});