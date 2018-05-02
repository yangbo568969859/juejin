<template>
  <main class="containter">
    <div class="newshare-box">
      <nav class="newshare-nav">
        <ul>
          <li v-for="(v,i) in list" :key="i">
            <a target="_black" :href="v.href">{{v.name}}</a>
          </li>
        </ul>
      </nav>
      <div class="newshare-content">
        <div class="share">
          <h2>分享</h2>
        </div>
        <div class="newshare-form">
          <div class="newshare-form-left">
            <input type="text" placeholder="链接地址" class="input url-input">
            <input type="text" placeholder="标题" class="input url-input">
            <textarea placeholder="描述（140字以内）" maxlength="140" rows="4" class="input url-input"></textarea>
            <div class="category-list-box">
              <div class="title">分类</div>
              <ul class="category-ul">
                <li v-for="v in categories" :key="v.id">{{v.name}}</li>
              </ul>
            </div>
            <div class="tags-list-box">
              <div class="title">标签</div>
              <ul class="tags-ul">
                <li>
                  <input type="text" placeholder="可选填">
                </li>
              </ul>
            </div>
            <button class="submit-btn">发布</button>
          </div>
          <div class="newshare-form-right">
            <div class="upload-image">
              <input type="file">
              <div class="preview"></div>
              <div class="action-box">
                <div class="prompt">点击上传封面图</div>
              </div>
            </div>
            <div class="category-list-box">
              <div class="title">其它</div>
              <ul class="category-ul">
                <li v-for="v in metalist" :key="v.id">{{v.name}}</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data() {
    return {
      list:[
        {
          name:'分享指南',
          path:'',
          href:'/guidelines'
        },
        {
          name:'使用Chrome插件分享',
          path:'',
          href:'https://chrome.google.com/webstore/detail/gold/kcbndpepjkbeijkebhfjgkanpkambhil'
        }
      ],
      categories:[
        {
          "id": "5562b410e4b00c57d9b94a92",
          "name": "Android",
          "title": "android",
          "createdAt": "2016-04-21T19:19:13Z",
          "updatedAt": "2015-05-24T21:33:04Z",
          "icon": "https://dn-mhke0kuv.qbox.me/225aafca3a440e5d.png",
          "background": "https://dn-mhke0kuv.qbox.me/ec8d337c485c4db2.png",
          "tagId": "5597838ee4b08a686ce2319d",
          "weight": "1",
          "isSubscribe": false
        },
        {
          "id": "5562b415e4b00c57d9b94ac8",
          "name": "前端",
          "title": "frontend",
          "createdAt": "2016-03-09T00:39:02Z",
          "updatedAt": "2015-05-24T21:33:10Z",
          "icon": "https://dn-mhke0kuv.qbox.me/1c40f5eaba561e32.png",
          "background": "https://dn-mhke0kuv.qbox.me/8c95587526f346c0.png",
          "tagId": "5597a05ae4b08a686ce56f6f",
          "weight": "2",
          "isSubscribe": true
        },
        {
          "id": "5562b405e4b00c57d9b94a41",
          "name": "iOS",
          "title": "ios",
          "createdAt": "2016-04-21T19:19:10Z",
          "updatedAt": "2015-05-24T21:32:54Z",
          "icon": "https://dn-mhke0kuv.qbox.me/4a218bdf1f6969fd.png",
          "background": "https://dn-mhke0kuv.qbox.me/34589746327a360a.png",
          "tagId": "5597838ae4b08a686ce23139",
          "weight": "3",
          "isSubscribe": false
        },
        {
          "id": "569cbe0460b23e90721dff38",
          "name": "产品",
          "title": "product",
          "createdAt": "2016-04-29T04:39:33Z",
          "updatedAt": "2016-01-18T02:27:17Z",
          "icon": "https://dn-mhke0kuv.qbox.me/057d8e19e6405697.png",
          "background": "https://dn-mhke0kuv.qbox.me/91e7ff7e6447c6cc.png",
          "tagId": "56e65334da2f60004c50910f",
          "weight": "4",
          "isSubscribe": false
        },
        {
          "id": "5562b41de4b00c57d9b94b0f",
          "name": "设计",
          "title": "design",
          "createdAt": "2016-03-09T00:38:50Z",
          "updatedAt": "2015-05-24T21:33:18Z",
          "icon": "https://dn-mhke0kuv.qbox.me/3627821e57ceecb9.png",
          "background": "https://dn-mhke0kuv.qbox.me/784dddfade84f1c9.png",
          "tagId": "5597a035e4b08a686ce56bd9",
          "weight": "5",
          "isSubscribe": false
        },
        {
          "id": "5562b422e4b00c57d9b94b53",
          "name": "工具资源",
          "title": "freebie",
          "createdAt": "2016-03-09T00:38:40Z",
          "updatedAt": "2015-05-24T21:33:22Z",
          "icon": "https://dn-mhke0kuv.qbox.me/eb20ab1334d9abea.png",
          "background": "https://dn-mhke0kuv.qbox.me/412957a61f414c0b.png",
          "tagId": "5597a04de4b08a686ce56e63",
          "weight": "6",
          "isSubscribe": false
        },
        {
          "id": "5562b428e4b00c57d9b94b9d",
          "name": "阅读",
          "title": "article",
          "createdAt": "2016-03-09T00:38:15Z",
          "updatedAt": "2015-05-24T21:33:28Z",
          "icon": "https://dn-mhke0kuv.qbox.me/20f56d7df9f97d1d.png",
          "background": "https://dn-mhke0kuv.qbox.me/228be0376b22924b.png",
          "tagId": "",
          "weight": "7",
          "isSubscribe": false
        },
        {
          "id": "5562b419e4b00c57d9b94ae2",
          "name": "后端",
          "title": "backend",
          "createdAt": "2016-03-09T00:38:00Z",
          "updatedAt": "2015-05-24T21:33:13Z",
          "icon": "https://dn-mhke0kuv.qbox.me/a2ec01b816abd4c5.png",
          "background": "https://dn-mhke0kuv.qbox.me/fb3b208d06e6fe32.png",
          "tagId": "5597a063e4b08a686ce57030",
          "weight": "8",
          "isSubscribe": false
        },
        {
          "id": "57be7c18128fe1005fa902de",
          "name": "人工智能",
          "title": "ai",
          "createdAt": "2017-07-24T06:11:04Z",
          "updatedAt": "2017-07-24T06:11:07Z",
          "icon": "https://dn-mhke0kuv.qbox.me/9b525117507d7a76c4ac.png",
          "background": "https://dn-mhke0kuv.qbox.me/9b525117507d7a76c4ac.png",
          "tagId": "57be7c18128fe1005fa902de",
          "weight": "9",
          "isSubscribe": false
        }
      ],
      metalist:[
        {
          "id": "5562b410e4b00c57d9b94392",
          "name": "投票",
          "title": "android",
          "createdAt": "2016-04-21T19:19:13Z",
          "updatedAt": "2015-05-24T21:33:04Z",
          "icon": "https://dn-mhke0kuv.qbox.me/225aafca3a440e5d.png",
          "background": "https://dn-mhke0kuv.qbox.me/ec8d337c485c4db2.png",
          "tagId": "5597838ee4b08a686ce2319d",
          "weight": "1",
          "isSubscribe": false
        },
        {
          "id": "5562b415e4b00c57d9b94ac8",
          "name": "原创",
          "title": "frontend",
          "createdAt": "2016-03-09T00:39:02Z",
          "updatedAt": "2015-05-24T21:33:10Z",
          "icon": "https://dn-mhke0kuv.qbox.me/1c40f5eaba561e32.png",
          "background": "https://dn-mhke0kuv.qbox.me/8c95587526f346c0.png",
          "tagId": "5597a05ae4b08a686ce56f6f",
          "weight": "2",
          "isSubscribe": true
        },
        {
          "id": "5562b405e4b00c57d9b94a41",
          "name": "墙外",
          "title": "ios",
          "createdAt": "2016-04-21T19:19:10Z",
          "updatedAt": "2015-05-24T21:32:54Z",
          "icon": "https://dn-mhke0kuv.qbox.me/4a218bdf1f6969fd.png",
          "background": "https://dn-mhke0kuv.qbox.me/34589746327a360a.png",
          "tagId": "5597838ae4b08a686ce23139",
          "weight": "3",
          "isSubscribe": false
        },
        {
          "id": "569cbe0460b23e90721dff38",
          "name": "英文",
          "title": "product",
          "createdAt": "2016-04-29T04:39:33Z",
          "updatedAt": "2016-01-18T02:27:17Z",
          "icon": "https://dn-mhke0kuv.qbox.me/057d8e19e6405697.png",
          "background": "https://dn-mhke0kuv.qbox.me/91e7ff7e6447c6cc.png",
          "tagId": "56e65334da2f60004c50910f",
          "weight": "4",
          "isSubscribe": false
        },
      ]
    }
  },
}
</script>
<style lang="less">
main.containter{
  max-width:960px;
  width: 100%;
  margin:0 auto;
  position: relative;
}
.newshare-box{
  margin-top:20px;
}
.newshare-content{
  margin-top: 60px;
  .share{
    margin: 20px 0;
    h2{
      font-size: 24px;
    }
  }
}
.newshare-nav{
  position: fixed;
  background: #fff;
  top: 5rem;
  left: 0;
  width:100%;
  height: 40px;
  z-index: 100;
  box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
  transition: all .2s;
  transform: translateZ(0);
  ul{
    max-width: 960px;
    margin: auto;
    line-height: 1;
    display: flex;
    align-items:center;
    height: 100%;
    li{
      font-size: 14px;
      cursor: pointer;
      color: #71777c;
      height: 100%;
      display: flex;
      align-items: center;
      position: relative;
      a{
        color: #71777c;
      }
      a:before{
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
      }
      a:hover{
        color:#217c8e;
      }
    }
    li:first-child{
      padding-right:10px;
    }
    li:last-child{
      padding-left: 10px;
    }
  }
}
.newshare-form{
  display: flex;
  justify-content: space-between;
  position: relative;
}
.newshare-form-left{
  flex: 2;
  padding-right:20px;
  .input:not(:last-child){
    margin-bottom: 1.3rem;
  }
  .url-input{
    padding: 1rem;
    font-size: 1.3rem;
    line-height: 1.4;
    font-family: inherit;
  }
  .category-list-box{
    margin: 1.3rem auto;
    display: flex;
    .title{
      font-size: 16px;
      margin-right: 15px;
    }
    .category-ul{
      display: flex;
      align-items: center;
      li{
        border:1px solid #f1f1f1;
        color: #909090;
        display: inline-block;
        margin-right: 8px;
        padding: .4rem .9rem;
        cursor: pointer;
        background-color: #fff;
        border-radius: 2px;
        transition: all .3s;
      }
      li:hover{
        color: #007fff;
        border-color: rgba(0,127,255,.15);
        background-color: rgba(0,127,255,.05);
      }
    }
  }
  .tags-list-box{
    margin: 1.3rem auto;
    display: flex;
    .title{
      font-size: 16px;
      margin-right: 15px;
    }
    .tags-ul{
      li{
        input{
          padding: .5rem;
          font-size: 1rem;
        }
      }
    }
  }
  .submit-btn{
    margin-top: 1.8rem;
    background-color: #007fff;
    color: #fff;
    border-radius: 2px;
    border: none;
    padding: .5rem 1.3rem;
    outline: none;
    transition: background-color .3s,color .3s;
    cursor: pointer;
    width: 100%;
  }
  .submit-btn:hover{
    background-color: #0371df;
    color: #fff;
  }
}
.newshare-form-right{
  flex: 1;
  .upload-image{
    position: relative;
    background-color: hsla(0,0%,95%,.9);
    border:1px dashed hsla(0,0%,40%,.2);
    cursor: pointer;
    text-align: center;
    padding: 3rem .6rem;
    min-height: 18rem;
    transition: color .3s,background-color .3s;
  }
  input[type="file"]{
    display: none;
  }
  .preview{
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-position: 50%;
    background-size: cover;
  }
  .action-box{
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    cursor: pointer;
    .prompt{
      color: #71777c;
      font-size: 14px;
    }
  }
  .category-list-box{
    margin: 1.3rem auto;
    display: flex;
    .title{
      font-size: 16px;
      margin-right: 15px;
    }
    .category-ul{
      display: flex;
      align-items: center;
      li{
        border:1px solid #f1f1f1;
        color: #909090;
        display: inline-block;
        margin-right: 8px;
        padding: .4rem .9rem;
        cursor: pointer;
        background-color: #fff;
        border-radius: 2px;
        transition: all .3s;
      }
      li:hover{
        color: #007fff;
        border-color: rgba(0,127,255,.15);
        background-color: rgba(0,127,255,.05);
      }
    }
  }
}
input[type=password], input[type=text], input[type=url], textarea {
    resize: none;
    outline: none;
    width: 100%;
    display: block;
    box-shadow: none;
    border: 1px solid #ddd;
    border-radius: 2px;
    transition: border .3s;
    background-color: #fff;
    box-sizing: border-box;
}
</style>
