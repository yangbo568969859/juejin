<template>
  <div class="taglist">
    <div class="taglist-header">
      <h4>我的文章</h4>
      <div class="taglist-headeroptions">
        <span>按时间排序</span>
        <span class="iconfont icon-xiangxiajiantou"></span>
      </div>
    </div>
    <div class="taglist-cont likes-cont">
      <ul>
        <li class="front-li">
          <div>
            <a href="">
              <div class="front-li-box">
                <div class="front-li-info">
                  <div class="front-info front-info-meta">
                    <ul>
                      <li class="front-li-item front-item-hot">热</li>
                      <li class="front-li-item front-item-recommend">推荐</li>
                      <li class="front-li-item front-item-post">专栏</li>
                      <li class="front-li-item front-item-username clickable">落花与无情</li>
                      <li class="front-li-item front-item-time">3小时前</li>
                      <li class="front-li-item front-item-tag clickable">爱情</li>
                    </ul>
                  </div>
                  <div class="front-info front-info-title">
                    <a href="">ququq</a>
                  </div>
                  <div class="front-info front-info-action">
                    <ul>
                      <li>
                        <a>
                          <span class="iconfont icon-shoucang"></span>
                          <span>12</span>
                        </a>
                      </li>
                      <li>
                        <a>
                          <span class="iconfont icon-comment1"></span>
                          <span>12</span>
                        </a>
                      </li>
                      <li class="front-commit front-commit-share">
                        <a>
                          <span class="iconfont icon-share"></span>
                        </a>
                      </li>
                      <li class="front-commit">
                        <a>
                          <span class="iconfont icon-shoucang"></span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </a>
          </div>
        </li>
      </ul>
    </div>
    <div class="empty">
      <svg  width="66" height="68" viewBox="0 0 66 68" class="icon empty-icon"><g  fill="none" fill-rule="evenodd" transform="translate(4 3)"><g  fill="#F7F7F7"><path  d="M9 10h23.751v3.221H9zM9 16.494h41.083v4.026H9zM9 26.104h23.751v3.221H9zM9 42.208h23.751v3.221H9zM9 33.351h41.083v4.026H9zM9 49.455h41.083v4.026H9z"></path></g> <rect  width="56" height="60" x="1.139" y="1.338" stroke="#EBEBEB" stroke-width="2" rx="6"></rect></g></svg>
      <div class="empty-text">还没有活动</div>
    </div>
  </div>
</template>
<script>
export default {
  name:'likes',
  data() {
    return {

    }
  },
  methods:{

  }
}
</script>
<style lang="less">
.likes-cont{

}
  .likes-cont{
    >ul{
      width: 100%;
      background-color: #fff;
    }
  }
  .front-li{
    border-bottom: 1px solid rgba(178,186,194,.15);
  }
  .front-info{
    ul{
      display: flex;
      align-items: baseline;
      white-space: nowrap;
      li{

      }
    }
  }
  .front-li-box{
    display: flex;
    align-items: center;
    padding: 1.5rem 2rem;
  }
  .front-li-box:hover{
    background-color: rgba(0,0,0,.01);
    li.front-commit{
      display: flex;
    }
  }
  .front-li-item{
    font-size: 1rem;
    color: #b2bac2;
  }
  .front-li-item:not(:last-child):after{
    content: "\B7";
    margin: 0 .4em;
    color: #b2bac2;
  }
  .front-li-item.clickable:hover{
    color: #007fff;
  }
  .front-item-hot{
    font-weight: 500;
    color: red;
  }
  .front-item-recommend{
    font-weight: 500;
    color: #f70;
  }
  .front-item-post{
    font-weight: 500;
    color: #b71ed7;
  }
  .front-item-username{
    font-weight: 500;
  }

  .front-info-title{
    margin: .5rem 0 1rem;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    a{
      font-size: 1.4rem;
      font-weight: 600;
      line-height: 1.2;
      color: #2e3135;
    }
  }

  .front-info-action{
    ul{
      display: inline-flex;
      white-space: nowrap;
      li{
        height: 26px;
        display: flex;
        justify-content: center;
        align-items: center;
        white-space: nowrap;
        color: #b2bac2;
        border-radius: 1px;
        border: 1px solid #edeeef;
        a{
          display: flex;
          align-items: center;
          padding:0 10px;
          span:not(:first-child){
            margin-left:5px;
          }
        }
      }
      li:hover{
        background-color: #f7f8fa;
      }
      li.front-commit{
        display: none;
      }
      li.front-commit-share{
        margin-left: 10px;
      }
    }
  }

  @media (max-width: 980px) {
    .front-info-title{
      a{
        font-size: 1.2rem;
      }
    }
  }
</style>
