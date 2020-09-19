const formatTime = date => {
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  const hour = date.getHours()
  const minute = date.getMinutes()
  const second = date.getSeconds()

  return [year, month, day].map(formatNumber).join('/') + ' ' + [hour, minute, second].map(formatNumber).join(':')
}

const formatNumber = n => {
  n = n.toString()
  return n[1] ? n : '0' + n
}

var format = function (text) {
	if (!text) {
        return
    }
    var reg = getRegExp('\\\\n', 'g')
    return text.replace(reg,'\n')
}

module.exports = {
  formatTime: formatTime,
  format:format,
  navigateTo(object) {
    console.log("getCurrentPages: " + getCurrentPages().length)
    if (getCurrentPages().length > 7) {
      wx.redirectTo(object)
      // this.reLaunch(object)
    } else {
      wx.navigateTo(object)
    }
  }
}
