<template>
  <div class="suggest-box" v-if="active">
    <div class="suggest-box-cont">
      <button class="close" @click="toggle()">
        <span class="iconfont icon-cc-close-crude"></span>
      </button>
      <div class="suggest-box-main">
        <div class="suggest-box-main-cont">
          <div class="suggest-box-title">提交反馈</div>
          <textarea name=""  rows="4" placeholder="告诉我们你的建议或遇到的问题。"></textarea>
          <div class="screen-box" v-if="screecCheck">
            <div class="screen-box-title">屏幕截图（可选）:</div>
            <div class="screen-box-cont"></div>
          </div>
          <div class="screen-checkbox">
            <label>
              <input type="checkbox" v-model="screecCheck">提交屏幕截图
            </label>
          </div>
          <div class="submit">
            <button>提交</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props:['active'],
  data() {
    return {
      screecCheck:true
    }
  },
  methods:{
    toggle() {
      this.$emit('submit')
    }
  }
}
</script>

<style lang="less">
.suggest-box{
  position: fixed;
  left:0;
  right: 0;
  top: 0;
  bottom: 0;
}
.suggest-box{
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgba(0,0,0,.65);
}
.suggest-box-cont{
  position: relative;
  z-index: 10011;
  background: #fff;
  border-radius: 6px;
  button.close{
    position: absolute;
    top: 4px;
    right: -44px;
    padding: 12px;
    width: 40px;
    height: 40px;
    cursor: pointer;
    box-sizing: border-box;
    background: none;
    outline: none;
    border: none;
    span{
      color: #fff;
      transition: color .3s ease;
    }
    span:hover{
      color: #999;
    }
  }
}
.suggest-box-main{
  width: 588px;
  max-height: calc(100vh - 24px * 2);
  overflow-x: hidden;
  overflow-y: auto;
}
.suggest-box-main-cont{
  padding: 40px 24px 32px;
  .suggest-box-title{
    font-size: 24px;
    font-weight: 500;
    line-height: 33px;
    margin-bottom: 26px;
    text-align: center;
  }
  textarea{
    display: block;
    padding: 12px;
    width: 100%;
    height: auto;
    font-size: 15px;
    border: 1px solid #e7eaf1;
    border-radius: 3px;
    box-sizing: border-box;
    resize: none;
    outline: none;
    color: inherit;
    transition: box-shadow .15s ease-out;
    overflow: auto;
  }
  .screen-box{
    overflow: hidden;
    max-height: 300px;
    transition: max-height .3s ease,opacity .3s ease;
    .screen-box-title{
      padding-top: 22px;
      user-select: none;
    }
    .screen-box-cont{
      margin-top: 8px;
      position: relative;
      background-color: #f6f7f9;
    }
  }
  .screen-checkbox{
    margin-top: 12px;
    label{
      cursor: pointer;
      color: #9aaabf;
      transition: color .15s ease-out;
      user-select: none;
      display: flex;
      align-items: center;
      input[type="checkbox"]{
        margin-right: 5px;
      }
    }
  }
  .submit{
    margin-top: 40px;
    text-align: center;
    button{
      display: inline-block;
      min-width: 220px;
      padding: 8px 1em;
      background-color: #0f88eb;
      border: 1px solid #0f88eb;
      border-radius: 3px;
      font: inherit;
      color: #fff;
      transition: background-color .15s ease-out,opacity .15s ease-out;
      cursor: pointer;
      outline: none;
    }
    button:hover{
      background-color: #0d79d1;
    }
  }
}

@media (max-width: 768px) {
  .suggest-box-main {
    width: 100%;
  }
}
</style>
