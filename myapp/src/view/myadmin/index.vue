<template>
  <main class="containter">
    <div class="myadmin-box">
      <div class="myadmin-right">
        <div class="myadmin-right-top">
          <div class="right-top-left" style="background-image:url('/static/img/22.png')">
            <!-- <img src="/static/img/22.png" alt=""> -->
          </div>
          <div class="right-top-middle">
            <h1>落花有情人无情</h1>
            <div class="position"></div>
            <div class="intro"></div>
          </div>
          <div class="right-top-right">
            <div class="link-box"></div>
            <button @click.stop="seetings()">编辑个人资料</button>
          </div>
        </div>
        <div class="myadmin-right-cont">
          <div class="cont-header">
            <ul>
              <li v-for="v in title" :key="v.id" @click="linkTags(v)">
                <a :class="{'tabs-link':true,active:v.checked}" @click="showLine(v)">{{v.name}}</a>
              </li>
              <li class="more" @click="moreHeader()">
                <div class="tabs-link">更多</div>
                <span class="iconfont icon-xiangxiajiantou"></span>
                <div class="more-box" v-show="moreHeaderShow">
                  <router-link :to="{name:'collections'}">收藏</router-link>
                  <router-link :to="{name:'following'}">关注</router-link>
                </div>
              </li>
            </ul>
          </div>
          <div class="cont-body">
            <router-view></router-view>
          </div>
        </div>
      </div>
      <aside class="myadmin-left">
        <div class="myadmin-left-top">
          <a @click="follow(0)">
            <div class="item-title">关注了</div>
            <div class="item-num">12</div>
          </a>
          <a @click="follow(1)">
            <div class="item-title">关注者</div>
            <div class="item-num">122</div>
          </a>
        </div>
        <div class="myadmin-left-cont">
          <a href="">
            <span>关注的标签</span>
            <span>5</span>
          </a>
          <a href="">
            <span>关注的问题</span>
            <span>5</span>
          </a>
          <a href="">
            <span>关注的作者</span>
            <span>5</span>
          </a>
        </div>
      </aside>
    </div>
  </main>
</template>
<script>
export default {
  name:'myadmin',
  data() {
    return {
      moreHeaderShow:false,
      title:[
        {
          id:1,
          name:'动态',
          path:'activities',
          num:0,
          checked:true
        },
        {
          id:2,
          name:'回答',
          path:'answer',
          num:3,
          checked:false
        },
        {
          id:3,
          name:'文章',
          path:'articles',
          num:1,
          checked:false
        },
        {
          id:4,
          name:'喜欢',
          path:'likes',
          num:33,
          checked:false
        },
        {
          id:5,
          name:'想法',
          path:'shares',
          num:0,
          checked:false
        }
      ]
    }
  },
  methods:{
    // 点击编辑个人资料
    seetings() {
      this.$router.push({
        path:'/settings/profile',
        query:{

        }
      })
    },
    // 点击关注
    follow(type) {
      this.$router.push({
        name:'following',
        query:{
          type:type
        }
      })
    },
    // 下划线
    showLine(value) {
      this.title.forEach(v=>{
        v.checked=false;
      })
      value.checked=true;
    },
    // 跳转标签
    linkTags(v) {
      this.$router.push({
        name:v.path
      })
    },
    // 更多
    moreHeader() {
      this.moreHeaderShow=!this.moreHeaderShow;
    }
  }
}
</script>
<style lang="less">
main.containter{
  max-width:960px;
  width: 100%;
  margin:0 auto;
  position: relative;
}
.myadmin-box{
  margin-top:20px;
  align-items: flex-start;
  display: flex;
}
.myadmin-right{
  overflow: hidden;
  flex-grow: 1;
}
.myadmin-left{
  width: 240px;
  min-width: 240px;
  margin-left: 20px;
}
.myadmin-right-top{
  display: flex;
  padding:30px;
  background: #fff;
  .right-top-left{
    width: 90px;
    height: 90px;
    overflow: hidden;
    border-radius: 50%;
    margin-right: 24px;
    flex:0 0 auto;
    background-position: 50%;
    background-size: cover;
    background-repeat: no-repeat;
    background-color: #f9f9f9;
    img{
      width:100%;
      height: 100%;
    }
  }
  .right-top-middle{
    flex:1 1 auto;
    margin-right: 24px;
    display: flex;
  }
  .right-top-right{
    flex:0 0 auto;
    display: flex;
    align-items: flex-end;
    flex-direction: column;
    button{
      outline: none;
      color: #0084ff;
      border-color: #0084ff;
      display: inline-block;
      padding: 0 16px;
      font-size: 14px;
      line-height: 32px;
      text-align: center;
      cursor: pointer;
      background: none;
      border: 1px solid;
      border-radius: 3px;
    }
    button:hover{
      background-color: rgba(0,132,255,.06);
    }
  }
}
.myadmin-right-cont{
  margin-top: 10px;
  background: #fff;
  border-radius: 2px;
  .cont-header{
    height: 50px;
    box-shadow: inset 0 -1px 0 hsla(240,2%,90%,.5);
    ul{
      display: flex;
      li{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 80px;
        .tabs-link{
          width: 100%;
          position: relative;
          display: inline-block;
          padding: 14px 0;
          font-size: 16px;
          line-height: 22px;
          color: #31445b;
          text-align: center;
        }
        a.active{
          box-shadow: inset 0 -2px 0 #3780f7;
        }
      }
      li.more{
        cursor: pointer;
        position: relative;
        .more-box{
          position: absolute;
          z-index:1;
          left:0%;
          top: 102%;
          padding: 6px 0;
          width: 90px;
          background: #fff;
          box-shadow: 0 2px 4px 0 rgba(0,0,0,.05);
          border-radius: 2px;
          border: 1px solid #f3f3f4;
          a{
            display: block;
            padding: 6px 0;
            font-size: 14px;
            text-align: center;
            color: #000;
          }
        }
        .more-box:after{
          content: "";
          position: absolute;
          top: 0;
          left: 50%;
          margin: -7px 0 0 -7px;
          border: 7px solid transparent;
          border-bottom-color: #fff;
          border-top: none;
        }
      }
    }
  }
  .cont-body{
    min-height:100px;
  }
}
.myadmin-left-top{
  display: flex;
  margin-bottom:10px;
  background:#fff;
  position: relative;
  a{
    flex:1 1 auto;
    text-align: center;
    padding: 20px 0;
    .item-title{
      font-size: 14px;
      color: #8590a6;
      font-weight: 500;
    }
    .item-num{
      font-size: 14px;
      color: #000;
      font-weight: bold;
    }
  }
  a:hover{
    .item-title,.item-num{
      color:#217c8e;
    }
  }
}
.myadmin-left-top:after{
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  width: 1px;
  height: 50%;
  background-color: #f3f3f4;
  transform: translate(-50%,-50%);
}
.myadmin-left-cont{
  a{
    display: flex;
    height: 40px;
    align-items: center;
    justify-content: space-between;
    padding-left: 5px;
    font-size: 14px;
    border-top: 1px solid #ebebeb;
    color: #8590a6;
  }
  a:hover{
    color:#217c8e;
  }
}


@media (max-width: 960px) {
  .myadmin-left{
    display: none;
  }
}

@media (max-width: 600px) {
  .myadmin-right-top{
    flex-direction:column;
    align-items: center;
    .right-top-left{
      margin-right: 0;
    }
    .right-top-middle{
      margin: 10px 0;
    }
  }
  .myadmin-right-cont{
    .cont-header{
      li.more{
        display:none;
      }
    }
  }
}
</style>
<style lang="less">
// 底部内容统一样式
.taglist{
  .taglist-header{
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 50px;
    padding:0 20px;
    border-bottom: 1px solid #f6f6f6;
    h4{
      font-size: 14px;
      font-weight: bold;
    }
    div.taglist-headeroptions{
      cursor: pointer;
      display: flex;
      align-items: center;
      font-size: 14px;
    }
  }
  .taglist-cont{
    // padding: 0px 20px;
  }
  .empty{
    padding: 40px 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    .empty-text{
      margin-top: 10px;
      color: #b2bac2;
      font-size: 14px;
      cursor: default;
    }
  }
}
</style>

