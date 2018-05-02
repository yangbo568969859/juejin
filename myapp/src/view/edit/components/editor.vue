<template>
  <div id="editor">
    <header class="editor-header">
      <input type="text" placeholder="请输入文章标题">
      <div class="editor-right-box">
        <div class="fabubtn">
          <div @click="fabuxiala()">
            <span>发布</span>
            <span class="iconfont icon-xiangxiajiantou"></span>
          </div>
          <div class="edit-upload" v-if="xialaShow">
            <div class="edit-title">发布文章</div>
            <div class="edit-category-box">
              <div class="edit-sub-title">选择分类</div>
              <div class="edit-category-list">
                <div :class="{item:true,active:v.isSubscribe}" v-for="v in taglist" :key="v.id" @click="checkTags(v)">{{v.name}}</div>
              </div>
            </div>
            <div class="edit-tags-box">
              <div class="edit-sub-title">标签</div>
              <div class="edit-tag-input">
                <input type="text" v-model="selectTags" placeholder="搜索标签（可选填）">
              </div>
            </div>
            <button class="edit-fabu-btn" @click="fabu()">确认并发布</button>
          </div>
        </div>
        <div class="user-img" :style="{backgroundImage:'url('+'/static/img/22.png'+')'}"></div>
      </div>
    </header>
    <mavon-editor style="height: 100%" v-model="value" @change="Change"></mavon-editor>
    <!-- <div class="drog-upload">
      <DrogUpload />
    </div> -->
  </div>
</template>
<script>
import { mavonEditor } from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
export default {
  name: 'editor',
  data() {
    return {
      value: '',
      xialaShow: false,
      selectTags: '',
      fabuData: {}
    }
  },
  methods:{
    $htmlCode(value, string) {
      console.log(value, string)
      this.value = string
    },
    Change(e) {
      console.log(e)
    },
    // 点击标签选择
    checkTags(v) {
      this.taglist.forEach(val => {
        val.isSubscribe = false;
      })
      v.isSubscribe = true;
      this.fabuData.tags = v;
    },
    // 发布下拉框
    fabuxiala() {
      this.xialaShow=!this.xialaShow;
    },
    fabu() {
      this.fabuData.selectTags = this.selectTags;
      this.fabuData.value = this.value;
      console.log(this.fabuData);
      try {
        this.$store.dispatch('postRequestAllowError', {
          name:'edit',
          params:this.value
        })
      } catch (error) {

      }
    },
    // 获取进入该页面的标签数据
    getMsgList() {
      try {
        this.$store.dispatch('postRequestAllowError', {
          name:'category',
        })
      } catch (error) {

      }
    }
  },
  mounted() {
    // this.getMsgList();
  },
  created() {
    this.getMsgList();
  },
  components: {
    mavonEditor
  },
  computed:{
    taglist() {
      let data = this.$store.state.category.data;
      return data;
    }
  }
}
</script>
<style>
.drog-upload{
  margin-top: 20px;
}
</style>

<style lang="less">
#editor {
  margin: auto;
  width: 80%;
  height: 580px;
}

.editor-header{
  display: flex;
  align-items: center;
  height: 60px;
  background: #fff;
  input{
    margin: 0;
    padding: 0;
    padding-left: 10px;
    font-size: 24px;
    font-weight: 700;
    color: #000;
    border: none;
    outline: none;
    flex: 1 1 auto;
    height: 100%;
  }
  .editor-right-box{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    .fabubtn{
      position: relative;
      margin-right: 10px;
      span{
        font-size: 16px;
        white-space: nowrap;
        color: #007fff;
        cursor: pointer;
      }
    }
    .user-img{
      margin-right: 10px;
      width: 32px;
      height: 32px;
      border-radius: 50%;
      background-color: #eee;
      background-repeat: no-repeat;
      background-size: cover;
      cursor: pointer;
    }
  }
}
.edit-upload::before{
  content: "";
  position: absolute;
  margin-left: -.5rem;
  top: -.6rem;
  left: 78%;
  width: 1rem;
  height: 1rem;
  background-color: #fff;
  border: 1px solid #ddd;
  border-right: none;
  border-bottom: none;
  transform: rotate(45deg);
}
.edit-upload{
  cursor: default;
  user-select: none;
  padding:20px;
  width: 320px;
  position: absolute;
  top: 150%;
  right: 0;
  margin-right: -40px;
  z-index: 1501;
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 2px;
  box-shadow: 0 1px 2px #f1f1f1;
  color: #909090;
  .edit-title{
    margin-bottom: 20px;
    font-size: 18px;
    font-weight: 700;
    color: hsla(218,9%,51%,.8);
  }
}
.edit-sub-title{
  margin-bottom: 12px;
  font-size: 16px;
}
.edit-tags-box{
  margin-bottom: 20px;
}
.edit-tag-input{
  input{
    padding:5px 0 ;
    width: 200px;
    font-size: 12px;
    border: none;
    border-bottom: 1px solid #f1f1f1;
    border-radius: 0;
    outline: none;
    color: initial;
  }
}
.edit-category-list{
  .item{
    display: inline-block;
    margin: 0 8px 10px 0;
    padding: 6px 10px;
    font-size: 12px;
    white-space: nowrap;
    border: 1px solid #f1f1f1;
    border-radius: 2px;
    cursor: pointer;
  }
  .item.active{
    color: #007fff;
    border-color: rgba(0,127,255,.15);
    background-color: rgba(0,127,255,.05);
  }
}
.edit-fabu-btn{
  outline: none;
  display: block;
  padding:7px 14px;
  color: #007fff;
  transition: all .2s;
  border-radius: 2px;
  cursor: pointer;
  border: 1px solid currentColor;
  background-color:#fff;
  margin: 0 auto;
}
.edit-fabu-btn:hover{
  background-color: rgba(3,113,223,.05);
}
</style>

