const util = require('../../utils/util.js')
const app = getApp()
Page({
  onShareAppMessage() {
  },
  data: {
    baseurl: app.globalData.baseurl,
    files:[],
    upedfiles:[],
    cameraflag:false,
    weCateList:[],
    weItemindex: 0,
  },
  openCamera: function (e) {
    this.setData({
      cameraflag: true,
    })
  },
  takePhoto(e) {
    var that = this;
    this.setData({
      files:[]
    })
    this.openCamera(e)
    setTimeout(function(){},1000) 
    const ctx = wx.createCameraContext()
    ctx.takePhoto({
      quality: 'high',
      success: (res) => {
        app.globalData.curupimgsrc = res.tempImagePath
        that.setData({
          cameraflag: false,
          files: that.data.files.concat(res.tempImagePath),
        });
        wx.showToast({
          title: '正在处理...',
          icon: 'none',
          duration: 1000
        })
        //that.qiandaotap(e)
        that.qiandaotapbatch(that.data.files[0],that)   
        
      }
    })
  },
  chooseImage: function (e) {
    var that = this;
    this.setData({
      cameraflag: false,
      files:[]
    })
    wx.chooseImage({
      sizeType: ['original', 'compressed'], 
      sourceType: ['album', 'camera'],
      success: (res) => {
        app.globalData.curupimgsrc = res.tempFilePaths[0]
        console.log("chooseImage-res---------------- " + res.tempFilePaths)
        wx.showToast({
          title: '正在验证信息！',
          icon: 'none',
          duration: 2000
        })
        
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        this.setData({
          files: that.data.files.concat(res.tempFilePaths),
          //src:  res.tempFilePaths,
        });
        console.log('qiandaotap ' + JSON.stringify(that.data.files))
        wx.showToast({ title: '正在处理...',icon: 'none', duration: 2000})
        for(var i=0;i<that.data.files.length;i++){
          //that.qiandaotap(e)
          that.qiandaotapbatch(that.data.files[i],that)   
          that.mysleep(100)
        }
        console.log('uploadFilebatch res ' + JSON.stringify(that.data.upedfiles))
        
      }
    })
  },
  mysleep:function(delay) {
    var start = (new Date()).getTime();
    while((new Date()).getTime() - start < delay) { continue; }
  },
  qiandaotap: function (e) {
    console.log('qiandaotap ' + JSON.stringify(e))
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
  qiandaotapbatch: function (filepath,that) {
    wx.uploadFile({
      url: app.globalData.baseurl +'wx/upfile',
      name: 'imagefile', filePath: filepath,
      header: { 'Content-Type': 'multipart/form-data'},
      formData: {},
      success(res) {
        console.log('qiandaotapbatch res ' + JSON.stringify(res))
        var resjson = JSON.parse(res.data)
        //console.log('uploadFile res2 ' + resjson.data)
        //app.globalData.curupimgsrc = resjson.data
        
        that.setData({
          upedfiles: that.data.upedfiles.concat(resjson.data),
        });
      },
      fail(res){
        console.log('qiandaotapbatch fail res ' + JSON.stringify(res))
      }
    })
  },

  bindCountryChange: function(e) {
    console.log('picker country 发生选择改变，携带值为', e.detail.value);
    this.setData({
      weItemindex: e.detail.value
    })
  },
  formSubmit(e) {
    //e.detail.value.picture1 = app.globalData.curupimgsrc
    if(this.data.upedfiles.length>0){
      e.detail.value.picture1 = this.data.upedfiles.join(";")
    }
    console.log('formSubmit-upedfiles--------- ', this.data.upedfiles);
    e.detail.value.userid = wx.getStorageSync("userid")
    if(e.detail.value.name == ""){
      wx.showToast({
        title: '请填写发布内容！',
        icon: 'none',
        duration: 2000
      })
      return false;
    }
    console.log('form发生了submit事件，携带数据为：', e.detail.value)
    wx.showToast({
      title: '发布内容腾讯大数据自动审核，非法内容被记录，请文明发布！',
      icon: 'none',
      duration: 3000
    })
    var target = "we/saveItem"
    if( e.detail.value.id!=''){
      target = "we/updateItem"
    }
    wx.request({
      url: app.globalData.baseurl +target,
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
  onShow:function(id){
    var userid = wx.getStorageSync("userid")
    if (userid == null || userid == '') {
      return;
    }
    var that = this
    wx.request({
      url: app.globalData.baseurl +'we/getCateList',
      header: { 'content-type': 'application/json' },
      data: {}, success(res2) {
        console.log("onShow-getCateList " + JSON.stringify(res2.data))
        that.setData({
          weCateList: res2.data.weCateList ,
          hasUserInfo: true
        })
        if(app.globalData.curitemid !='' && app.globalData.curitemid != 'undefined'){
          wx.request({
            url: app.globalData.baseurl + 'we/getItem',
            header: { 'content-type': 'application/json' },
            data: {
              id: app.globalData.curitemid,
              userid: wx.getStorageSync("userid")
            }, success(res2) {
              console.log("detail onShow  " + JSON.stringify(res2.data.data))
              that.setData({
                weItem: res2.data.weItem,
                weItemindex:res2.data.weItemindex,
                hasUserInfo: true
              })
            }
          })

        }

      }
    })

    

  },
  onLoad: function (options) {
    //this.islogin()
    console.log("onLoad-id:"+ options.id)
    app.globalData.curitemid = options.id


  },


})