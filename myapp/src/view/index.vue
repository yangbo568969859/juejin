<template>
  <div class="home">
    <!-- 顶部导航栏 -->
    <NavTop v-if="isEdit"/>
    <!-- 路由页面 -->
    <router-view></router-view>
    <!-- 小可爱 -->
    <animation/>
    <!-- 回到顶部组件 -->
    <gotop/>
  </div>
</template>
<script>
import animation from '@/components/animation/index'
import gotop from '@/components/gotop/gotop'
export default {
  name:'index',
  data() {
    return {
      msg: '这里是程序的主页'
    }
  },
  computed:{
    isEdit() {
      return this.$route.name !=='edit'
    }
  },
  components:{
    animation,
    gotop
  }
}
</script>
<style lang="less">
.home{
  position: relative;
}
</style>
