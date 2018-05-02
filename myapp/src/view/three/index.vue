<template>
  <main class="containter">
    <div class="three-box">
      <div class="three-list">
        <commendBanner />
        <contentMain />
      </div>
      <threeAside />
    </div>
  </main>
</template>
<script>
import commendBanner from './components/commendBanner'
import contentMain from './components/contentMain'
import threeAside from './components/threeAside'
export default {
  name:'three',
  data() {
    return {

    }
  },
  components:{
    commendBanner,
    contentMain,
    threeAside
  },
  methods:{

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
.three-box{
  margin-top:20px;
  align-items: flex-start;
  display: flex;
}
.three-list{
  overflow: hidden;
  flex-grow: 1;
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
}
.three-aside{
  width: 240px;
  min-width: 240px;
  margin-left: 20px;
}
.three-list-content-header{
  display: flex;
  align-items:center;
  padding:10px 25px;
  justify-content: space-between;
  background:#fff;
  border-bottom: 1px solid hsla(0,0%,59%,.1);
  span.recommend{
    font-size: 18px;
    font-weight: bold;
  }
  span.dingzhi{
    font-size: 14px;
    color:#217c8e;
    cursor: pointer;
  }
}
.three-list-list{

}
.three-list-item{
  background: #fff;
  border-bottom: 1px solid hsla(0,0%,59%,.1);
  >a{
    display: flex;
    position: relative;
    padding: 20px 26px;
    box-sizing: border-box;
    text-decoration: none;
  }
}
.three-list-item:hover{
  background-color: #fbfbfb;
}
.three-list-details{
  flex-grow: 1;
  overflow: hidden;
}
.three-img{
  margin-right: 15px;
  a{
    height: 48px;
    width: 48px;
    overflow: hidden;
    border-radius: 3px;
    display: block;
    img{
      width: 100%;
    }
  }
}
.three-details-top{
  color:#217c8e;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 8px;
}
.three-details-top:hover{
  span:nth-child(1),span:nth-child(3){
    text-decoration: underline;
  }
}
.three-details-middle{
  color: #333;
  font-size:14px;
  line-height: 20px;
  max-height: 60px;
  margin-right: 70px;
  overflow: hidden;
}
.three-details-bottom{
  color:#666;
  margin-top: 15px;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
  span{
    margin-right:15px;
    font-weight: 600;
  }
  span.time{
    color: #b4b6b8;
    font-size: 12px;
    font-weight: 400;
  }
}
.three-tag{
  background: #fff;
  border-bottom: 1px solid #eaeefb;
  padding: 20px;
  position: relative;
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
  >a{
    font-size: 14px;
    font-weight: 500;
    line-height: 1.2;
    color: #2e3135;
  }
  >div{
    margin-top: 5px;
    >a{
      display: inline-block;
      margin-top: 10px;
      margin-right: 10px;
      font-size:14px;
      line-height: 1.2;
      color: #217c8e;
    }
  }
}
.three-tag-last{
  >div{
    margin-top: 0px;
    >a{
      margin-top:0px;
    }
  }
}
.three-tag:hover{
  background: #fbfbfb;
}
.three-tag:hover>.three-tag-child-child{
  display: block;
}
.three-tag-child-child{
  position: absolute;
  top: 0;
  right: 100%;
  width: 100%;
  display: none;
}

@media (max-width: 960px) {
  .three-aside{
    display: none;
  }
  .three-img{
    display: none;
  }
}
</style>
