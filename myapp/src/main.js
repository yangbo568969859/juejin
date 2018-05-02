// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import globalUI from '@/mycomponents'
// 引入store
import store from '@/store'

// 引入全局自定义组件
import NavTop from '@/components/navmain/NavTop'
import GlobalBox from '@/components/global/GlobalBox'
import GlobalAlert from '@/components/global/GlobalAlert'
import ShowImg from '@/components/global/ShowImg'
import Loading from '@/components/animation/loading'
import DrogUpload from '@/components/drogupload/DrogUpload'
Vue.component(NavTop.name, NavTop)
Vue.component(GlobalBox.name, GlobalBox)
Vue.component(GlobalAlert.name, GlobalAlert)
Vue.component(ShowImg.name, ShowImg)
Vue.component(Loading.name, Loading)
Vue.component(DrogUpload.name, DrogUpload)

// 全局组件
Vue.use(globalUI)

// 引入CSS样式
import '~/css/global.css'
import '~/css/index-root.less'

// 引入picker 事件日历组件
import 'vue-event-calendar/dist/style.css'
import vueEventCalendar from 'vue-event-calendar'
Vue.use(vueEventCalendar, {
  locale: 'zh'
}) // 可以设置语言，支持中文和英文

// 引入路由中文
// 定义路由守卫
import { observerAndScrollIntoView } from '@/router/routerafter.js'
import { getScrollAndChangeMeta } from '@/router/routerbefore.js'
router.beforeEach(getScrollAndChangeMeta)
router.afterEach(observerAndScrollIntoView)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
