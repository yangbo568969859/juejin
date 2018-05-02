<template>
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
  <div class="empty" v-else>
    <svg  width="66" height="68" viewBox="0 0 66 68" class="icon empty-icon"><g  fill="none" fill-rule="evenodd" transform="translate(4 3)"><g  fill="#F7F7F7"><path  d="M9 10h23.751v3.221H9zM9 16.494h41.083v4.026H9zM9 26.104h23.751v3.221H9zM9 42.208h23.751v3.221H9zM9 33.351h41.083v4.026H9zM9 49.455h41.083v4.026H9z"></path></g> <rect  width="56" height="60" x="1.139" y="1.338" stroke="#EBEBEB" stroke-width="2" rx="6"></rect></g></svg>
    <div class="empty-text">还没有关注</div>
  </div>
</template>
<script>
export default {
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
    delFollow() {
      console.log(1);
    }
  }
}
</script>
<style lang="less">

</style>
