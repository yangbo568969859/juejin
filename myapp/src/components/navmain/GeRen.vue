<template>
  <transition name="fade">
    <div>
      <div class="nav-top-geren" v-if="active">
        <ul>
          <div class="geren-box" v-for="v in list" :key="v.id">
            <li v-for="vv in v.list" :key="vv.id">
              <a @click="goPage(vv.path)">
                <i :class="['iconfont' ,vv.icon]"></i>
                <span>{{vv.title}}</span>
              </a>
            </li>
          </div>
          <div class="geren-box">
            <li>
              <a @click="logout()">
                <i class="iconfont icon-tuichu"></i>
                <span>登出</span>
              </a>
            </li>
          </div>
        </ul>
      </div>
      <LoginOut :active="logoutShow" @submit="logout"/>
    </div>
  </transition>
</template>
<script>
  import LoginOut from '@/components/login/LoginOut.vue'
  export default {
    props: ['active'],
    data() {
      return {
        logoutShow: false,
        list:[
          {
            id:1,
            list:[
              {
                id:1,
                title:'我的主页',
                icon:'icon-wode-active',
                path:'/myadmin'
              },
              {
                id:2,
                title:'我喜欢的',
                icon:'icon-shoucang',
                path:'/myadmin/likes'
              }
            ]
          },
          {
            id:2,
            list:[
              {
                id:1,
                title:'设置',
                icon:'icon-shezhi1',
                path:'/settings/profile'
              },
              {
                id:2,
                title:'标签管理',
                icon:'icon-biaoqian',
                path:'/subscribe'
              }
            ]
          }
        ]
      }
    },
    methods: {
      // 跳转页面
      goPage(path) {
        this.$router.push({
          path:path,
          query:{

          }
        })
        this.$emit('submit')
      },
      logout() {
        this.logoutShow = !this.logoutShow
        if (this.logoutShow === true) {
          this.$emit('submit')
        }
      }
    },
    components:{
      LoginOut
    }
  }
</script>

<style lang="less">
  .geren-box {
    border-bottom: 1px solid rgba(0, 0, 0, .04);
    padding: 12px 0;
    li:hover {
      background: hsla(0, 0%, 95%, .5);
    }
    li {
      font-size: 14px;
      cursor: pointer;
      a {
        display: flex;
        align-items: center;
        padding: 6px 12px;
        color: #71777c;
        i{
          display: inline-block;
          width: 1em;
          height: 1em;
          margin-right: 10px;
          font-size: 1.2em;
          vertical-align: middle;
          color: #b2bac2;
        }
      }
    }
  }
  .nav-top-geren {
    width: 140px;
  }
  .nav-top-geren {
    border-radius: 3px;
    position: absolute;
    top: 104%;
    left: -30%;
    transform: translateX(-50%);
    background-color: #fff;
    box-shadow: 0 2px 6px 0 rgba(0, 0, 0, .3);
    font-size: 14px;
    color: #909090;
    cursor: default;
  }
  .nav-top-geren::before,
  {
    content: "";
    position: absolute;
    top: 0;
    left: 85%;
    width: 10px;
    height: 10px;
    border-top: 1px solid hsla(220, 6%, 72%, .5);
    border-left: 1px solid hsla(220, 6%, 72%, .5);
    background-color: #fff;
    transform: rotate(45deg) translate(-50%, -50%);
    transform-origin: 0 0;
  }
  // .fade-enter-active,
  // .fade-leave-active {
  //   transition: transform ease 0.3s, opacity ease 0.3s, height ease 0.3s;
  // }
  // .fade-enter,
  // .fade-leave-to {
  //   opacity: 0;
  //   transform: translateY(-40%);
  //   transform-origin: top center;
  // }
  // .fade-enter-to,
  // .fade-leave {
  //   opacity: 1;
  //   transform-origin: top center;
  //   transform: translateY(0%);
  // }
</style>

