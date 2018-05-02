<template>
  <div class="front-end">
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
</template>

<script>
export default {
  name:'backend'
}
</script>

<style lang="less">
  .front-end{
    margin-top: 15px;
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
    a:hover{
      text-decoration: underline;
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