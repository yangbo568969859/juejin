<template>
  <div v-show="active" class="login">
    <form action="" class="login-form">
      <i class="iconfont icon-cc-close-crude" @click="toggle()"></i>
      <div class="login-box">
        <h1 class="login-box-title">登录</h1>
        <div class="login-input-group">
          <div class="input-box">
            <input v-model="loginData.phone" type="text" placeholder="请填写手机号">
          </div>
          <div class="input-box">
            <input v-model="loginData.password" type="text" placeholder="请输入密码">
          </div>
        </div>
        <button class="login-button" @click.prevent="login()">登录</button>
        <div class="login-to-register">
          没有账号？
          <span @click="goRegister()">注册</span>
          <a href="/reset-password" class="forget-password">忘记密码</a>
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
  name:'Login',
  props:['active'],
  data() {
    return {
      loginData: {
        phone:'',
        password:''
      },
      statusOfLogin: 0,
      showAlert:{
        active:false,
        value:'',
      }
    }
  },
  components:{
    ThirdLogin
  },
  methods:{
    // 关闭弹窗
    closePop() {
      this.showAlert = false;
    },
    toggle() {
      this.$emit('close');
      this.loginData = {
        phone:'',
        password:''
      }
      this.showAlert = false;
    },
    // 登录
    login() {
      localStorage.adminInfo = JSON.stringify(1111);
      if (this.loginData.phone === '') {
        this.showAlert = {
          active: true,
          value:'手机号码不能为空'
        }
      } else if (this.loginData.password === '') {
        this.showAlert = {
          active: true,
          value:'密码不能为空'
        }
      } else {
        this.loginSubmit();
      }
      // this.statusOfLogin = 200;
      // this.axios.post('/api/login/check_account', {
      //   phone:this.loginData.phone,
      //   password:this.loginData.password
      // }).then(data => {
      //   console.log(data);
      // })
    },
    // 验证成功登录
    loginSubmit() {
      try {
        this.$store.dispatch('postRequestAllowError', {
          name:'login',
          params: this.loginData
        }).then(() => {
          if (this.$store.state.login.successful === true) {
            setTimeout(() => {
              this.$store.dispatch({
                type: 'logInSuccesful',
                data:this.$store.state.login.data
              })
            }, 200);
            this.toggle()
          } else {
            this.showAlert = {
              active:true,
              value:this.$store.state.login.message,
            }
          }
        })
      } catch (error) {
        return
      }
    },
    // 去注册
    goRegister() {
      this.$emit('goRegister', 'go')
    }
  },
  mounted() {

  }
}
</script>
<style lang="less">
.login{
  position: fixed;
  background-color: rgba(0,0,0,.3);
  display: flex;
  align-items: center;
  justify-content: center;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index:1001;
}
.login-form{
  position: relative;
  width:26.5rem;
  font-size:14px;
  background: #fff;
  padding:2rem;
  border-radius: 4px;
}
.login-form .icon-cc-close-crude {
  float: right;
  opacity:.6;
  font-size:12px;
  cursor: pointer;
}
.login-form .icon-cc-close-crude:hover{
  opacity: .8;
}
.login-box-title{
  font-size: 16px;
  margin: 0 0 2rem;
}
.login-button{
  width:100%;
  height:40px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #217c8e;
  outline: none;
  border:0;
  border-radius: 4px;
  color:#fff;
  font-size: 14px;
  cursor: pointer;
}
.login-input-group{
  margin-bottom:5px;
  overflow: hidden;
}
.input-box{
  margin-bottom:10px;
}
.input-box input{
  padding: 10px;
  width: 100%;
  border: 1px solid #e9e9e9;
  border-radius: 2px;
  outline: none;
  box-sizing: border-box;
}
.input-box input:focus{
  border: 1px solid #217c8e;
}
.login-to-register{
  margin-top:15px;
  color:#8b9196;
}
.login-to-register span{
  color:#217c8e;
  cursor: pointer;
}
.forget-password{
  float: right;
  color:#217c8e;
  text-decoration: none;
}
.else-login{
  margin-top:15px;
}
.else-login-title{
  color:#8b9196;
}

</style>