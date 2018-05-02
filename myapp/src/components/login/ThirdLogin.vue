<template>
  <div class="else-login-cont">
    <div @click="githubClick()">
      <i class="iconfont icon-github"></i>
    </div>
    <div @click="weixinClick()">
      <i class="iconfont icon-unie655"></i>
    </div>
    <div @click="weiboClick()">
      <i class="iconfont icon-weibo-copy"></i>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ThirdLogin',
  data() {
    return {

    }
  },
  created() {
    // 获取url里面的code
    var code = this.getUrlData('code') || '';
    if (code == '') {
      return;
    }
    try {
      this.$store.dispatch('getRequestAllowError', {
        name:'user_info',
        params: {
          code: code,
        }
      }).then(() => {
        console.log(this.$store.state.user_info.status);
        if (this.$store.state.user_info.status == 100) {
          window.close();
        }
        // if (response.data.status == 100) {
        //   this.ruleForm.username = response.data.data.login
        // } else {

        // }
      })
    } catch (error) {

    }
  },
  methods:{
    // 点击github图标
    githubClick() {
      // window.location.href = 'https://github.com/login/oauth/authorize?client_id=e0354015017ebd32facf&redirect_uri=http://localhost:8888/api/git_login'
      window.open(
        'https://github.com/login/oauth/authorize?client_id=e0354015017ebd32facf&redirect_uri=http://localhost:8888/api/git_login',
        '第三方登录-github',
        'height=500, width=700, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no'
      )
    },
    // 点击微信图标
    weixinClick() {
      window.open(
        'https://github.com/login/oauth/authorize?client_id=e0354015017ebd32facf&redirect_uri=http://localhost:8888/api/git_login',
        '第三方登录-微信',
        'height=500, width=700, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no'
      )
    },
    // 点击微博图标
    weiboClick() {
      window.open(
        'https://github.com/login/oauth/authorize?client_id=e0354015017ebd32facf&redirect_uri=http://localhost:8888/api/git_login',
        '第三方登录-微博',
        'height=500, width=700, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no'
      )
    },
    getUrlData(name) {
      var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
      var r = window.location.search.substr(1).match(reg);
      if (r != null)
        return unescape(r[2]);
      return null;
    }
  }
}
</script>

<style lang="less">
  .else-login-cont {
    display: flex;
    margin-top: 15px;
    justify-content: space-around;
    align-items: center;
    div {
      i {
        font-size: 28px;
        cursor: pointer;
      }
      i.icon-unie655 {
        color: #a1d885;
      }
      i.icon-unie655:hover {
        color: #63be34;
      }
      i.icon-github {
        color: #ffbc67;
      }
      i.icon-github:hover {
        color: #ff9001;
      }
      i.icon-weibo-copy {
        color: #ffbc67;
      }
      i.icon-weibo-copy:hover {
        color: #e44419;
      }
    }
  }
</style>
