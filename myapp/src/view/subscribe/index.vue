<template>
  <main class="containter">
    <div class="subscribe-box">
      <nav class="subscribe-nav">
        <ul>
          <li v-for="(v,i) in list" :key="i" :class="{active:navActive==v.path}" @click="goChildren(v.path)">
            <span>{{v.name}}</span>
          </li>
        </ul>
      </nav>
      <div class="subscribe-view">
        <div class="subscribe-view-box">
          <!-- <transition :name="transitionName"> -->
            <router-view class="sub-child-view"></router-view>
          <!-- </transition> -->
        </div>
      </div>
    </div>
  </main>
</template>
<script>
  export default {
    name: 'subscribe',
    data() {
      return {
        navActive: 'subscribed',
        list: [{
            name: '已关注的标签',
            path: 'subscribed'
          },
          {
            name: '全部标签',
            path: 'alltags'
          },
        ],
        transitionName: 'slide-right'
      }
    },
    methods: {
      goChildren(path) {
        this.$router.push({
          name: path
        })
        this.navActive = this.$route.name
      }
    },
    watch: {
      '$route' (to, from) {　　　
        let isBack = this.$router.isBack //  监听路由变化时的状态为前进还是后退
        　　　
        if (isBack) {　　　　
          this.transitionName = 'slide-right'　　　
        } else {　　　　
          this.transitionName = 'slide-left'　　　
        }　　
        this.$router.isBack = false　　
      }
    }
  }
</script>
<style lang="less">
  main.containter {
    max-width: 960px;
    width: 100%;
    margin: 0 auto;
    position: relative;
  }
  .subscribe-box {
    margin-top: 20px;
  }
  .subscribe-content {
    margin-top: 60px;
  }
  .subscribe-nav {
    position: fixed;
    background: #fff;
    top: 5rem;
    left: 0;
    width: 100%;
    height: 40px;
    z-index: 100;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);
    transition: all .2s;
    transform: translateZ(0);
    ul {
      max-width: 960px;
      margin: auto;
      line-height: 1;
      display: flex;
      align-items: center;
      height: 100%;
      li {
        height: 100%;
        display: flex;
        align-items: center;
        padding: 0 15px;
        font-size: 14px;
        border-bottom: 2px solid transparent;
        transition: border-bottom .3s, color .3s;
        cursor: pointer;
      }
      li:hover {
        color: #217c8e;
        border-bottom-color: #217c8e;
      }
      li.active {
        color: #217c8e;
        border-bottom-color: #217c8e;
      }
    }
  }
  .subscribe-view {
    margin-top: 60px;
    margin-bottom: 24px;
    max-width: 100%;
  }
</style>
<style lang="less">
  .sub-child-view {
    position: absolute;
    width: 100%;
    transition: transform, opacity .8s ease;
  }
  .slide-right-enter-active,
  .slide-right-leave-active,
  .slide-left-enter-active,
  .slide-left-leave-active {
    will-change: transform;
    transition: all 500ms;
    position: absolute;
  }
  .slide-right-enter {
    opacity: 0;
    transform: translate3d(-100%, 0, 0);
  }
  .slide-right-leave-active {
    opacity: 0;
    transform: translate3d(100%, 0, 0);
  }
  .slide-left-enter {
    opacity: 0;
    transform: translate3d(100%, 0, 0);
  }
  .slide-left-leave-active {
    opacity: 0;
    transform: translate3d(-100%, 0, 0);
  }
</style>
