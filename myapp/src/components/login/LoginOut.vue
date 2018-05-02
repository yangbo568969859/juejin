<template>
  <div v-show="active" class="login-out">
    <div class="login-out-box">
      <div class="login-out-tit">
        <div class="loginout-tit-left">登出</div>
        <span class="iconfont icon-cc-close-crude" @click="toggle()"></span>
      </div>
      <div class="login-out-cont">确定登出</div>
      <div class="login-out-btn">
        <button class="my-button primary-btn" @click="confirmLoginOut()">确定</button>
        <button class="my-button" @click="toggle()">取消</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props:['active'],
  data() {
    return {

    }
  },
  methods:{
    toggle() {
      this.$emit('submit')
    },
    // 确定退出
    confirmLoginOut() {

    }
  }
}
</script>

<style lang="less">
  .login-out{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0,0,0,.3);
    z-index: 500;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    cursor: default;
  }
  .login-out-tit {
    position: relative;
    display: flex;
    span {
      position: absolute;
      right: 0px;
      top: 0px;
    }
  }
  .login-out-box {
    width: 30rem;
    padding: 2rem;
    background: #fff;
    border-radius: 6px;
  }
  .loginout-tit-left {
    color: #333;
  }
  .login-out-cont {
    color: #333;
  }
  .login-out-cont, .login-out-btn {
    text-align: center;
    margin-top: 20px;
  }
</style>
