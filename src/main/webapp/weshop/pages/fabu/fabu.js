const util = require('../../utils/util.js')
const app = getApp()
Page({
  onShareAppMessage() {
  },
  data: {
    baseurl: app.globalData.baseurl,
    src: '',
    cameraflag:false,
    countries: ["中国", "美国", "英国"],
    countryIndex: 1,
  },
  openCamera: function (e) {
    this.setData({
      cameraflag: true,
      src: "",
    })
  },
  takePhoto(e) {
    var that = this;
    this.openCamera(e)
    setTimeout(function(){},1000) 
    const ctx = wx.createCameraContext()
    ctx.takePhoto({
      quality: 'high',
      success: (res) => {
        app.globalData.curupimgsrc = res.tempImagePath
        wx.showToast({
          title: '正在处理...',
          icon: 'none',
          duration: 1000
        })
        that.qiandaotap(e)
        this.setData({
          cameraflag: false,
          src: res.tempImagePath,
        })
      }
    })
  },
  chooseImage: function (e) {
    var that = this;
    this.setData({
      cameraflag: false,
      src: "",
    })
    wx.chooseImage({
      sizeType: ['original', 'compressed'], 
      sourceType: ['album', 'camera'],
      success: (res) => {
        app.globalData.curupimgsrc = res.tempFilePaths[0]
        console.log("chooseImage-res " + res.tempFilePaths)
        wx.showToast({
          title: '正在验证信息！',
          icon: 'none',
          duration: 2000
        })
        
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        this.setData({
          //files: that.data.files.concat(res.tempFilePaths),
          src:  res.tempFilePaths,
        });
        that.qiandaotap(e)
      }
    })
  },
  qiandaotap: function (e) {
    console.log('qiandaotap ' + JSON.stringify(e))
    var res1 = e.currentTarget.dataset.res
    //var pages = getCurrentPages()    //获取加载的页面
    //var currentPage = pages[pages.length - 1]    //获取当前页面的对象
    var that = this
    wx.uploadFile({
      url: app.globalData.baseurl +'wx/upfile',
      name: 'imagefile', filePath: app.globalData.curupimgsrc,
      header: { 'Content-Type': 'multipart/form-data'},
      formData: {
        'user': 'test'
      },
      success(res) {
        console.log('uploadFile res ' + JSON.stringify(res))
        var resjson = JSON.parse(res.data)
        console.log('uploadFile res2 ' + resjson.data)
        app.globalData.curupimgsrc = resjson.data
      },
      fail(res){
        console.log('uploadFile fail res ' + JSON.stringify(res))
      }
    })
  },
  bindCountryChange: function(e) {
    console.log('picker country 发生选择改变，携带值为', e.detail.value);
    this.setData({
        countryIndex: e.detail.value
    })
  },
  formSubmit(e) {
    e.detail.value.picture1 = app.globalData.curupimgsrc
    e.detail.value.userid = wx.getStorageSync("userid")
    console.log('form发生了submit事件，携带数据为：', e.detail.value)
    wx.request({
      url: app.globalData.baseurl +'we/saveItem',
      header: { 'content-type': 'application/json' },
      data: e.detail.value, 
      success(res2) {
        console.log("taplike res  " + JSON.stringify(res2.data))
        util.navigateTo({
          url: "/pages/detail/detail?id="+res2.data.weItem.id,
        });
      }
    })

  },

})