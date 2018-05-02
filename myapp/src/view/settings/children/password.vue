<template>
  <div class="profile">
    <div class="profile-view">
      <h1>修改密码</h1>
      <ul class="profile-list">
        <li>

        </li>
        <li class="item">
          <span class="title">原密码</span>
          <div class="profile-input-box">
            <input type="text" placeholder="请输入原密码">
            <div class="action-box">
              <button class="edit-btn">
                <span class="iconfont"></span>
                <span @click="forgetPassword()">忘记密码？</span>
              </button>
            </div>
          </div>
        </li>
        <li class="item">
          <span class="title">新密码</span>
          <div class="profile-input-box">
            <input type="text" placeholder="请输入新密码">
            <div class="action-box">
              <button class="edit-btn">
                <span class="iconfont"></span>
                <span></span>
              </button>
            </div>
          </div>
        </li>
        <li class="item">
          <span class="title">确认新密码</span>
          <div class="profile-input-box">
            <input type="text" placeholder="确认新密码">
            <div class="action-box">
              <button class="edit-btn">
                <span class="iconfont"></span>
                <span></span>
              </button>
            </div>
          </div>
        </li>
      </ul>
      <button class="submit-btn" @click="confirmEdit()">确认修改</button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {

    }
  },
  methods:{
    // 忘记密码
    forgetPassword() {
      this.$router.push({
        name:'reset-password'
      })
    },
    // 确定修改
    confirmEdit() {
      try {

      } catch (error) {

      }
    }
  }
}
</script>
<style lang="less">

</style>
