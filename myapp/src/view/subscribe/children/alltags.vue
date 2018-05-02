<template>
  <div class="alltags">
    <div class="alltags-header">
      <ul>
        <li><a href="" class="active">最热</a></li>
        <li><a href="">最新</a></li>
        <li class="search"><input type="text" placeholder="搜索标签"></li>
      </ul>
    </div>
    <ul class="subscribed">
      <li v-for="v in taglist" :key="v.id">
        <div class="subscribed-tag">
          <div class="info-box">
            <a href="" class="subscribed-a">
              <div class="img" :style="{backgroundImage:'url('+v.icon+')'}"></div>
              <div class="title">{{v.title}}</div>
            </a>
            <div class="meta-box">
              <div class="guanzhu">{{v.entryCount}} 关注</div>
              <div class="wenzhang">{{v.subscribersCount}} 文章</div>
            </div>
          </div>
          <div class="button-box">
            <button :class="{'subscribed-but':true,subscribed:v.subscribed}" @click="follow(v)">{{v.subscribed?'已关注':'关注'}}</button>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  data() {
    return {

    }
  },
  methods:{
    follow(v) {
      v.subscribed=!v.subscribed;
    },
    // 获取关注标签
    getMsgList() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name:'subscribe'
        })
      } catch (error) {

      }
    }
  },
  mounted() {
    this.getMsgList();
  },
  computed: {
    taglist() {
      try {
        let data = {...this.$store.state.subscribe.data};
        return data;
      } catch (error) {

      }
    }
  }
}
</script>
<style lang="less">
.subscribed{
  li{
    width: 25%;
    display: inline-block;
    margin-bottom: 15px;
    padding: 0 10px;
    box-sizing: border-box;
  }
}
.subscribed-tag{
    border-radius: 3px;
    display: inline-block;
    width: 100%;
    background-color: #fff;
    border: 1px solid #f1f1f1;
    transition: border-color .3s;
    text-align: center;
    padding: 1.5rem 0;
    .info-box{
      a.subscribed-a{
        div.img{
          width: 100%;
          height: 32px;
          margin: 1rem auto;
          background-color: #fff;
          background-position: 50%;
          background-size: contain;
          background-repeat: no-repeat;
        }
        div.title{
          font-size: 18px;
          line-height: 24px;
          color: #333;
        }
      }
      .meta-box{
        display: flex;
        justify-content: center;
        align-items: center;
        color:#909090;
        font-size: 14px;
        .wenzhang{
          margin-left: 10px;
        }
      }
    }
    .button-box{
      button.subscribed-but{
        border-radius: 2px;
        border: none;
        padding: .5rem 1.3rem;
        outline: none;
        transition: background-color .3s,color .3s;
        cursor: pointer;
        border: 1px solid #37c700;
        background-color: #fff;
        color: #37c700;
        margin: 1rem auto;
        font-size: 1.1rem;
      }
      button.subscribed{
        background-color: #37c700;
        color: #fff;
      }
    }
}
.alltags-header{
  padding:0 15px;
  ul{
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    li{
      padding: 12px 8px;
      margin-left: 10px;
      font-size: 15px;
      white-space: nowrap;
      a{
        color: #909090;
      }
      a.active{
        color:#217c8e;
      }
    }
    li.search{
      margin-left: 20px;
      cursor: default;
      input{
        padding: .5rem;
        font-size: 1.2rem;
        border: 1px solid hsla(0,0%,59%,.2);
        outline: none;
      }
    }
  }
}
@media (max-width:600px) {
  .subscribed{
    li{
      width: 50%;
    }
  }
}
</style>
