<template>
  <div v-if="active" class="customized">
    <i @click="toggle()" class="iconfont icon-cc-close-crude customized-icon"></i>
    <div class="customized-cont">
      <h2>请选择你感兴趣的话题</h2>
      <div class="subscribed-list">
        <div class="item" v-for="(v, i) in subscribedList" :key="v.id">{{v.title}}<i class="iconfont icon-cc-close-crude" @click="deleteTags(v,i)"></i></div>
      </div>
      <div class="customized-tag-list">
        <div class="item" v-for="v in list" :key="v.id">
          <div class="customized-tag">
            <div class="customized-tag-img" :style="{backgroundImage:'url('+v.icon+')'}"></div>
            <div class="customized-tag-title">{{v.title}}</div>
            <div class="customized-tag-btn">
              <button :class="{active:v.isSubscribe}" @click="subscribe(v)">{{v.isSubscribe?'已订阅':'订阅'}}</button>
            </div>
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
      subscribedList:[]
    }
  },
  watch:{
    'active': function () {
      if (this.active === true) {
        this.getSubMsg();
      }
    }
  },
  methods:{
    toggle() {
      this.$emit('submit')
    },
    // 删除选中订阅标签
    deleteTags(v, i) {
      this.subscribedList=this.subscribedList.filter(s => {
        v.isSubscribe=false;
        return s.id!=v.id
      })
    },
    // 获取订阅列表
    getSubMsg() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name:'subscribecode'
        })
      } catch (error) {

      }
    },
    // 点击订阅
    subscribe(v) {
      v.isSubscribe =! v.isSubscribe;
      if (v.isSubscribe==true) {
        this.subscribedList.push(v)
      } else {
        this.subscribedList=this.subscribedList.filter(s => {
          return s.id!=v.id
        })
      }
    },
  },
  computed:{
    list() {
      try {
        let data = this.$store.state.subscribecode.data;
        data.forEach(v => {
          if (v.isSubscribe =='0') {
            v.isSubscribe = false;
          } else {
            v.isSubscribe = true;
          }
        })
        return data;
      } catch (error) {

      }
    }
  }
}
</script>
<style lang="less">
.customized{
  position: fixed;
  left:0;
  right: 0;
  top: 0;
  bottom: 0;
  background-color: hsla(0,0%,100%,.96);
  overflow: auto;
  z-index: 500;
}
.customized-icon{
  position: fixed;
  top: 24px;
  right: 36px;
  color: #333;
  font-size: 16px;
  cursor: pointer;
}
.customized-cont{
  margin: 70px auto 50px;
  width: 480px;
  max-width: 90%;
  h2{
    font-size: 28px;
    font-weight: 600;
    text-align: center;
    margin-bottom: 30px;
    color: #393939;
  }
}
.subscribed-list{
  margin-bottom: 25px;
  .item{
    display: inline-block;
    color: #007fff;
    background-color: #e8eff6;
    border: 1px solid #cbdff8;
    border-radius: 1px;
    cursor: default;
    position: relative;
    margin: 0 15px 15px 0;
    padding: 5px 10px;
    font-size: 12px;
    font-weight: 500;
    i{
      position: absolute;
      top: -.65rem;
      right: -.65rem;
      font-size: 12px;
      color: #82868b;
      cursor: pointer;
    }
    i:hover{
      color: #52565b;
    }
  }
}
.customized-tag-list{
  .item{
    margin-bottom: 25px;
  }
}
.customized-tag{
  display: flex;
  align-items: center;
  font-weight: 500;
  .customized-tag-img{
    width: 48px;
    height: 48px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: 50%;
    border-radius: 5px;
    flex: 0 0 auto;
    margin-right: 16px;
  }
  .customized-tag-title{
    margin-right: 16px;
    font-size: 16px;
    color: #393939;
  }
  .customized-tag-btn{
    flex: 0 0 auto;
    margin-left: auto;
    width: 80px;
    font-size: 14px;
    button{
      color: #37c701;
      background-color: #fff;
      border: 1px solid currentColor;
      border-radius: 2px;
      outline: none;
      height: 30px;
      width: 100%;
      transition: background-color .3s,color .3s;
    }
    button.active{
      color: #fff;
      background-color: #37c701;
      border-color: #37c701;
    }
  }
}
</style>
