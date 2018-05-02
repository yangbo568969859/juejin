<template>
  <main class="containter">
    <div class="settings-box">
      <nav class="settings-nav">
        <ul>
          <li v-for="(v,i) in list" :key="i" :class="{active:navActive==v.path}" @click="goChildren(v.path)">
            <span>{{v.name}}</span>
          </li>
        </ul>
      </nav>
      <div class="setting-view">
        <div class="setting-view-box">
          <transition :name="transitionName">
            <router-view class="child-view"></router-view>
          </transition>
        </div>
        <aside></aside>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data() {
    return {
      navActive:'profile',
      list:[
        {
          name:'个人资料',
          path:'profile'
        },
        {
          name:'账号关联',
          path:'account'
        },
        {
          name:'修改密码',
          path:'password'
        }
      ],
      transitionName: 'slide-right'
    }
  },
  methods:{
    goChildren(path) {
      this.$router.push({
        name:path
      })
      this.navActive=this.$route.name
    }
  },
  watch: {
　　'$route'(to, from) {
　　　 let isBack = this.$router.isBack  //  监听路由变化时的状态为前进还是后退
　　　 if(isBack) {
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
main.containter{
  max-width:960px;
  width: 100%;
  margin:0 auto;
  position: relative;
}
.settings-box{
  margin-top:20px;
}
.settings-content{
  margin-top: 60px;
}
.settings-nav{
  position: fixed;
  background: #fff;
  top: 5rem;
  left: 0;
  width:100%;
  height: 40px;
  z-index: 100;
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
  transition: all .2s;
  transform: translateZ(0);
  ul{
    max-width: 960px;
    margin: auto;
    line-height: 1;
    display: flex;
    align-items:center;
    height: 100%;
    li{
      height: 100%;
      padding: 0 15px;
      font-size: 14px;
      display: flex;
      align-items: center;
      cursor: pointer;
    }
    li:hover{
      color:#217c8e;
    }
    li.active{
      color:#217c8e;
    }
  }
}
.setting-view{
  margin-top: 60px;
  margin-bottom: 24px;
  max-width: 100%;
  display: flex;
  aside{
    width: 240px;
    min-width: 240px;
    margin-left: 20px;
  }
  .setting-view-box{
    overflow: hidden;
    flex-grow: 1;
  }
}
@media (max-width: 960px){
  .setting-view{
    aside{
      display: none;
    }
  }
}
</style>

<style lang="less">
// 路由切换动画
.child-view {
  position: absolute;
  width:100%;
  transition: transform,opacity  .8s ease;
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


<style lang="less">
// 子组件样式
.profile{
  position: relative;
  padding: 20px 50px 80px;
  background-color: #fff;
  border-radius: 2px;
}
.profile-view{
  h1{
    margin: 10px 0;
  }
  .submit-btn{
    float: right;
    margin: 15px 0 0;
    padding: 10px 20px;
    font-size: 15px;
    color: #fff;
    background-color: #007fff;
    border-radius: 2px;
    border: none;
    outline: none;
    transition: background-color .3s,color .3s;
    cursor: pointer;
  }
}
.profile-list{
  li.item:first-child{
    padding:10px 0;
  }
  li.item{
    display: flex;
    align-items: center;
    border-top: 1px solid #f1f1f1;
    padding:15px 0;
    .title{
      font-size: 14px;
      color: #333;
      width: 120px;
    }
    .profile-input-box{
      display: flex;
      justify-content: flex-end;
      flex: 1;
      align-items:center;
      input{
        flex: 1;
        display: inline-block;
        border: none;
        outline: none;
        color: #909090;
        font-size: 15px;
        height: 25px;
      }
      .action-box{
        margin-left:12px;
        .edit-btn{
          background-color: transparent;
          color: #007fff;
          font-size: 1.2rem;
          padding: 0;
          white-space: nowrap;
          border-radius: 2px;
          border: none;
          outline: none;
          transition: background-color .3s,color .3s;
          cursor: pointer;
        }
      }
    }
  }
  li.item:last-child{
    border-bottom: 1px solid #f1f1f1;
  }
}
@media (max-width:600px) {
  .profile{
    padding: 1rem;
  }
  .profile-list li.item{
    flex-direction: column;
    align-items: flex-start;
    .title{
      width: 10rem;
      font-size: 16px;
      padding-bottom: 1rem;
    }
    .profile-input-box{
      width: 100%;
    }
  }
}
</style>

