webpackJsonp([14],{amt3:function(t,s,i){"use strict";Object.defineProperty(s,"__esModule",{value:!0});var e=i("Dd8w"),a=i.n(e),c={data:function(){return{}},methods:{follow:function(t){t.subscribed=!t.subscribed},getMsgList:function(){try{this.$store.dispatch("getRequestAllowError",{name:"subscribed"})}catch(t){}}},mounted:function(){this.getMsgList()},computed:{taglist:function(){try{return a()({},this.$store.state.subscribed.data)}catch(t){}}}},n={render:function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("ul",{staticClass:"subscribed"},t._l(t.taglist,function(s){return i("li",{key:s.id},[i("div",{staticClass:"subscribed-tag"},[i("div",{staticClass:"info-box"},[i("a",{staticClass:"subscribed-a",attrs:{href:""}},[i("div",{staticClass:"img",style:{backgroundImage:"url("+s.icon+")"}}),t._v(" "),i("div",{staticClass:"title"},[t._v(t._s(s.title))])]),t._v(" "),i("div",{staticClass:"meta-box"},[i("div",{staticClass:"guanzhu"},[t._v(t._s(s.follows)+" 关注")]),t._v(" "),i("div",{staticClass:"wenzhang"},[t._v(t._s(s.articles)+" 文章")])])]),t._v(" "),i("div",{staticClass:"button-box"},[i("button",{class:{"subscribed-but":!0,subscribed:s.subscribed},on:{click:function(i){t.follow(s)}}},[t._v(t._s(s.subscribed?"已关注":"关注"))])])])])}))},staticRenderFns:[]};var u=i("VU/8")(c,n,!1,function(t){i("jXVo")},null,null);s.default=u.exports},jXVo:function(t,s){}});