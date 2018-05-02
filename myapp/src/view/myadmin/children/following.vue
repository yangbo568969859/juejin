<template>
  <div class="taglist">
    <div class="taglist-header">
      <h4>我的关注</h4>
      <div class="sub-type-box">
        <a :class="{active:tagsShow=='关注了'}" @click="showTags('关注了')">关注了</a>
        <a :class="{active:tagsShow=='关注者'}" @click="showTags('关注者')">关注者</a>
        <a :class="{active:tagsShow=='关注标签'}" @click="showTags('关注标签')">关注标签</a>
      </div>
    </div>
    <div v-if="tagsShow=='关注了'">
      <div class="taglist-cont following-cont" v-if="list!=''">
        <ul class="following-list-le">
          <li class="item" v-for="v in list" :key="v.id">
            <a href="">
              <div class="user-img" :style="{backgroundImage: 'url(' + v.backurl + ')'}"></div>
              <div class="user-info">
                <div class="username">{{v.username}}</div>
                <div class="details">{{v.details}}</div>
              </div>
              <button class="follow-button active" @click="delFollow()">已关注</button>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div v-if="tagsShow=='关注者'">
      <div class="taglist-cont following-cont" v-if="list!=''">
        <ul class="following-list-le">
          <li class="item" v-for="v in list" :key="v.id">
            <a href="">
              <div class="user-img" :style="{backgroundImage: 'url(' + v.backurl + ')'}"></div>
              <div class="user-info">
                <div class="username">{{v.username}}</div>
                <div class="details">{{v.details}}</div>
              </div>
              <button class="follow-button active" @click="delFollow()">已关注</button>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div v-if="tagsShow=='关注标签'">
      <div class="taglist-cont following-cont" v-if="list!=''">
        <ul class="following-list-le">
          <li class="item" v-for="v in list" :key="v.id">
            <a href="">
              <div class="user-img" :style="{backgroundImage: 'url(' + v.backurl + ')'}"></div>
              <div class="user-info">
                <div class="username">{{v.username}}</div>
              </div>
              <button class="follow-button active" @click="delFollow()">已关注</button>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="empty" v-if="list==''">
      <svg  width="66" height="68" viewBox="0 0 66 68" class="icon empty-icon"><g  fill="none" fill-rule="evenodd" transform="translate(4 3)"><g  fill="#F7F7F7"><path  d="M9 10h23.751v3.221H9zM9 16.494h41.083v4.026H9zM9 26.104h23.751v3.221H9zM9 42.208h23.751v3.221H9zM9 33.351h41.083v4.026H9zM9 49.455h41.083v4.026H9z"></path></g> <rect  width="56" height="60" x="1.139" y="1.338" stroke="#EBEBEB" stroke-width="2" rx="6"></rect></g></svg>
      <div class="empty-text">还没有关注</div>
    </div>
  </div>
</template>
<script>
export default {
  name:'following',
  data() {
    return {
      tagsShow:'关注标签',
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
    // 显示关注类型
    showTags(vv) {
      this.tagsShow=vv;
    },
    delFollow() {
      console.log(1);
    }
  },
  watch:{

  },
  mounted() {
    if (this.$route.query.type==0) {
      this.tagsShow='关注了'
    } else {
      this.tagsShow='关注者'
    }

  }
}
</script>
<style lang="less">
.following-cont{

}
.sub-type-box{
  margin-left: auto;
  a{
    margin-right: 20px;
    position: relative;
    padding: 1rem 0;
    font-size: 12px;
    color: #72777b;
  }
  a.active{
    color: #000;
  }
  a:not(:last-child):after{
    content: "";
    position: absolute;
    top: 50%;
    right: -10px;
    margin-top: -5px;
    width: 1px;
    height: 1em;
    background-color: #b2bac2;
    opacity: .5;
  }
}
.following-list-le{
  li.item:not(:last-child){
    border-bottom: 1px solid hsla(240,2%,90%,.5);
  }
  li.item:hover{
    background-color: hsla(0,0%,87%,.1);
  }
  li.item{
    a{
      display: flex;
      padding:6px 20px;
      min-height:90px;
      align-items: center;
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
        min-width: 0;
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
      button.follow-button{
        flex: 0 0 auto;
        margin: 0 0 0 1rem;
        padding: 0;
        width: 7.5rem;
        height: 2.5rem;
        font-size: 1rem;
        color: #92c452;
        background-color: #fff;
        border: 1px solid #92c452;
        border-radius: 2px;
        transition: background-color .3s,color .3s;
        cursor: pointer;
      }
      button.active{
        color: #fff;
        background-color: #92c452;
      }
    }
  }
}
</style>
