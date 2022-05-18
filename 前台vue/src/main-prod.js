import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// import Element from 'element-ui'
import mavonEditor from 'mavon-editor'
import marked from 'marked'
import axios from 'axios'
import {VueJsonp} from 'vue-jsonp'
import NProgress from 'nprogress'
import { MessageBox, Message } from 'element-ui'
import './assets/fonts/iconfont.css'
// import 'element-ui/lib/theme-chalk/index.css'
// import './plugins/element.js'
// import '@/assets/css/animate.css'
import '@/assets/css/typo.css'
import 'mavon-editor/dist/css/index.css'
import '@/assets/css/global.css'
// import 'nprogress/nprogress.css'
import waterfall from 'vue-waterfall2'
import vcolorpicker from 'vcolorpicker'
// import * as echarts from 'echarts'
import md5 from 'js-md5'

Vue.prototype.$md5 = md5;
Vue.prototype.$marked = marked
Vue.prototype.$http = axios
Vue.prototype.$echarts = echarts
Vue.prototype.$jsonp = VueJsonp


const blog = axios.create({ // 博客后台api地址
  baseURL: 'http://blogapi.mitan007.cn'
})


blog.interceptors.request.use(config => {
  NProgress.start()
  config.headers.token = window.sessionStorage.getItem('token')
  return config
})

blog.interceptors.response.use(res => {
  NProgress.done()
  if (res.status !== 200) {
      Promise.reject('network error');
      return;
    }
    // 未设置状态码则默认成功状态
  const { code, msg } = res.data;
  if (code == 0 || code == 1 || code == 110 || code == 101 || code == 403 || code == 500) {
      Message({
        message: msg,
        type: 'error'
      })
      return Promise.reject(msg)
    } else {
      //返回标准 code/msg/data字段
      return res;
    }
},
error => {
console.log('err' + error)
let {
  message
} = error;
if (message == "Network Error") {
  message = "后端接口连接异常";
} else if (message.includes("timeout")) {
  message = "系统接口请求超时";
} else if (message.includes("Request failed with status code")) {
  message = "系统接口" + message.substr(message.length - 3) + "异常";
}
Message({
  message: message,
  type: 'error',
  duration: 5 * 1000
})
return Promise.reject(error)
})


Vue.prototype.$blog = blog

Vue.config.productionTip = false
Vue.use(mavonEditor)
Vue.use(VueJsonp)
Vue.use(vcolorpicker)
Vue.use(waterfall)

Vue.filter('dataFormat', function (originVal) {
  const dt = new Date(originVal)
  const y = dt.getFullYear()
  const m = (dt.getMonth() + 1 + '').padStart(2, '0')
  const d = (dt.getDate() + '').padStart(2, '0')
  return `${y}-${m}-${d}`
})

Vue.filter('dataFormat2', function (originVal) {
  const dt = new Date(originVal)
  const y = dt.getFullYear()
  const m = (dt.getMonth() + 1 + '').padStart(2, '0')
  const d = (dt.getDate() + '').padStart(2, '0')
  return `${y}-${m}`
})

Vue.filter('dataFormat3', function (originVal) {
  const dt = new Date(originVal)
  let usedTime = new Date() - dt
  let days = Math.floor(usedTime / (24 * 3600 * 1000)); // 计算出天数
  let leavel = usedTime % (24 * 3600 * 1000); // 计算天数后剩余的时间
  let hours = Math.floor(leavel / (3600 * 1000)); // 计算剩余的小时数
  let leavel2 = leavel % (3600 * 1000); // 计算剩余小时后剩余的毫秒数
  let minutes = Math.floor(leavel2 / (60 * 1000)); // 计算剩余的分钟数
  if (days > 0) return days + '天前'
  if (hours > 0) return hours + '小时前'
  return minutes + '分前'
})


Vue.filter('dataFormat4', function (originVal) {
  const dt = new Date(originVal)
  const y = dt.getFullYear()
  const m = (dt.getMonth() + 1 + '').padStart(2, '0')
  const d = (dt.getDate() + '').padStart(2, '0')
  const h = (dt.getHours() + '').padStart(2, '0')
  const M = (dt.getMinutes() + '').padStart(2, '0')
  const s = (dt.getSeconds() + '').padStart(2, '0')
  return `${y}-${m}-${d} ${h}:${M}:${s}`
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
