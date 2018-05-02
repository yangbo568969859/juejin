<template>
  <div class="drogcom">
    <div :class="isRed?'isred':'isgray'">
      <div class="drogform">
        <form action="">
          <label for="tf_input_label">点此上传</label>
          <div class="drog-input"
              @dragleave.stop.prevent.capture="dragleaveShouldDo"
              @dragenter.stop.prevent.capture="dragenterShouldDo"
              @drop.stop.prevent="dropShouldDo($event)">
            <div class="nimabi"
              contenteditable="true"
              @paste="pasteShouldDo"
              >
            </div>
            <input type="file" id="tf_input_label"  @change="inputFileShouldDo($event)">
          </div>
        </form>
      </div>
    </div>
    <ul>
      <li v-for="(v, i) in fileNameList" :key="v.url">
        <div>
          {{v.name}}
        </div>
        <div>
          {{v.size}}K
        </div>
        <div>
          {{v.percent}}
        </div>
        <div>
          <i @click="deleteAFile(i)">
              X
            </i>
          <i>
              V
            </i>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    name: 'DrogUpload',
    data() {
      return {
        url: 'http://192.168.5.37/upload',
        hasFile: false,
        nowFileName: {},
        fileNameList: [],
        isRed: false
      }
    },
    watch: {
      fileNameList(newVal, oldVal) {
        // console.log(newVal, oldVal)
      }
    },
    methods: {
      deleteAFile(i) {
        this.fileNameList.splice(i, 1)
        this.$emit('updated', this.fileNameList)
      },
      buttonClick(msg) {
        if (msg) {
          this.uploadImgFromPaste(this.file, this.url)
        }
      },
      changeIsRed(v) {
        this.isRed = v
      },
      dragleaveShouldDo() {
        this.changeIsRed(false)
      },
      inputFileShouldDo(e) {
        this.inputFile(e)
        this.changeIsRed(true)
        setTimeout(() => {
          this.changeIsRed(false)
        }, 500)
      },
      pasteShouldDo(e) {
        this.paste(e)
        this.changeIsRed(true)
        setTimeout(() => {
          this.changeIsRed(false)
        }, 500)
      },
      dragenterShouldDo() {
        this.changeIsRed(true)
      },
      dropShouldDo(e) {
        this.changeIsRed(false)
        this.drop(e)
      },
      inputFile(e) {
        // let form = document.documentElement.querySelector('.my-drag-upload form')
        let inputFileDom = document.getElementById('tf_input_label')
        // console.log(form, inputFileDom)
        // this.$options.form = form
        window.a = inputFileDom
        this.$options.inputFileDom = inputFileDom
        let file = e.target.files[0]
        if (file) {
          this.nowFileName = {
            name: file.name,
            size: file.size / 1024,
            type: file.type || file.name.match(/\.(\w+)/g)[0],
            percent: '0%'
          }
          this.uploadImgFromPaste(e.target.files[0], this.url)
        }
      },
      drop(event) {
        event.preventDefault()
        // console.log(e)
        let files = event.target.files || event.dataTransfer.files
        // console.log(files)
        // let file = files[0]
        let file
        let len = files.length
        for (let i = 0; i < len; i++) {
          // console.log(files[i])
          if (files[i] && files[i].name) {
            // if (files[i] && files[i].type.indexOf('image') !== -1) {
            file = files[i]
          }
        }
        if (file) {
          this.nowFileName = {
            name: file.name,
            size: file.size / 1024,
            type: file.type || file.name.match(/\.(\w+)/g)[0],
            percent: '0%'
          }
          this.uploadImgFromPaste(file, this.url)
        }
        // var img = window.webkitURL.createObjectURL(file);
        /*
        let reader = new FileReader();
        reader.addEventListener('load', (e) => {
          console.log(e.target.result, '-------')
          console.log(files)
          console.log(reader)
          console.log('文件名：' + file.name + '文件类型：' + file.type + '文件大小' + file.size)
        })
        reader.readAsDataURL(file);
        console.log(reader)
        */
      },
      paste(event) {
        let dom = event.target
        let isChrome = false
        let file = null
        if (event.clipboardData || event.originalEvent) {
          // not for ie11  某些chrome版本使用的是event.originalEvent
          let clipboardData =
            event.clipboardData || event.originalEvent.clipboardData
          if (clipboardData.items) {
            // for chrome
            let items = clipboardData.items
            let len = items.length
            isChrome = true
            // items.length比较有意思，初步判断是根据mime类型来的，即有几种mime类型，长度就是几（待验证）
            // 如果粘贴纯文本，那么len=1，如果粘贴网页图片，len=2, items[0].type = 'text/plain', items[1].type = 'image/*'
            // 如果使用截图工具粘贴图片，len=1, items[0].type = 'image/png'
            // 如果粘贴纯文本+HTML，len=2, items[0].type = 'text/plain', items[1].type = 'text/html'
            // console.log('len:' + len);
            // console.log(items[0]);
            // console.log(items[1]);
            // console.log( 'items[0] kind:', items[0].kind );
            // console.log( 'items[0] MIME type:', items[0].type );
            // console.log( 'items[1] kind:', items[1].kind );
            // console.log( 'items[1] MIME type:', items[1].type );
            // 阻止默认行为即不让剪贴板内容在div中显示出来
            event.preventDefault()
            // 在items里找粘贴的image,据上面分析,需要循环
            for (let i = 0; i < len; i++) {
              // 只允许粘贴图片
              // console.log(items[i].type)
              if (items[i].type.indexOf('image') !== -1) {
                // getAsFile() 此方法只是living standard firefox ie11 并不支持
                file = items[i].getAsFile()
                if (file) {
                  this.nowFileName = {
                    name: file.name,
                    size: file.size / 1024,
                    type: file.type || file.name.match(/\.(\w+)/g)[0],
                    percent: '0%'
                  }
                  this.uploadImgFromPaste(file, this.url)
                }
              } else if (items[i].type.indexOf('text') !== -1) {
                // console.log(items[i])
              }
            }
          } else {
            // for firefox
            setTimeout(() => {
              // 设置setTimeout的原因是为了保证图片先插入到div里，然后去获取值
              let imgList = dom.querySelectorAll('img'),
                len = imgList.length,
                srcStr = '',
                i
              for (i = 0; i < len; i++) {
                if (imgList[i].className !== 'my_img') {
                  // 如果是截图那么src_str就是base64 如果是复制的其他网页图片那么src_str就是此图片在别人服务器的地址
                  srcStr = imgList[i].src
                }
              }
              // this.file = srcStr
              this.nowFileName = {
                name: srcStr.name,
                size: srcStr.size / 1024,
                type: srcStr.type || srcStr.name.match(/\.(\w+)/g)[0],
                percent: '0%'
              }
              this.uploadImgFromPaste(srcStr, this.url)
            }, 1)
          }
        } else {
          // for ie11
          setTimeout(() => {
            let imgList = dom.querySelectorAll('img'),
              len = imgList.length,
              srcStr = '',
              i
            for (i = 0; i < len; i++) {
              if (imgList[i].className !== 'my_img') {
                srcStr = imgList[i].src
              }
            }
            // this.file = srcStr
            this.nowFileName = {
              name: srcStr.name,
              size: srcStr.size,
              type: srcStr.type || srcStr.name.match(/\.(\w+)/g)[0],
              percent: '0%'
            }
            this.uploadImgFromPaste(srcStr, this.url)
          }, 1)
        }
      },
      uploadImgFromPaste(file, url) {
        let xhr = new XMLHttpRequest()
        xhr.open('post', url, true)
        // xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.withCredentials = true
        let fd = new FormData()
        fd.append('file', file)
        xhr.addEventListener('load', data => {
          // console.log(data, xhr.responseText)
          let reqUrl = JSON.parse(xhr.responseText).msg
          this.nowFileName = null
          // this.$options.form.reset()
          if (this.$options.inputFileDom) {
            this.$options.inputFileDom.value = ''
          }
          this.$set(this.fileNameList[l - 1], 'url', reqUrl)
          this.$emit('updated', this.fileNameList)
        })
        let size = this.nowFileName.size
        xhr.upload.addEventListener('progress', e => {
          // 开始上传
          let percent = parseInt(100 * e.loaded / size)
          this.$set(
            this.fileNameList[l - 1],
            'percent',
            (percent > 100 ? 100 : percent) + '%'
          )
        })
        this.fileNameList.push({ ...this.nowFileName
        })
        let l = this.fileNameList.length
        xhr.send(fd)
      }
    }
  }
</script>
<style>

</style>

<style lang="less">
  .nimabi{
    position: absolute;
    bottom: 0;
    height: 80%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    border-top: 1px solid #999;
  }
  .drogcom {
    width: 360px;
    height: 180px;
    >div {
      width: 360px;
      height: 180px;
      border-radius: 5px;
    }
    .isgray {
      border: 1px dashed #999;
    }
    .isgray:hover {
      border: 1px dashed #409eff;
    }
    .isred {
      border: 1px dashed red;
    }
  }
  .drog-input {
    input {
      opacity: 0;
      width: 100%;
      height: 20%;
    }
  }
  .drogform {
    width: 100%;
    height: 100%;
    form {
      width: 100%;
      height: 100%;
      position: relative;
      >div {
        position: absolute;
        top: 0;
        right: 0;
        z-index: 100;
        width: 100%;
        height: 100%;
      }
      label {
        position: absolute;
        top: 10px;
        left: 40%;
        z-index: 101;
      }
    }
  }
</style>
