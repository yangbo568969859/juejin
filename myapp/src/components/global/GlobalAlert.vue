<template>
  <div class="alert-list" v-if="active.active">
    <div class="alert-list-info">
      <h2 class="alert-info-title">提示</h2>
      <div class="alert-info-content">
        <p>{{active.value}}</p>
      </div>
      <div class="alert-info-close">
        <i class="iconfont icon-cc-close-crude" @click="toggle()"></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:'GlobalAlert',
  props:['active'],
  data() {
    return {

    }
  },
  methods:{
    toggle() {
      this.$emit('closePop')
    }
  },
  mounted() {
    setTimeout(() => {
      // 2s 后关闭自己
      this.toggle()
    }, 2000)
  }
}
</script>

<style lang="less">
.alert-list{
  display: flex;
  position: fixed;
  width: 250px;
  border-radius: 8px;
  box-sizing: border-box;
  border: 1px solid #ebeef5;
  padding: 14px 26px 14px 13px;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
  transition: opacity .3s,transform .3s,left .3s,right .3s,top .4s,bottom .3s;
  overflow: hidden;
}
.alert-list{
  right: 16px;
  top: 110px;
}
.alert-list-info{
  h2.alert-info-title{
    font-weight: 700;
    color: #303133;
    font-size: 16px;
    margin: 0;
  }
  .alert-info-content{
    font-size: 14px;
    line-height: 21px;
    margin: 6px 0 0;
    color: #606266;
    text-align: justify;
  }
  .alert-info-close{
    position: absolute;
    top: 18px;
    right: 15px;
    cursor: pointer;
    color: #909399;
    font-size: 16px;
    i{
      font-size: 12px;
    }
  }
}
</style>

