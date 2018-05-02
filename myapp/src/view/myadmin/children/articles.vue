<template>
  <div class="taglist">
    <div class="taglist-header">
      <h4>我的文章</h4>
      <div class="taglist-headeroptions">
        <span>按时间排序</span>
        <span class="iconfont icon-xiangxiajiantou"></span>
      </div>
    </div>
    <div class="taglist-cont answer-cont" v-if="list!=''">
      <ul class="answer-list">
        <li v-for="(v,i) in list" :key="i">
          <div class="answer-list-box">
            <div class="answer-list-box-title">
              <span>
                {{v.tags}}：
                <span class="answer-list-orange">{{v.orange}}</span>
              </span>
            </div>
            <div class="answer-list-box-author">
              <span class="author-img">
                <img :src="v.author_img" alt="">
              </span>
              <div class="author-title">
                <div>
                  <span class="author-name" @mouseover="toggleShow(v.id)" @mouseout="toggleShow(v.id)">{{v.author_title}}</span>
                </div>
                <div class="author-details" v-if="authorDetailsShow==v.id">
                </div>
                <div class="author-nichneg">
                  <span>{{v.author_nicheng}}</span>
                </div>
              </div>
            </div>
            <div class="answer-list-box-content">
              <div class="one-content-box">
                <div class="one-content-cont">
                  <div class="one-content-title">
                    <a href="">{{v.content_title}}</a>
                  </div>
                  <div class="one-content-zantong" v-if="v.checked">
                    <span>13 人赞同了该回答</span>
                  </div>
                  <div class="one-content-neirong">
                    <span>{{v.content_cont}}</span>
                    <a @click="readAll(v)" v-if="v.checked==false">阅读全文 <i class="iconfont icon-xiangxiajiantou"></i> </a>
                  </div>
                  <div class="one-content-time" v-if="v.checked">
                    <span>发布于 06:22</span>
                  </div>
                </div>
                <div class="one-content-img">
                  <img :src="v.content_img" alt="">
                </div>
              </div>
            </div>
            <div class="answer-list-box-share">
              <span>100</span>
              <div>fenxiang1</div>
              <div>点赞</div>
              <div @click="readAll(v)" v-if="v.checked" class="one-shouqi"><span>收起</span></div>
            </div>
          </div>
          <div class="on-close">
            <i class="iconfont icon-cc-close-crude"></i>
          </div>
        </li>
      </ul>
    </div>
    <div class="empty" v-else>
      <svg width="66" height="68" viewBox="0 0 66 68" class="icon empty-icon"><g  fill="none" fill-rule="evenodd" transform="translate(4 3)"><g  fill="#F7F7F7"><path  d="M9 10h23.751v3.221H9zM9 16.494h41.083v4.026H9zM9 26.104h23.751v3.221H9zM9 42.208h23.751v3.221H9zM9 33.351h41.083v4.026H9zM9 49.455h41.083v4.026H9z"></path></g> <rect  width="56" height="60" x="1.139" y="1.338" stroke="#EBEBEB" stroke-width="2" rx="6"></rect></g></svg>
      <div class="empty-text">还没有写文章</div>
    </div>
    <ShowImg :active='showImgShow' @toggle='showImg' :imgUrl='imgUrl'/>
  </div>
</template>
<script>
  export default {
    name: 'articles',
    data() {
      return {
        authorDetailsShow: false,
        imgUrl: '',
        showImgShow: false,
        list: [
          {
            id: 1,
            tags: '热门内容',
            orange: '互联网',
            author_img: '/static/img/22.png',
            author_title: '历试管',
            author_nicheng: '历史狼爷',
            content_title: '你认为土木工程师群体的工程师文化是什么？',
            content_cont: '土木工程师的一个小坏工程就是一个终身炸弹，需要终身负责。IT工程师的一个小坏软件就是一个炮仗，需要钱包负责。…',
            content_img: '/static/img/22.png',
            checked: false
          },
          {
            id: 2,
            tags: '最新内容',
            orange: '吸猫',
            author_img: '/static/img/ad1.png',
            author_title: '历试管',
            author_nicheng: '我还是像你',
            content_title: '你认为土木工程师群体的工程师文化是什么？',
            content_cont: '土木工程师的一个小坏工程就是一个终身炸弹，需要终身负责。IT工程师的一个小坏软件就是一个炮仗，需要钱包负责。…',
            content_img: '/static/img/ad3.png',
            checked: false
          },
          {
            id: 3,
            tags: '最热门',
            orange: '猫狗大战',
            author_img: '/static/img/ad3.png',
            author_title: '狼爱上羊',
            author_nicheng: '我想是你的益达',
            content_title: '益达口香糖真的不含糖吗',
            content_cont: '益达口香糖真的不含糖吗，葡萄糖...',
            content_img: '/static/img/ad4.png',
            checked: false
          }
        ],
      }
    },
    methods: {
      readAll(v) {
        v.checked = !v.checked
      },
      // 查看大图
      showImg(imgurl) {
        console.log(imgurl);
        this.imgUrl = imgurl;
        this.showImgShow = !this.showImgShow;
      }
    },
    components: {
      ShowImg
    }
  }
</script>
<style lang="less">
  .answer-cont {}
  .answer-list {
    width: 100%;
    background: #f4f5f5;
    >li:first-child {
      // margin-top:15px;
    }
    >li {
      position: relative;
      border-bottom: 1px solid #ebebeb;
      // margin-bottom:15px;
      background: #fff;
      transition: all .3s ease-in-out;
    }
    >li:hover {
      box-shadow: 0 6px 18px 0 rgba(232, 237, 250, .5);
    }
  }
  .on-close {
    position: absolute;
    right: 20px;
    top: 20px;
    color: #77839c;
    opacity: 0;
    transition: opacity .3s ease-in;
    cursor: pointer;
    i.icon-cc-close-crude {
      font-size: 12px;
    }
  }
  .answer-list {
    >li:hover {
      .on-close {
        opacity: .8;
      }
    }
  }
  .answer-list-box {
    padding: 15px 20px;
  }
  .answer-list-box-title {
    font-size: 16px;
    color: #8590a6;
    margin-bottom: 5px;
  }
  .answer-list-box-author {
    display: flex;
    margin-bottom: 10px;
  }
  .answer-list-orange {
    cursor: pointer;
  }
  .author-title {
    display: flex;
    margin-left: 10px;
    position: relative;
    >div {
      line-height: 24px;
    }
  }
  .author-details {
    position: absolute;
    top: 100%;
    left: 0;
  }
  .author-name {
    font-weight: 600;
    color: #444;
    font-size: 14px;
    cursor: pointer;
  }
  .author-nichneg {
    span {
      color: #8590a6;
      font-size: 14px;
    }
    span:before {
      content: "\FF0C";
    }
  }
  .one-content-box {
    display: flex;
  }
  .one-content-cont {
    flex: 1 1 auto;
    min-width: 0;
  }
  .one-content-title {
    margin: .5rem 0 .8rem;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    a {
      font-size: 1.4rem;
      font-weight: 600;
      line-height: 1.2;
      color: #2e3135;
      text-decoration: none;
      font-size: 18px;
    }
    a:hover {
      text-decoration: underline;
    }
  }
  .one-content-zantong {
    margin-bottom: 10px;
  }
  .one-content-zantong,
  .one-content-time {
    margin-top: 10px;
    font-size: 14px;
    color: #8590a6;
    span {
      cursor: pointer;
    }
  }
  .one-content-neirong {
    span {
      font-size: inherit;
      font-weight: 400;
      font-size: 16px;
      font-style: normal;
      cursor: pointer;
    }
    a {
      padding: 0;
      margin-left: 4px;
      color: #217c8e;
      text-decoration: none;
      font-size: 16px;
    }
    a:hover {
      color: #8590a6;
    }
  }
  .one-content-img {
    flex: 0 0 auto;
    width: 8.9rem;
    height: 5.75rem;
    margin-left: 2rem;
    background-color: #fff;
    border-radius: 2px;
    cursor: pointer;
    img {
      width: 100%;
    }
  }
  .answer-list-box-share {
    display: flex;
    align-items: center;
    color: #646464;
    background: #fff;
    cursor: pointer;
    padding-top: 10px;
    font-size: 15px;
  }
  .one-shouqi {
    margin-left: auto;
  }
  @media (max-width: 960px) {
    .one-content-img {
      display: none;
    }
  }
</style>
