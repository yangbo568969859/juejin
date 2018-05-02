<template>
  <div class="navtop">
    <header :class="{visible:st}">
      <div class="nav-top-container">
        <a class="logo" @click="goHome()">
          <img src="/static/img/logo.png" alt="">
        </a>
        <nav class="index-navtop">
          <ul>
            <li class="nav-list">
              <div class="phone-show" @click="showList">
                <span>{{activeName}}</span>
                <span class="iconfont icon-xiajiantou"></span>
              </div>
              <ul :class="{'phone-hide':true,'show':active }">
                <li v-for="(v,i) in navlist" :key="i" @click="showName(v)">
                  <router-link replace :to="{path:v.path}">{{v.name}}</router-link>
                </li>
              </ul>
            </li>
            <li class="nav-item nav-search">
              <form action="" class="search-form">
                <input type="text">
                <img src="" alt="">
              </form>
            </li>
            <template v-if="adminInfo==false">
              <li class="nav-item nav-submit">
                <span class="iconfont icon-dkw_tianxie"></span>
                <span ref="write" @click="write()">写文章</span>
                <div class="nav-top-write" v-if="writeBoxShow">
                  <div class="nav-top-write-title">
                    一起来写文章吧！！！
                  </div>
                  <div class="nav-top-write-cont">
                    <ul>
                      <li>我们一起分享</li>
                      <li>我们一起分享</li>
                      <li>我们一起分享</li>
                    </ul>
                  </div>
                  <button class="nav-top-write-btn" @click="startWrite()">开始写文章</button>
                </div>
              </li>
              <li class="nav-item nav-login">
                <span class="loginin" @click="login()">登录</span>
                <span @click="register()">注册</span>
              </li>
            </template>
            <template v-if="adminInfo==true">
              <li class="nav-item nav-add">
                <div class="nav-add-group">
                  <button class="add-btn" @click="writeArticle()">写文章</button>
                  <div class="add-more" @click="shareLink()">
                    <i class="iconfont icon-sanjiaodown"></i>
                  </div>
                  <ul class="more-list" v-show="showShare">
                    <li class="item" @click="shareLinkOperaty()">分享链接</li>
                  </ul>
                </div>
              </li>
              <li class="nav-item nav-login nav-admin nav-display">
                <span @click="lingdang()" class="iconfont icon-lingdang"></span>
                <LingDang :active="lingdangShow" @lingdang="lingdang"/>
              </li>
              <li class="nav-item nav-login nav-admin">
                <span @click="geren()" class="iconfont icon-geren2"></span>
                <GeRen :active="gerenShow" @submit="geren"/>
              </li>
            </template>
          </ul>
        </nav>
      </div>
    </header>
    <my-login :active="loginShow" @close="login" @goRegister="register"/>
    <my-register :active="registerShow" @close="register" @goLogin="login"/>
  </div>
</template>
<script>
import myLogin from '@/components/login/Login.vue'
import myRegister from '@/components/login/Register.vue'
import LingDang from './LingDang.vue'
import GeRen from './GeRen.vue'
export default {
  name:'NavTop',
  data() {
    return {
      navlist:[
        {
          name:'首页',
          path:'/one'
        },
        {
          name:'活动',
          path:'/two'
        },
        {
          name:'库',
          path:'/three'
        },
        {
          name:'个人中心',
          path:'/myadmin'
        }
      ],
      active:false,
      activeName:'首页',
      loginShow:false,
      registerShow:false,
      writeBoxShow:false,
      lingdangShow:false,
      gerenShow:false,
      showShare:false,
      st: true
    }
  },
  components:{
    myLogin,
    myRegister,
    LingDang,
    GeRen
  },
  watch:{
  },
  methods:{
    // 鼠标移入
    // toggleShow() {
    //   this.writeBoxShow=!this.writeBoxShow;
    // },
    showList() {
      this.active=!this.active;
    },
    showName(v) {
      this.activeName=v.name;
      this.active=!this.active;
    },
    // 写文章
    writeArticle() {
      this.$router.push({
        path:'/edit'
      })
    },
    // 点击写文章边上下箭头分享
    shareLink() {
      this.showShare = !this.showShare
    },
    // 点击分享链接
    shareLinkOperaty() {
      this.$router.push({
        // path:"/newshare"
        name:'newshare'
      })
    },
    // 去首页
    goHome() {
      this.$router.push({
        path:'/'
      })
    },
    // 登录弹窗
    login(v) {
      if (v) {
        this.registerShow=!this.registerShow
      }
      this.loginShow=!this.loginShow;
    },
    // 注册弹窗
    register(v) {
      if (v) {
        this.loginShow=!this.loginShow;
      }
      this.registerShow=!this.registerShow
    },
    // 点击铃铛
    lingdang() {
      this.lingdangShow=!this.lingdangShow;
    },
    // 点击个人
    geren() {
      this.gerenShow=!this.gerenShow;
    },
    // 写文章
    write() {
      this.writeBoxShow=!this.writeBoxShow;
    },
    // 开始写文章
    startWrite() {
      this.registerShow = true;
      this.writeBoxShow = false;
    },
    // 控制顶部
    navFixed() {
      var st = document.documentElement.scrollTop || document.body.scrollTop;
      st >= 400 ? this.st = false : this.st = true
    }
  },
  mounted() {
    this.navFixed()
    window.addEventListener('scroll', this.navFixed)
    window.addEventListener('resize', this.navFixed)
  },
  computed:{
    adminInfo() {
      let data;
      if (localStorage.loginInfo) {
        console.log(JSON.parse(localStorage.loginInfo))
        data = JSON.parse(localStorage.loginInfo);
      } else {
        // data.logInState = false;
        return false;
      }
      console.log(localStorage.loginInfo);
      return data.logInState;
    }
  }
}
</script>
<style lang="less">
@my-topic-color: #217c8e;
.navtop{
  height:5rem;
  width:100%;
  position: relative;
}
.navtop{
  header{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: #fff;
    border-bottom: 1px solid #f1f1f1;
    // box-shadow: 2px 2px 2px #f1f1f1;
    z-index: 250;
    transition: all .2s;
    transform: translate3d(0,-100%,0);
  }
  header.visible{
    transform: translateZ(0);
  }
}
.nav-top-container{
  width:100%;
  max-width:960px;
  height:5rem;
  margin:auto;
  display: flex;
  align-items: center;
}
nav.index-navtop{
  height: 100%;
  flex: 1 0 auto;
  >ul{
    height:100%;
    display: flex;
    justify-content: flex-end;
    position: relative;
    li.nav-search{
      flex: 1 1 auto;
      align-items: center;
      display: flex;
      justify-content: flex-end;
      input{
        height: 30px;
        line-height: 30px;
        box-sizing: border-box;
        padding: 0 15px 0 30px;
        border: 1px solid #e3e3e3;
        color: #2c3e50;
        outline: none;
        border-radius: 15px;
        margin-right: 10px;
        transition: border-color 0.2s ease;
        background: rgba(227,231,236,.2) url(/static/img/search.png) 8px 5px no-repeat;
        background-size: 20px;
        vertical-align: middle !important;
      }
      input:focus{
        border: 1px solid @my-topic-color;
        background-color:#fff;
      }
    }
  }
}
.search-form{
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.nav-top-write{
  padding:20px;
  width:340px;
}
.nav-top-lingdang{
  width: 340px;
}
.lingdang-top{
  display: flex;
  border-bottom:1px solid #ebebeb;
  ul{
    width: 100%;
    display: flex;
    li{
      flex: 1;
      height: 42px;
      cursor: pointer;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
}
.lingdang-middle{
  height: 350px;
  overflow-x: hidden;
  overflow-y: auto;
}
.lingdang-footer{
  height: 42px;
  line-height: 42px;
  display: flex;
  padding: 0 14px;
  align-items: center;
  justify-content: space-between;
  a{
    display: inline-block;
    color: #8590a6;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
  }
}
.nav-top-write{
  position: absolute;
  top:104%;
  left:50%;
  transform: translateX(-50%);
  background-color: #fff;
  box-shadow: 0 2px 6px 0 rgba(0,0,0,.3);
  font-size:14px;
  color:#909090;
  cursor: default;
}
.nav-top-write::before{
  content: "";
  position: absolute;
  top: 0;
  left: 50%;
  width: 10px;
  height: 10px;
  border-top: 1px solid hsla(220,6%,72%,.5);
  border-left: 1px solid hsla(220,6%,72%,.5);
  background-color: #fff;
  transform: rotate(45deg) translate(-50%,-50%);
  transform-origin: 0 0;
}
.nav-top-write-title{
  text-align: center;
  margin-bottom: 20px;
  font-weight: 600;
  color:#333;
  font-size:18px;
}
.nav-top-write-cont{
  ul{
    margin-left:40px;
    li{
      list-style: initial;
      margin-bottom: 10px;
      width:100%;
    }
  }
}
.nav-top-write-btn{
  margin: 0 auto;
  outline: 0;
  border:none;
  display: block;
  margin: 2rem auto 0;
  background-color: #83c73a;
  color: #fff;
  font-size: 1.2rem;
  padding: 1rem 4rem;
  cursor: pointer;
}
.nav-submit:after{
  content: '|';
  position: absolute;
  top: 20px;
  left: 100%;
  color: hsla(0,0%,59%,.4);
}
.nav-item{
  color: #71777c;
  padding: 0 1.2rem;
  font-size: 16px;
  position: relative;
  display: flex;
  align-items: center;
  color:@my-topic-color;
  cursor: pointer;
  span.loginin:after{
    content: "\B7";
    margin: 0 .4rem;
  }
}
.nav-admin{
  color:#8590a6;
  .iconfont.icon-lingdang{
    font-size: 20px;
  }
  .iconfont.icon-geren2{
    font-size: 24px;
  }
}
.nav-list{
  ul{
    display: flex;
    li{
      padding:0 20px;
      height:5rem;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size:16px;
      cursor: pointer;
      position: relative;
      a{
        color:#71777c;
        text-decoration: none;
      }
      a:hover{
        color:#217c8e;
      }
      a:before{
        content: '';
        position:absolute;
        top:0;
        left:0;
        right:0;
        bottom:0;
      }
      a.youAreInHere{
        color:#217c8e;
      }
    }
  }
}
.logo{
  width:100px;
  height:40px;
  overflow: hidden;
  margin-right:2rem;
  cursor: pointer;
  img{
    width:100%;
    height: 100%;
  }
}
.phone-show{
  display: none;
  cursor: pointer;
}

.nav-add-group{
  display:flex;
  align-items:center;
  height:32px;
  position: relative;
  cursor: pointer;
  .add-btn{
    border: none;
    outline: none;
    padding:0 10px;
    font-size: 14px;
    height: 100%;
    color: #fff;
    background-color: #007fff;
    border-radius: 3px;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    cursor: pointer;
  }
  .add-more{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 16px;
    height: 100%;
    flex: 0 0 auto;
    background-color: #007fff;
    border-left:1px solid hsla(0,0%,100%,.1);
    border-radius:3px;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
    .iconfont{
      font-size: 12px;
      color: #fff;
    }
  }
  .more-list{
    width: 100%;
    position: absolute;
    top: 100%;
    left: 0;
    color: #3b76c5;
    font-size: 14px;
    padding: 7px 0;
    background-color: #fff;
    border: 1px solid #ebebeb;
    border-radius: 2px;
    box-shadow: 0 1px 2px 0 rgba(0 , 0, 0, 0.05);
    li{
      padding-left: 10px;
    }
  }
}

@media (max-width: 980px) {
  .nav-top-container{
    width:96%;
  }
  nav.index-navtop{
    ul{
      li.nav-search,li.nav-submit{
        display: none;
      }
    }
  }
  .nav-list{
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 1;
    background-color: #fff;
  }
  .nav-list ul.phone-hide{
    display: none;
    background-color: #fff;
    box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);
    border: 1px solid hsla(217,5%,71%,.45);
    border-radius: 4px;
    font-size: 1.2rem;
  }
  .nav-list ul li{
    height:4rem;
  }
  .nav-list ul.show{
    display: block;
  }
  .phone-show{
    display: block;
    display: flex;
    height:5rem;
    align-items: center;
    justify-content: center;
    padding: 0 3rem 0 2rem;
    font-size:16px;
    color: @my-topic-color;
  }
  .logo{
    margin-right:0;
  }
  .nav-display{
    display: none;
  }
  .nav-add{
    display: none;
  }
}
</style>

