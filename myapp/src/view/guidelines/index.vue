<template>
  <div class="guidelines">
    <header>
      <div class="text-center">
        <a href="/">
          <img src="/static/img/ad1.png" alt="">
        </a>
      </div>
    </header>
    <div class="guidelines-content">
      <div class="guidelines-container">
        <br>
        <div class="entry-content">
          <h3>如何在这里分享？</h3>
          <ul>
            <li>通过 <a href="">投稿</a> 你想要分享的文章</li>
            <li>成为联合编辑 Co-Editor，自由 <a href="">分享</a></li>
          </ul>
          <hr>
          <h3>什么值得分享？</h3>
          <ul>
            <li>它应该与<strong>专业技术</strong>相关：开发、设计、产品、科技</li>
            <li>成为联合编辑 Co-Editor，自由 <a href="">分享</a></li>
            <li>它应该以 <strong>技术</strong> 的角度启发他人去了解和学习</li>
          </ul>
          <hr>
          <h3>支持什么？</h3>
          <ul>
            <li>原创文章、开源内容</li>
            <li>任何技术正确的内容</li>
            <li>一个干净的技术讨论环境</li>
          </ul>
          <hr>
          <h3>反对什么？</h3>
          <ul>
            <li>不正确、不明确的分享内容</li>
            <li>不文明的讨论及人身攻击</li>
          </ul>
          <hr>
        </div>
        <div class="entry-text">
          <a href="/">返回首页</a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {

}
</script>
<style lang="less">
.guidelines{
  background: #fff;
  // height: calc(~"100vh - 64px");
  // overflow: auto;
  header{
    position: fixed;
    z-index: 5;
    top: 0;
    right: 0;
    left: 0;
    background: #fff;
    color: #909090;
    height: 64px;
    border-bottom: 1px solid #f1f1f1;
    .text-center{
      width: 960px;
      position: relative;
      margin:0 auto;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      a{
        img{
          height: 50px;
        }
      }
    }
  }
}
.guidelines-content{
  margin-top: 64px;
  padding-bottom: 64px;
}
.guidelines-container{
  width: 960px;
  position: relative;
  margin: 0 auto;
  .entry-content{
    width: 25vw;
    min-width: 480px;
    margin: 0 auto;
    h3{
      margin: 20px 0;
      font-size: 20px;
    }
    ul{
      li{
        margin-bottom: 8px;
        font-size: 16px;
        a{
          color: #007fff;
        }
      }
    }
    hr{
      border-top: 1px solid #ddd;
      border-bottom: none;
      border-left: none;
      border-right: none;
      margin-top: 30px;
      margin-bottom: 30px;
    }
  }
  .entry-text{
    text-align: center;
    a{
      background-color: #f1f1f1;
      color: #333;
      border-radius: 2px;
      border: none;
      padding: .5em 1em;
    }
  }
}

@media (max-width: 960px) {
  .guidelines {
    header {
      .text-center {
        width: 100%;
      }
    }
  }
  .guidelines-container {
    width: 100%;
    .entry-content {
      padding: 0 24px;
      min-width: 100%;
    }
  }
}
</style>
