<template>
  <div class="view-containter">
    <main class="containter">
      <div class="reset-password-box">
        <form class="reset-password-form" action="">
          <div class="reset-header">
            <h1>重置密码</h1>
            <nav>
              <span :class="{'active':active=='mail'}" @click="toggleNav('mail')">邮箱重置</span>
              <span :class="{'active':active=='pass'}" @click="toggleNav('pass')">密码重置</span>
            </nav>
          </div>
          <div class="reset-body">
            <div class="email-panel" v-if="active=='mail'">
              <div class="content">
                <div class="input-group">
                  <input class="input" type="text" placeholder="请输入邮箱">
                </div>
                <button class="btn submit-btn">发送邮件</button>
              </div>
            </div>
            <div class="pass-panel" v-if="active=='pass'">
              <div class="content">
                <div class="input-group">
                  <input class="input" type="text" placeholder="请输入手机号">
                </div>
                <div class="input-group image-input-group">
                  <input class="input" type="text" placeholder="图片验证码">
                  <div class="image-code">

                  </div>
                </div>
                <div class="input-group vcode-input-group">
                  <input class="input" type="text" placeholder="请输入验证码">
                  <button class="send-code-btn">获取验证码</button>
                </div>
                <div class="input-group">
                  <input class="input" type="text" placeholder="请输入新密码">
                </div>
                <button class="btn submit-btn">确定</button>
              </div>
            </div>
            <a href="/">返回首页</a>
          </div>
        </form>
      </div>
    </main>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active:'mail'
    }
  },
  methods:{
    toggleNav(v) {
      this.active = v;
    }
  }
}
</script>
<style lang="less">
.containter{
  position: relative;
  margin: 0 auto;
  width: 100%;
  max-width: 960px;
}
.reset-password-form{
  margin: 6rem auto ;
  width: 40rem;
  padding: 4rem 3rem;
  background-color: #fff;
  border-radius: 4px;
  box-sizing: border-box;
}
.reset-header{
  h1{
    margin: 0;
    font-size: 24px;
    text-align: center;
  }
  nav{
    display: flex;
    margin-top: 60px;
    background-color: #f8f9fa;
    border-bottom: 1px solid #f1f1f1;
    user-select: none;
    span{
      flex: 1 1 auto;
      text-align: center;
      padding: 12px;
      font-size: 14px;
      cursor: pointer;
    }
    span.active{
      color: #007fff;
      border-bottom: 2px solid currentColor;
    }
  }
}
.reset-body{
  margin-top: 40px;
  text-align: center;
  a{
    display: inline-block;
    margin: 1.5rem auto 0;
    color: #007fff;
    text-decoration: none;
    font-size: 14px;
  }
  .email-panel,.pass-panel{
    .input-group:not(:first-child){
      margin-top: 25px;
    }
    .image-input-group,.vcode-input-group{
      display: flex;
    }
    .image-input-group{
      .image-code{
        width: 160px;
        height: 40px;
        border: 1px solid #eee;
        position: relative;
        z-index: 0;
        margin-left: 1rem;
      }
    }
    .vcode-input-group{
      .send-code-btn{
        flex: 0 0 auto;
        margin-left: 15px;
        padding: .8rem 1.6rem;
        color: #fff;
        background-color: #007fff;
        border-radius: 2px;
        border: none;
        outline: none;
      }
    }
    .submit-btn{
      margin-top: 40px;
      width: 100%;
      padding: .8rem 1.6rem;
      color: #fff;
      background-color: #007fff;
      border-radius: 2px;
      border: none;
      outline: none;
    }
    .input{
      width: 100%;
      margin: 0;
      padding: .5rem 0;
      font-size: 1.1em;
      border: none;
      border-bottom: 1px solid #eee;
      outline: none;
    }
  }
}
</style>
