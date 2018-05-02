<template>
  <div class="taglist">
    <div class="taglist-header">
      <h4>我的动态</h4>
      <div class="taglist-headeroptions">
        <span>按时间排序</span>
        <span class="iconfont icon-xiangxiajiantou"></span>
      </div>
    </div>
    <div class="taglist-cont activities-cont" v-if="list!=''">
      <ul class="activities-list">
        <li v-for="v in list" :key="v.id">
          <a href="">
            <div class="activities-title">
              <div class="action">{{v.action}}</div>
              <div class="time">{{v.time}}</div>
            </div>
            <div class="activities-middle">
              <div class="user-img" :style="{backgroundImage: 'url(' + v.backurl + ')'}"></div>
              <div class="user-info">
                <div class="username">{{v.username}}</div>
                <div class="details">{{v.details}}</div>
              </div>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <div class="empty" v-else>
      <svg  width="66" height="68" viewBox="0 0 66 68" class="icon empty-icon"><g  fill="none" fill-rule="evenodd" transform="translate(4 3)"><g  fill="#F7F7F7"><path  d="M9 10h23.751v3.221H9zM9 16.494h41.083v4.026H9zM9 26.104h23.751v3.221H9zM9 42.208h23.751v3.221H9zM9 33.351h41.083v4.026H9zM9 49.455h41.083v4.026H9z"></path></g> <rect  width="56" height="60" x="1.139" y="1.338" stroke="#EBEBEB" stroke-width="2" rx="6"></rect></g></svg>
      <div class="empty-text">还没有活动</div>
    </div>
  </div>
</template>
<script>
export default {
  name:'activies',
  data() {
    return {
      list:[
        {
          id:1,
          action:'关注了用户',
          time:'6天前',
          backurl:'/static/img/ad1.png',
          username:'小叶一会我去',
          details:'全栈攻城狮 @ China Telecom IT R&D Center'
        },
        {
          id:2,
          action:'关注了标签',
          time:'10天前',
          backurl:'/static/img/ad2.png',
          username:'前端',
          details:''
        }
      ]
    }
  },
  methods:{

  }
}
</script>
<style lang="less">
.activies-cont{

}
ul.activities-list{
  li{
    border-bottom: 1px solid hsla(240,2%,90%,.5);
    a{
      display: flex;
      flex-direction: column;
      padding:20px 20px;
      .activities-title{
        display: flex;
        font-weight: 500;
        color: #b2bac2;
        font-size: 14px;
        .time{
          margin-left:auto;
        }
      }
      .activities-middle{
        display: flex;
        margin-top: 10px;
        .user-img{
          width: 45px;
          height: 45px;
          flex: 0 0 auto;
          border-radius: 50%;
          margin-right: 20px;
          background-position: 50%;
          background-size: cover;
          background-repeat: no-repeat;
          background-color: #eee;
        }
        .user-info{
          flex:1 1 auto;
          .username{
            font-weight: 600;
            color: #2e3135;
            font-size: 16px;
          }
          .details{
            margin-top: 8px;
            font-size: 12px;
            font-weight: 500;
            color: #b9c0c8;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
          }
        }
      }
    }
  }
  li:hover{
    background-color: rgba(0,0,0,.01);
  }
}
</style>
