import Vue from "vue"
import store from "@/store"
// 引入观察者
import IntersectionObserver from '@/assets/js/intersection-observer-polyfill';

// 审明观察者
let observer = null

// store 的 scrollNodePosition 指针
const scrollNodePosition = store.state.scrollNodePosition
export const observerAndScrollIntoView = (to, from) => {
  // 仅存在一个 观察者模式 防止性能浪费
  Vue.nextTick(() => {
    if (observer) {
      // 删除删一个观察者
      observer.disconnect();
      observer = null;
    }
    // 获取当前页面的 主显示 元素
    let searchGroupParent = ""
    let searchGroup = ""
  })
}
