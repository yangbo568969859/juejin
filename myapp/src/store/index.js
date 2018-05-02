import Vue from 'vue';
import Vuex from 'vuex';

import router from './../router';
window.router = router;

const VueSet = Vue.set;
import axios from 'axios';
axios.defaults.baseURL='/api';
// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.use(Vuex)

const appAxios=axios.create({
  baseURL: '/api',
  timeout: 10000,
  headers: {
    // 'X-Custom-Header': 'foobar'
  },
  withCredentials: true
})

Vue.prototype.appAxios = appAxios;
Vue.prototype.axios = axios

// get 请求的 API 列表
import getAPIMsg from './getAPIMsg'
// post 请求的 API 列表
import postAPIMsg from './postAPIMsg'

// 从 get 的 api 的列表中找 name 字段匹配的 url
// function getUrlFind(args) {
//   let _node = getAPIMsg;
//   args.forEach((v, i, arr) => {
//     if (_node == undefined) {
//       return ''
//     }
//     _node =_node[v];
//   },this)
//   return _node === undefined ? '' : _node;
// }
// 从 post 的 api 的列表中找 name 字段匹配的 url
// function postUrlFind(args) {
//   let _node = postAPIMsg;
//   args.forEach((v, i, arr) => {
//     if (_node == undefined) {
//       return ''
//     }
//     _node = _node[v]
//   },this);
//   return _node === undefined ? '' : _node
// }

function getUrlFind(name) {
  var _key = getAPIMsg.find((v, i, arr) => (v.name == name));
  return _key.url;

  var _key = getAPIMsg.find((v, i, arr) => (v.name == name));
  return getAPIMsg[_key].url;

  var _value = getAPIMsg.find((v, i, arr) => (v.name == name));
  return _value.url;
}
function postUrlFind(name) {
  var _key = postAPIMsg.find((v, i, arr) => (v.name == name));
  return _key.url;

  var _key = postAPIMsg.find((v, i, arr) => (v.name == name));
  return postAPIMsg[_key].url;

  var _value = postAPIMsg.find((v, i, arr) => (v.name == name));
  return _value.url;
}

const store = new Vuex.Store({
  state:{},
  getters:{},
  mutations:{
    // 响应式修改数据
    changeState(state, msg) {
      let name = msg.name
      let val = msg.msg.data
      VueSet(state, name, val)
    }
  },
  actions:{
    // 登陆成功 LogIn 页面相关
    async logInSuccesful (store, msg) {
      console.log(msg);
      let userData = msg.data;
      store.state.user = msg;
      store.state.user.logInState = true
      Vue.set(store.state.user, 'msg', userData);
      localStorage.loginInfo = JSON.stringify(store.state.user)
    },
    async postRequest (store, msg) {
      // 处理 post 搜索请求的分发，专供页面数据处理
      let postState = msg.params.state;
      let requestDataProcessingFunction = null;
      switch (postState) {
        case '搜索条件有效':
        case '普通请求有效':
        case undefined: {
          // 判断是个什么操作请求
        }
        case '其他请求':
          requestDataProcessingFunction = 'search'
          break;
      }
      // 请求响应数据
      let data = await store.dispatch('myappPostAxios',msg);
      let data2 = await store.dispatch(requestDataProcessingFunction,{
        data,
        msg
      })
      return data2
    },
    async myappPostAxios (store, msg) {
      let time = 10;

      // 获取搜索的地址
      let pathName = msg.pathName;
      // 请求所需参数
      let urlMsg = postUrlFind(pathName);
      let url = urlMsg.url;
      let filterRequestFun = urlMsg.filterRequestFun;
      let params = filterRequestFun(msg);
      let data = await appAxios.post(url, {
        ...params
      })
      console.log(data, '-------请求获得数据')
      // 将搜索的请求参数，和返回数据一起返回给下一个函数处理。
      return {
        data,
        urlMsg
      }
    },
    async postRequestAllowError ({
      commit,
      state
    } , msg) {
      let allowerrowTime = 5;
      let name = msg.name;
      let params = msg.params;
      console.log(` 正在进行 ${name} 的 post 请求...`);
      let url = postUrlFind(name);
      console.log(url);
      while (allowerrowTime--){
        try {
          var _v= await axios.post(url, params)
          console.log(` 正在进行 ${name} 的 post 请求...`);
          break
        } catch (error) {
          console.log(e, ` ${name} 的 post 请求失败,剩余允许次数 ${allowErrorTime} ... `)
        }
      }
      commit('changeState', {
        name,
        msg: _v
      })
    },
    async getRequestAllowError({
      commit,
      state
    }, msg) {
      let allowerrowTime = 5;
      let name = msg.name;
      let params = msg.params;
      console.log(` 正在进行 ${name} 的 get 请求...`);
      let url = getUrlFind(name);
      console.log(url);
      while (allowerrowTime--) {
        try {
          var _v = await axios.get(url, params)
          console.log(` 正在进行 ${name} 的 get 请求...`);
          break
        } catch (error) {
          console.log(e, ` ${name} 的 get 请求失败,剩余允许次数 ${allowErrorTime} ... `)
        }
      }
      commit('changeState', {
        name,
        msg: _v
      })
    }
  }
})

window.store = store
export default store