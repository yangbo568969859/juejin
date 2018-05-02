<template>
  <div class="two-content-title">
    <div class="two-banner">
      <img src="/static/ad6.png" alt="">
    </div>
    <div class="two-calendar">
      <!-- <vue-event-calendar title="title" :events="demoEvents" @day-changed="monthChange" @month-changed="dayChange"></vue-event-calendar> -->
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      demoEvents: [{
        date: '2016/12/15',
        title: 'eat',
        desc: 'longlonglong description'
      }, {
        date: '2016/11/12',
        title: 'this is a title'
      }]
    }
  },
  methods:{
    monthChange(month) {
      console.log(month)
    },
    dayChange(day) {
      console.log(day)
    }
  }
}
</script>
<style lang="less">
.two-calendar{
  width: 800px;
}

</style>
