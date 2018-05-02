<template>
  <transition name='slide-fade'>
    <div class="gotop-box">
      <button class="gotop-btn gotop-two" v-show="isShow" @click="gotop()">
        <svg class="Zi Zi--BackToTop" title="回到顶部" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg>
      </button>
    </div>
  </transition>
</template>

<script>
export default {
  name:'BackTop',
  props:{
    scrollmyself: {
      type: Boolean,  // 这是选择滚动对象的props值，如果滚动的对象是当前组件的父元素，就设置scrollObj为true.如果没有设置就默认为window对象
      default: false
    }
  },
  data() {
    return {
      isShow: false,
      target: ''
    }
  },
  methods:{
    // 添加样式，鼠标hover上去，改变颜色
    addhoverClass (e) {
      if (e.type === 'mouseover') {
        this.$el.classList.add('hover')
      } else if (e.type === 'mouseout') {
        this.$el.classList.remove('hover')
      }
    },
    showIcon () {
    //  根据scrollTop的值来判断是否显示返回顶部的icon
      if (this.target.scrollTop > 100) {
        this.isShow = true
        this.$el.addEventListener('mouseover', this.addhoverClass)
        this.$el.addEventListener('mouseout', this.addhoverClass)
      } else if (this.target.scrollTop < 100) {
        this.isShow = false
      }
    },
    getTop () {
    // 点击icon之后自动返回顶部的函数
      let timer = setInterval(() => {
        let top = this.target.scrollTop
        let speed = Math.ceil(top / 5)
        this.target.scrollTop = top - speed
        if (top === 0) {
          clearInterval(timer)
        }
      }, 20)
    }
  },
  mounted() {
    // 通过这个target来判断当前的滚动监听对象是谁
    if (this.scrollmyself) {
      this.target = this.$el.parentNode
    } else {
      this.target = document.body
    }
    this.target.addEventListener('scroll', this.showIcon)
  },
  beforeDestroy() {
  //  组件销毁的时候，需要删除scroll的监听事件。
    this.target.removeEventListener('scroll', this.showIcon)
  }
}
</script>
<style>
  .slide-fade-enter-active {
     transition: all .1s ease;
  }
  .slide-fade-leave-active {
    transition: all .1s cubic-bezier(1.0, 0.3, 0.8, 1.0);
    opacity: 0;
  }
  .slide-fade-enter, .slide-fade-leave-to {
   transform: translateY(-20px);
    opacity: 0;
  }
</style>

