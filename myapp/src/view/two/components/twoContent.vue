<template>
  <div class="two-content-box">
    <ul>
      <li class="two-list" v-for="(v,i) in list" :key="i">
        <a :href="v.eventUrl" target="_blank">
          <div class="two-list-img" :style="{backgroundImage: 'url(' + v.screenshot + ')'}"></div>
          <div class="two-list-content">
            <div class="two-list-title">{{v.title}}</div>
            <div class="two-list-data">
              <span>{{v.createdAt}}</span>
            </div>
            <div class="two-list-section">
              <div class="two-section-address">
                <span>{{v.city}}</span>
              </div>
              <div class="two-section-button two-section-button-nocolor" v-if="v.status==0">报名参加</div>
              <div class="two-section-button" v-else>报名参加</div>
            </div>
          </div>
        </a>
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
    // 获取活动表
    getEventsList() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name:'eventslist',
        })
      } catch (error) {

      }
    }
  },
  mounted() {
    this.getEventsList();
  },
  computed: {
    list() {
      try {
        let data = this.$store.state.eventslist.data;
        return data;
      } catch (error) {

      }
    }
  }
}
</script>
<style lang="less">
.two-content-box{
  width: 100%;
  ul{
    display: flex;
    flex-wrap: wrap;
  }
}
.two-list{
  width: 25%;
  padding:0 7px;
  margin-bottom: 30px;
  border-radius: 2px;
  overflow: hidden;
  transition: all .2s ease-in-out;
  a{
    color: #333;
    display: block;
    width: 100%;
    background: #fff;
    transition: all .2s ease-in-out;
    box-shadow: 1px 1px 1px rgba(0,0,0,.15);
  }
}
.two-list:hover{
  transform: translateY(-3px);
}
.two-list:hover a{
  box-shadow: 0 7px 15px rgba(0,0,0,.1);
}
.two-list-img{
  padding-top: 55%;
  background-color: #ccc;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url(/static/img/ad1.png);
}
.two-list-content{
  padding: 20px 15px 15px;
}
.two-list-title{
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  height: 40px;
  font-size: 14px;
  font-weight: 700;
}
.two-list-data{
  margin-top: 6px;
}
.two-list-section{
  margin-top: 6px;
  display: flex;
  justify-content: space-between;
}
.two-section-button{
  width: 100px;
  height: 25px;
  border-radius: 30px;
  background-color: #4d91fd;
  line-height: 25px;
  color: #fff;
  text-align: center;
}
.two-section-button-nocolor{
  background-color: #aaa;
}

@media (max-width: 960px) {
  .two-list{
    width: 100%;
  }
}
</style>
