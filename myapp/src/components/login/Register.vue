<template>
  <div v-if="active" class="register">
    <form action="" class="login-form">
      <i class="iconfont icon-cc-close-crude" @click="toggle()"></i>
      <div class="login-box">
        <h1 class="login-box-title">注册</h1>
        <div class="login-input-group">
          <div class="input-box">
            <input v-model="registerDara.account" type="text" placeholder="请输入用户名">
          </div>
          <div class="input-box">
            <input v-model="registerDara.phone" type="text" placeholder="请填写手机号或邮箱">
          </div>
          <div v-if="showCheck" class="input-box vcode-box">
            <input class="registercode" v-model="registerDara.check" type="text" placeholder="验证码">
            <div class="code-box">
              <canvas width="120" height="40" id="c1"></canvas>
              <!-- <img src="" alt="">
                <span>获取验证码</span> -->
            </div>
          </div>
          <div v-if="showCheck" class="input-box">
            <input v-model="registerDara.checkphone" type="text" placeholder="手机验证码">
            <button class="phone-code" @click.prevent="getCode()">获取验证码</button>
          </div>
          <div class="input-box">
            <input v-model="registerDara.password" type="text" placeholder="请输入密码">
          </div>
        </div>
        <button class="login-button" @click.prevent="register()">注册</button>
        <div class="register-to-login">
          <span @click="goLogin">已有账号登录</span>
        </div>
        <div class="else-login">
          <div class="else-login-title">第三方账号登录</div>
          <third-login />
        </div>
      </div>
    </form>
    <GlobalAlert :active="showAlert" @closePop="closePop"/>
  </div>
</template>
<script>
  import ThirdLogin from '@/components/login/ThirdLogin.vue'
  export default {
    name: 'Register',
    props: ['active'],
    data() {
      return {
        registerDara: {
          account: '',
          phone: '',
          password: '',
          check: '',
          checkphone: ''
        },
        showCheck: false,
        showAlert:{
          active:false,
          value:'',
        }
      }
    },
    components:{
      ThirdLogin
    },
    watch: {
      registerDara: {
        handler: function (val, oldval) {
          if (val.phone.length > 10 && val.phone.indexOf('@') == -1) {
            this.showCheck = true;
          } else {
            this.showCheck = false;
          }
        },
        deep: true
      }
    },
    mounted() {
      this.drawCode()
    },
    methods: {
      toggle() {
        this.$emit('close');
        this.registerDara = {
          account: '',
          phone: '',
          password: '',
          check: '',
          checkphone: ''
        }
      },
      // 注册
      register() {
        if (this.registerDara.account=='') {
          this.showAlert = {
            active: true,
            value:'用户名不能为空'
          }
        }
        console.log(this.registerDara);
      },
      // 关闭弹窗
      closePop() {
        this.showAlert = false;
      },
      // 去登陆
      goLogin() {
        this.$emit('goLogin', 'go')
      },
      // 画验证码
      drawCode() {

      },
      // 获取验证码数组
      verificationCode() {
        let arrCode = verificationCode
        let length = arrCode.length
        let result = new Array(this.$options.verificationCodeLength).fill(null)
        result.forEach((v, i, arr) => {
          let num = (Math.random() * length) | 0
          arr[i] = arrCode[num]
        })
        return result
      },
      // 重置验证码数组, 并重新绘制
      resetVerificationCode() {
        this.oneVerificationCode = this.verificationCode()
        this.drowCanvas()
      },
      // 获取验证码
      getCode() {
        console.log(888888);
      }
    }
  }
</script>
<style lang="less">
  .register {
    position: fixed;
    background-color: rgba(0, 0, 0, .3);
    display: flex;
    align-items: center;
    justify-content: center;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 1001;
  }
  .login-form {
    position: relative;
    width: 26.5rem;
    font-size: 14px;
    background: #fff;
    padding: 2rem;
    border-radius: 4px;
  }
  .login-form .icon-cc-close-crude {
    float: right;
    opacity: .6;
    font-size: 12px;
    cursor: pointer;
  }
  .login-form .icon-cc-close-crude:hover {
    opacity: .8;
  }
  .login-box-title {
    font-size: 16px;
    margin: 0 0 2rem;
  }
  .login-button {
    width: 100%;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #217c8e;
    outline: none;
    border: 0;
    border-radius: 4px;
    color: #fff;
    font-size: 14px;
    cursor: pointer;
  }
  .login-input-group {
    margin-bottom: 5px;
    overflow: hidden;
  }
  .input-box {
    margin-bottom: 10px;
    position: relative;
  }
  .input-box input {
    padding: 10px;
    width: 100%;
    border: 1px solid #e9e9e9;
    border-radius: 2px;
    outline: none;
    box-sizing: border-box;
  }
  .input-box input.registercode {
    max-width: 95px;
  }
  .vcode-box {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .code-box {
    border: 1px solid #ddd;
    position: relative;
    box-sizing: border-box;
    overflow: hidden;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    z-index: 0;
    width: 160px;
    color: #fff;
    height: 40px;
    margin-left: 15px;
    span {
      position: absolute;
      z-index: -1;
      top: 0;
      left: 0;
      display: flex;
      height: 100%;
      width: 100%;
      justify-content: center;
      align-items: center;
    }
  }
  canvas#get-code {
    width: 160px;
    height: 100%;
    background-color: #fff;
  }
  .phone-code {
    position: absolute;
    top: 0;
    right: 0;
    height: 100%;
    color: #007fff;
    line-height: 1;
    background: transparent;
    outline: none;
    border: none;
    padding: 10px;
    cursor: pointer;
  }
  .input-box input:focus {
    border: 1px solid #217c8e;
  }
  .login-to-register {
    margin-top: 15px;
    color: #8b9196;
  }
  .login-to-register span {
    color: #217c8e;
    cursor: pointer;
  }
  .register-to-login {
    text-align: center;
    margin-top: 15px;
  }
  .register-to-login span {
    color: #217c8e;
    cursor: pointer;
  }
  .forget-password {
    float: right;
    color: #217c8e;
    text-decoration: none;
  }
  .else-login {
    margin-top: 15px;
  }
  .else-login-title {
    color: #8b9196;
  }
</style>
