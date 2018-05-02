<template>
  <!-- <transition name="fade"> -->
    <div class="nav-top-lingdang" v-if="active">
      <div class="lingdang-top">
        <ul>
          <li @click="toggleTags('消息')" :class="{active:tagsActive=='消息'}">
            <span class="iconfont icon-lingdang"></span>
          </li>
          <li @click="toggleTags('用户')" :class="{active:tagsActive=='用户'}">
            <span class="iconfont icon-lingdang"></span>
          </li>
          <li @click="toggleTags('赞同')" :class="{active:tagsActive=='赞同'}">
            <span class="iconfont icon-lingdang"></span>
          </li>
        </ul>
      </div>
      <div class="lingdang-middle" v-if="loading==true">
        <Loading :active="loading" />
      </div>
      <div class="lingdang-middle" v-if="loading==false">
        <div class="lingdang-middle-mess" v-for="v in list" :key="v.id" v-if="list!=null">
          <span>
            <span>
              <a href="">{{v.author_name}}</a>
            </span>
          </span>
          <span v-if="v.type=='question'"> 的提问等你来答 </span>
          <span v-else-if="v.type=='article'"> 发布了 </span>
          <span v-else> 的提问等你来答 </span>
          <span>
            <a href="">{{v.title}}</a>
          </span>
        </div>
        <div class="lingdang-empty" v-if="list==''">
          <svg  width="66" height="68" viewBox="0 0 66 68" class="icon empty-icon"><g  fill="none" fill-rule="evenodd" transform="translate(4 3)"><g  fill="#F7F7F7"><path  d="M9 10h23.751v3.221H9zM9 16.494h41.083v4.026H9zM9 26.104h23.751v3.221H9zM9 42.208h23.751v3.221H9zM9 33.351h41.083v4.026H9zM9 49.455h41.083v4.026H9z"></path></g> <rect  width="56" height="60" x="1.139" y="1.338" stroke="#EBEBEB" stroke-width="2" rx="6"></rect></g></svg>
          还没有消息
        </div>
      </div>
      <div class="lingdang-footer">
        <a href="">
          设置
        </a>
        <a href="">全部提醒</a>
      </div>
    </div>
  <!-- </transition> -->
</template>
<script>
  export default {
    name: 'LingDang',
    props: ['active'],
    data() {
      return {
        tagsActive:'消息',
        loading: true,
      }
    },
    methods: {
      // 关闭弹窗
      toggle() {
        this.$emit('lingdang');
        this.loading = true;
      },
      // 切换选项卡
      toggleTags(v) {
        this.tagsActive=v;
        this.loading = true;
        this.getMsgList(v);
      },
      getMsgList(v) {
        let name = 'getusermessage';
        switch (v) {
          case '消息':
            name = 'getusermessage'
            break;
          case '用户':
            name = 'getusermessage1'
            break;
          case '赞同':
            name = 'getusermessage2'
            break;
          default:
            break;
        }
        try {
          this.$store.dispatch('getRequestAllowError', {
            name: name,
            params: ''
          }).then(() => {
            if (this.$store.state[name].successful === true) {
              this.loading = false;
            }
          })
        } catch (error) {

        }
      }
    },
    mounted() {
      this.getMsgList();
    },
    computed:{
      list() {
        try {
          return this.$store.state.getusermessage.data;
        } catch (error) {

        }
      }
    }
  }
</script>
<style lang="less">
  .nav-top-lingdang {
    width: 360px;
  }
  .nav-top-lingdang {
    border-radius: 3px;
    position: absolute;
    top: 104%;
    left: 50%;
    transform: translateX(-50%);
    background-color: #fff;
    box-shadow: 0 2px 6px 0 rgba(0, 0, 0, .3);
    font-size: 14px;
    color: #909090;
    cursor: default;
  }
  .nav-top-lingdang::before {
    content: "";
    position: absolute;
    top: 0;
    left: 50%;
    width: 1rem;
    height: 1rem;
    border-top: 1px solid hsla(220, 6%, 72%, .5);
    border-left: 1px solid hsla(220, 6%, 72%, .5);
    background-color: #fff;
    transform: rotate(45deg) translate(-50%, -50%);
    transform-origin: 0 0;
  }
  .lingdang-top {
    display: flex;
    border-bottom: 1px solid #ebebeb;
    ul {
      width: 100%;
      display: flex;
      li {
        flex: 1;
        height: 42px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
      }
      li:not(:last-child):after{
        position: absolute;
        left: 120px;
        width: 1px;
        height: 20px;
        margin: auto;
        background: #ebebeb;
        content: "";
      }
      li.active{
        span{
          color:#0084ff;
        }
      }
    }
  }
  .lingdang-empty{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 100%;
  }
  .lingdang-middle {
    height: 350px;
    overflow-x: hidden;
    overflow-y: auto;
  }
  .lingdang-footer {
    height: 42px;
    line-height: 42px;
    display: flex;
    padding: 0 14px;
    align-items: center;
    justify-content: space-between;
    border-top: 1px solid #ebebeb;
    a {
      display: inline-block;
      color: #8590a6;
      text-align: center;
      cursor: pointer;
      font-size: 14px;
    }
  }
  .lingdang-middle-mess {
    position: relative;
    padding: 15px;
    font-size: 14px;
    line-height: 24px;
    color: #1a1a1a;
    span {}
    a {
      color: #175199;
    }
  }
  .lingdang-middle-mess::after {
    position: absolute;
    right: 0;
    top: 100%;
    left: 0;
    height: 1px;
    padding: 0 16px;
    background-color: #ebebeb;
    content: "";
    background-clip: content-box;
  }
</style>

<style lang="less">
  .fade-enter-active,
  .fade-leave-active {
    transition: transform ease 0.3s, opacity ease 0.3s, height ease 0.3s;
  }
  .fade-enter,
  .fade-leave-to {
    opacity: 0;
    transform: translateY(-40%);
    transform-origin: top center;
  }
  .fade-enter-to,
  .fade-leave {
    opacity: 1;
    transform-origin: top center;
    transform: translateY(0%);
  }
</style>

