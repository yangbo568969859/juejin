<template>
  <div>
    <ul class="one-recommend">
      <li v-for="(v,i) in beers" :key="i">
        <div class="one-recommend-box">
          <div class="one-recommend-box-title">
            <span>
              {{v.action_text_tpl}}
              <span class="one-recommend-orange">{{v.actors_name}}</span>
            </span>
          </div>
          <div class="one-recommend-box-author">
            <span class="author-img">
              <img :src="v.author_avatar_url?v.author_avatar_url:'https://pic1.zhimg.com/aadd7b895_s.jpg'" alt="">
            </span>
            <div class="author-title">
              <div>
                <span class="author-name" @mouseover="toggleShow(v.author_url)"  @mouseout="toggleShow(v.id)">{{v.author_name}}</span>
              </div>
              <div class="author-details" v-if="authorDetailsShow==v.id">

              </div>
              <div class="author-nichneg">
                <span>{{v.author_headline}}</span>
              </div>
            </div>
          </div>
          <div class="one-recommend-box-content">
            <div class="one-content-box">
              <div class="one-content-cont">
                <div class="one-content-title">
                  <a href="">{{v.title}}</a>
                </div>
                <div class="one-content-zantong" v-if="v.checked">
                  <span>13 人赞同了该回答</span>
                </div>
                <div class="one-content-neirong">
                  <span v-if="v.checked===0">{{v.excerpt_new}}</span>
                  <a @click="readAll(v)" v-if="v.checked===0">阅读全文 <i class="iconfont icon-xiangxiajiantou"></i> </a>
                </div>
                <div class="one-content-neirong2">
                  <span v-if="v.checked===1" v-html="v.content">{{v.content}}</span>
                </div>
                <div class="one-content-time" v-if="v.checked === 1">
                  <span>发布于 06:22</span>
                </div>
              </div>
              <div class="one-content-img" @click="showImg(v.thumbnail)">
                <img :src="v.thumbnail" alt="">
              </div>
            </div>
          </div>
          <div class="one-recommend-box-share">
            <span class="recom-dianzan">
              <button class="vote-button">
                <svg viewBox="0 0 20 18" class="Icon VoteButton-upIcon Icon--triangle" width="9" height="16" aria-hidden="true" style="height: 16px; width: 9px;"><title></title><g><path d="M0 15.243c0-.326.088-.533.236-.896l7.98-13.204C8.57.57 9.086 0 10 0s1.43.57 1.784 1.143l7.98 13.204c.15.363.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H1.955c-1.08 0-1.955-.517-1.955-1.9z"></path></g></svg>17k
              </button>
              <button class="vote-button">
                <svg viewBox="0 0 20 18" class="Icon VoteButton-downIcon Icon--triangle" width="9" height="16" aria-hidden="true" style="height: 16px; width: 9px;"><title></title><g><path d="M0 15.243c0-.326.088-.533.236-.896l7.98-13.204C8.57.57 9.086 0 10 0s1.43.57 1.784 1.143l7.98 13.204c.15.363.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H1.955c-1.08 0-1.955-.517-1.955-1.9z"></path></g></svg>
              </button>
            </span>
            <div>
              <svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
                <path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path>
              </svg>
              {{v.comment_count}}
            </div>
            <div>
              <svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg>
              分享
            </div>
            <div>
              <svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg>
              收藏
            </div>
            <div>
              <svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg>
            </div>
            <div @click="readAll(v)" v-if="v.checked === 1" class="one-shouqi"><span>收起</span></div>
          </div>
        </div>
        <div class="on-close">
          <i class="iconfont icon-cc-close-crude"></i>
        </div>
      </li>
    </ul>
    <ShowImg :active='showImgShow' @toggle='showImg' :imgUrl='imgUrl'/>
  </div>
</template>
<script>
export default {
  name:'recommend',
  data() {
    return {
      imgUrl: '',
      showImgShow: false,
      authorDetailsShow: false,
      bottom: false,
      beers: []
    }
  },
  components: {

  },
  methods:{
    // 查看大图
    showImg(imgurl) {
      console.log(imgurl);
      this.imgUrl = imgurl;
      this.showImgShow = !this.showImgShow;
    },
    readAll(v) {
      if (v.checked === 1) {
        v.checked = 0
      } else {
        v.checked = 1
      }
      // v.checked=!v.checked
    },
    // 显示作者详情
    toggleShow(id) {
      if (id) {
        this.authorDetailsShow=id;
      } else {
        this.authorDetailsShow=false;
      }
    },
    // 到底部的时候
    bottomVisible() {

      const scrollY = window.scrollY;
      const visible = document.documentElement.clientHeight;
      const pageHeight = document.documentElement.scrollHeight;
      const bottomOfPage = visible + scrollY >= pageHeight-400;

      return bottomOfPage || pageHeight-400 < visible;
    },
    addBeer() {
      try {
        this.$store.dispatch('getRequestAllowError', {
          name: 'recommendlist',
          params: ''
        }).then(() => {
          let data = this.$store.state.recommendlist.data;
          data.forEach(v => {
            this.beers.push(v);
          })
          // if (this.bottomVisible()) {
          //   this.addBeer()
          // }
        })
      } catch (error) {

      }
    }
  },
  watch: {
    bottom(bottom) {
      if (bottom) {
        this.addBeer()
      }
    }
  },
  created() {
    window.addEventListener('scroll', () => {
      this.bottom = this.bottomVisible()
    })
    this.addBeer()
  },
  computed:{

  }
}
</script>
<style lang="less">
.one-recommend{
  width:100%;
  background: #f4f5f5;
  >li:first-child{
    margin-top:15px;
  }
  >li{
    position: relative;
    border: 1px solid #eaeefb;
    margin-bottom:15px;
    background: #fff;
    border-radius: 4px;
    transition: all .3s ease-in-out;
  }
  >li:hover{
    box-shadow: 0 6px 18px 0 rgba(232,237,250,.5);
  }
}
.on-close{
  position: absolute;
  right: 20px;
  top: 20px;
  color: #77839c;
  opacity: 0;
  transition: opacity .3s ease-in;
  cursor: pointer;
  i.icon-cc-close-crude{
    font-size: 12px;
  }
}
.one-recommend{
  >li:hover{
    .on-close{
      opacity: .8;
    }
  }

}
.one-recommend-box{
  padding:15px 20px;
}
.one-recommend-box-title{
  font-size:16px;
  color:#8590a6;
  margin-bottom:5px;
}
.one-recommend-box-author{
  display: flex;
  margin-bottom: 4px;
}
.one-recommend-orange{
  cursor: pointer;
}
.author-title{
  display: flex;
  margin-left:10px;
  position: relative;
  >div{
    line-height:24px;
  }
}
.author-details{
  position: absolute;
  top: 100%;
  left: 0;
}
.author-name{
  font-weight: 600;
  color:#444;
  font-size: 14px;
  cursor: pointer;
}
.author-nichneg{
  span{
    color:#8590a6;
    font-size: 14px;
  }
  span:before{
    content: "\FF0C";
  }
}
.one-content-box{
  display: flex;
}
.one-content-cont{
  flex:1 1 auto;
  min-width: 0;
}
.one-content-title{
  margin: .5rem 0 .8rem;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  a{
    font-size: 1.4rem;
    font-weight: 600;
    line-height: 1.2;
    color: #2e3135;
    text-decoration: none;
    font-size:18px;
  }
  a:hover{
    text-decoration: underline;
  }
}
.one-content-zantong{
  margin-bottom: 10px;
}
.one-content-zantong,.one-content-time{
  margin-top: 10px;
  font-size: 14px;
  color: #8590a6;
  span{
    cursor: pointer;
  }
}
.one-content-neirong{
  max-height: 100px;
  span{
    font-size: inherit;
    font-weight: 400;
    font-size:15px;
    font-style: normal;
    cursor: pointer;
  }
  a{
    padding: 0;
    margin-left: 4px;
    color: #217c8e;
    text-decoration: none;
    font-size:16px;
  }
  a:hover{
    color:#8590a6;
  }
}
.one-content-neirong2{
  overflow: hidden;
  line-height: 1.67;
  font-size: 15px;
  p {
    margin-top: 0;
    margin-bottom: .72em;
  }
  figure {
    margin: 24px 0 ;
  }
  img {
    margin: 0 auto;
  }
}
.one-content-img{
  flex: 0 0 auto;
  width: 8.9rem;
  height: 5.75rem;
  margin-left: 2rem;
  background-color: #fff;
  border-radius: 2px;
  cursor: pointer;
  img{
    width:100%;
  }
}
.recom-dianzan {
  button {
    display: inline-block;
    font-size: 14px;
    color: #8590a6;
    text-align: center;
    cursor: pointer;
    background: none;
    border: 1px solid;
    border-radius: 3px;
    line-height: 30px;
    padding: 0 12px;
  }
  .vote-button {
    color: #0084ff;
    background: rgba(0,132,255,.1);
    border-color: transparent;
  }
  .VoteButton-upIcon {
    margin-right: 8px;
  }
  button:hover {
    background-color: rgba(0, 132, 255, .15);
  }
  button .is-active {
    color: #fff;
    background: #0084ff;
  }
}
.one-recommend-box-share{
  display: flex;
  align-items: center;
  color: #8590a6;
  background: #fff;
  cursor: pointer;
  padding-top: 10px;
  font-size: 15px;
  div {
    margin-left: 24px;
    font-size: 14px;
    display: inline-flex;
    align-items: center;
  }
}
.one-shouqi{
  margin-left: auto;
}
@media (max-width: 960px) {
  .one-content-img{
    display: none;
  }
}
</style>
