<template>
  <main class="containter">
    <div :class="['one-box', loginin?'welcome-view':'timeline-index-view']">
      <div class="one-Recommend">
        <nav :class="{'view-nav':true,'view-top':st}">
          <ul v-if="categorylist">
            <li class="small-nav">
              <a>我关注的</a>
            </li>
            <li v-for="(v,i) in categorylist" :key="i" class="small-nav">
              <a @click="goChildren(v.title)">{{v.name}}</a>
            </li>
            <li class="right">
              <a @click="goSubscribe()">标签管理</a>
            </li>
          </ul>
        </nav>
        <nav class="login-one-nav">
          <ul>
            <div class="login-one-nav-img" :style="{backgroundImage:'url('+'/static/img/22.png'+')'}"></div>
            <li>
              <span @click="goEdit()">写文章</span>
            </li>
            <li>
              <span @click="goShare()">分享链接</span>
            </li>
          </ul>
        </nav>
        <nav class="one-nav">
          <h5>热门</h5>
          <ul class="one-nav-ul">
            <li v-for="(v,i) in navList" :key="i" @click="clickTag(v)" :class="{youAreInHere:v.checked}">
              <span>{{v.name}}</span>
            </li>
          </ul>
        </nav>
        <router-view></router-view>
      </div>
      <aside class="one-aside">
        <div class="one-aside-login">
          <div class="one-aside-login-title">登录</div>
          <div class="one-aside-login-society">一个版主</div>
          <div class="login-input-group">
            <div class="input-box">
              <input v-model="loginData.phone" type="text" placeholder="昵称">
            </div>
            <div class="input-box">
              <input v-model="loginData.password" type="text" placeholder="手机号/邮箱">
            </div>
            <div class="input-box">
              <input v-model="loginData.password" type="text" placeholder="密码（不少于6位）">
            </div>
          </div>
          <button class="login-button">立即注册</button>
          <div class="else-login">
            <div class="else-login-title">第三方账号登录</div>
            <third-login />
          </div>
        </div>
        <div class="one-aside-card">
          <ul>
            <li>
              <a ><span class="iconfont icon-shoucang1"></span><span>我的收藏</span></a>
            </li>
            <li>
              <a ><span class="iconfont icon-changjianwenti"></span><span>我关注的问题</span></a>
            </li>
            <li>
              <a ><span class="iconfont icon-yaoqingzhaobiao"></span><span>我的邀请</span></a>
            </li>
          </ul>
        </div>
        <div class="one-aside-ad" v-for="(v,i) in adimg" :key="i">
          <a href="">
            <div :style="{backgroundImage: 'url(' + v.url + ')'}"></div>
          </a>
          <div class="ad-close">
            <i class="iconfont icon-cc-close-crude" @click="closeAd(v,i)"></i>
            <a class="ad-box">
              <span>投放</span>
              <span>广告</span>
            </a>
          </div>
        </div>
        <div class="one-aside-footer">
          <div class="one-aside-footer-title">关注我</div>
          <div class="one-aside-footer-middle">
            <ul>
              <li>
                <a href="javascript:;" target="_blank"><i class="iconfont icon-weibo"></i></a>
              </li>
              <li class="wechat">
                <a href="javascript:;"><i class="iconfont icon-weixin"></i></a>
                <div class="wechat-box">
                  <div>微信扫一扫</div>
                  <div class="wechat-img">
                    <img src="/static/img/wechat.jpg" alt="">
                  </div>
                </div>
              </li>
              <li>
                <a href="https://github.com/yangbo568969859" target="_blank"><i class="iconfont icon-githubbox"></i></a>
              </li>
            </ul>
          </div>
          <div class="one-aside-footer-footer">
            <ul class="footer-more-list">
              <li>
                <a href="">关于</a>
              </li>
              <li>
                <a href="">招聘</a>
              </li>
              <li>
                <a href="">合作</a>
              </li>
              <li>
                <a href="">友情链接</a>
              </li>
            </ul>
            <ul class="footer-more-list">
              <li>
                <a href="">关于</a>
              </li>
              <li>
                <a href="">招聘</a>
              </li>
            </ul>
          </div>
        </div>
      </aside>
    </div>
  </main>
</template>
<script>
import ThirdLogin from '@/components/login/ThirdLogin.vue'
export default {
  name:'one',
  data() {
    return {
      navList:[
        {
          name:'推荐',
          path:'recommend',
          checked:true,
        },
        {
          name:'前端',
          path:'frontend',
          checked:false,
        },
        {
          name:'后端',
          path:'backend',
          checked:false,
        }
      ],
      list:[
        {
          name:'我关注的',
          path:'subscribed'
        },
        {
          name:'Android',
          path:'alltags'
        },
        {
          name:'前端',
          path:'alltags'
        },
        {
          name:'后端',
          path:'alltags'
        },
        {
          name:'后端',
          path:'alltags'
        },
        {
          name:'后端',
          path:'alltags'
        },
        {
          name:'后端',
          path:'alltags'
        },
      ],
      loginData:{},
      activeColor: 'red',
      fontSize: 30,
      adimg:[
        {
          url:'/static/img/ad1.jpg'
        },
        {
          url:'/static/img/ad2.jpg'
        }
      ],
      st:false
    }
  },
  components:{
    ThirdLogin
  },
  methods:{
    // 去写文章
    goEdit() {
      this.$router.push({
        name:'edit',
      })
    },
    // 去分享
    goShare() {
      this.$router.push({
        name:'newshare',
      })
    },
    clickTag(v) {
      this.navList.forEach(v=>{
        v.checked=false;
      })
      v.checked=true;
      this.$router.push({
        name:v.path
      })
    },
    closeAd(v, i) {
      this.adimg.splice(i, 1)
    },
    goChildren() {

    },
    goSubscribe() {
      this.$router.push({
        path:"/subscribe"
      })
    },
    // 获取category列表
    getCategoryList() {
      try {
        this.$store.dispatch('postRequestAllowError', {
          name:'category',
        })
      } catch (error) {

      }
    },
    // 控制顶部
    navFixed() {
      var st = document.documentElement.scrollTop || document.body.scrollTop
      st >= 400 ? this.st = true : this.st = false
    }
  },
  mounted() {
    window.addEventListener('scroll', this.navFixed)
    window.addEventListener('resize', this.navFixed)
    this.getCategoryList();
  },
  created() {
    this.getCategoryList();
  },
  computed:{
    loginin() {
      try {
        return this.$store.state.loginin;
      } catch (error) {
        return
      }
    },
    // 类目列表
    categorylist() {
      try {
        let data = this.$store.state.category.data;
        return data;
      } catch (error) {

      }
    }
  }
}
</script>
<style lang="less">
main.containter{
  max-width:960px;
  width: 100%;
  margin: auto;
  position: relative;
}
.one-box{
  align-items: flex-start;
  display: flex;
}
.one-Recommend{
  overflow: hidden;
  flex-grow: 1;
}
.one-aside{
  width: 240px;
  min-width: 240px;
  margin-left: 20px;
}

.login-one-nav{
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  background: #fff;
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
  transition: all .2s;
  transform: translateZ(0);
  ul{
    display: flex;
    align-items: center;
    li{
      padding: 0 20px;
      display: flex;
      align-items:center;
      cursor: pointer;
      span{
        color:#007fff;
      }
      span:hover{
        color:#0371df;
      }
    }
    .login-one-nav-img{
      width: 50px;
      height: 50px;
      margin-right:15px;
      border-radius: 2px 0 0 2px;
      display: inline-block;
      position: relative;
      background-position: 50%;
      background-size: cover;
      background-repeat: no-repeat;
      background-color: #eee;
    }
  }
}

.one-nav{
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding:1.5rem 2rem ;
  background: #fff;
  border-bottom: 1px solid #f6f6f6;
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
  h5{
    margin: 0;
    font-size: 16px;
    font-weight: 500;
  }
}
.one-nav-ul{
  display: flex;
  align-items: baseline;
  li{
    font-size: 14px;
    cursor: pointer;
  }
  li:not(:last-child){
    margin-right: 20px;
  }
  li.youAreInHere{
    color:#217c8e;
  }
  li:hover{
    color:#217c8e;
  }
}
.one-aside-login{
  background-color: #fff;
  border-radius: 4px;
  margin-bottom: 1.5rem;
  overflow: hidden;
  padding:20px;
  transition: all .3s ease-in-out;
}
.one-aside-login:hover{
  box-shadow: 0 6px 18px 0 rgba(232,237,250,.5);
}
.one-aside-login-title{
  margin-bottom: 8px;
  font-size: 16px;
  font-weight: 600;
  color: #2e3135;
}
.one-aside-login-society{
  margin-bottom: 8px;
  font-size: 14px;
  color: #2e3135;
}
.one-aside-card{
  padding:20px 0;
  background: #fff;
  margin-bottom: 1.5rem;
  transition: all .3s ease-in-out;
  ul{
    li{
      a{
        display: inline-block;
        height:40px;
        line-height:40px;
        width:100%;
        font-size:14px;
        color:#8590a6;
        text-decoration: none;
        padding:0 20px;
        cursor: pointer;
        span.iconfont{
          margin-right:10px;
        }
      }
      a:hover{
        background: #f6f6f6;
      }
    }
  }
}
.one-aside-card:hover{
  box-shadow: 0 6px 18px 0 rgba(232,237,250,.5);
}
.one-aside-ad{
  height:200px;
  background-color: #fff;
  border-radius: 2px;
  margin-bottom: 1.5rem;
  overflow: hidden;
  position: relative;
  cursor: pointer;
  a{
    div{
      width:100%;
      height: 100%;
      background-size: cover;
      background-repeat: no-repeat;
      background-position: 50%;
    }
  }
  .ad-close{
    i{
      position: absolute;
      display: none;
      font-size:14px;
      color:#666;
      top:.5rem;
      right:.5rem;
    }
    a.ad-box{
      height:20px;
      padding:0 6px;
      border:1px solid #fff;
      border-radius: 3px;
      position: absolute;
      bottom:10px;
      right:10px;
      color: #fff;
      font-size: 12px;
      background-color: rgba(0,0,0,.2);
      span:first-child{
        display: none;
      }
    }
    a.ad-box:hover{
      background-color: rgba(0,0,0,.4);
      span:first-child{
        display: inline-block;
      }
    }
  }
}
.one-aside-ad:hover{
  .ad-close{
    i{
      display: block;
    }
  }
}
.one-aside-footer{
  .one-aside-footer-title{
    display: flex;
    align-items: center;
    justify-content: center;
    color:#8590a6;
    margin-bottom:10px;
  }
  .one-aside-footer-middle{
    ul{
      display: flex;
      align-items: center;
      justify-content: center;
      a{
        text-decoration: none;
      }
      i{
        font-size:28px;
      }
      i.icon-weibo{
        color:#e44419;
      }
      i.icon-weixin{
        color:#a1d885;
      }
      i.icon-githubbox{
        font-size:32px;
        color:#ffbc67;
      }
    }
  }
}
.wechat{
  position: relative;
}
.wechat-box{
  display: none;
  position: absolute;
  width: 10rem;
  top: 100%;
  left: 0;
  background: #fff;
  text-align: center;
  .wechat-img{
    width:100%;
    img{
      width:100%;
    }
  }
}
.wechat:hover .wechat-box{
  display: block;
}
.footer-more-list{
  display:flex;
  justify-content: center;
  align-items: center;
  margin-bottom:5px;
  li{
    a{
      text-decoration: none;
      color:#8590a6;
    }
    a:after{
      content: "\B7";
      margin: 0 .4rem;
    }
  }
}
@media (max-width: 960px) {
  .one-aside{
    display: none;
  }
  .view-nav{
    ul{
      width: auto;
      overflow-x: auto;
      .right{
        display: none;
      }
    }
  }
}
</style>
