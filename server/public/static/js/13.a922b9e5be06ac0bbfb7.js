webpackJsonp([13],{"01gH":function(t,e){},"hZ/X":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o={name:"recommend",data:function(){return{imgUrl:"",showImgShow:!1,authorDetailsShow:!1,bottom:!1,beers:[]}},components:{},methods:{showImg:function(t){console.log(t),this.imgUrl=t,this.showImgShow=!this.showImgShow},readAll:function(t){t.checked=!t.checked},toggleShow:function(t){this.authorDetailsShow=t||!1},bottomVisible:function(){var t=window.scrollY,e=document.documentElement.clientHeight,n=document.documentElement.scrollHeight;return e+t>=n-400||n-400<e},addBeer:function(){var t=this;try{this.$store.dispatch("getRequestAllowError",{name:"recommendlist",params:""}).then(function(){t.$store.state.recommendlist.data.forEach(function(e){e.checked=!1,t.beers.push(e)})})}catch(t){}}},watch:{bottom:function(t){t&&this.addBeer()}},created:function(){var t=this;window.addEventListener("scroll",function(){t.bottom=t.bottomVisible()}),this.addBeer()},computed:{}},s={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("ul",{staticClass:"one-recommend"},t._l(t.beers,function(e,o){return n("li",{key:o},[n("div",{staticClass:"one-recommend-box"},[n("div",{staticClass:"one-recommend-box-title"},[n("span",[t._v("\n            "+t._s(e.action_text_tpl)+"\n            "),n("span",{staticClass:"one-recommend-orange"},[t._v(t._s(e.actors_name))])])]),t._v(" "),n("div",{staticClass:"one-recommend-box-author"},[n("span",{staticClass:"author-img"},[n("img",{attrs:{src:e.author_avatar_url,alt:""}})]),t._v(" "),n("div",{staticClass:"author-title"},[n("div",[n("span",{staticClass:"author-name",on:{mouseover:function(n){t.toggleShow(e.author_url)},mouseout:function(n){t.toggleShow(e.id)}}},[t._v(t._s(e.author_name))])]),t._v(" "),t.authorDetailsShow==e.id?n("div",{staticClass:"author-details"}):t._e(),t._v(" "),n("div",{staticClass:"author-nichneg"},[n("span",[t._v(t._s(e.author_headline))])])])]),t._v(" "),n("div",{staticClass:"one-recommend-box-content"},[n("div",{staticClass:"one-content-box"},[n("div",{staticClass:"one-content-cont"},[n("div",{staticClass:"one-content-title"},[n("a",{attrs:{href:""}},[t._v(t._s(e.title))])]),t._v(" "),e.checked?n("div",{staticClass:"one-content-zantong"},[n("span",[t._v("13 人赞同了该回答")])]):t._e(),t._v(" "),n("div",{staticClass:"one-content-neirong"},[0==e.checked?n("span",[t._v(t._s(e.excerpt_new))]):t._e(),t._v(" "),0==e.checked?n("a",{on:{click:function(n){t.readAll(e)}}},[t._v("阅读全文 "),n("i",{staticClass:"iconfont icon-xiangxiajiantou"})]):t._e()]),t._v(" "),n("div",{staticClass:"one-content-neirong2"},[1==e.checked?n("span",[t._v(t._s(e.content))]):t._e()]),t._v(" "),e.checked?n("div",{staticClass:"one-content-time"},[n("span",[t._v("发布于 06:22")])]):t._e()]),t._v(" "),n("div",{staticClass:"one-content-img",on:{click:function(n){t.showImg(e.thumbnail)}}},[n("img",{attrs:{src:e.thumbnail,alt:""}})])])]),t._v(" "),n("div",{staticClass:"one-recommend-box-share"},[n("span",[t._v(t._s(e.comment_count))]),t._v(" "),n("div",[t._v("fenxiang1")]),t._v(" "),n("div",[t._v("点赞")]),t._v(" "),e.checked?n("div",{staticClass:"one-shouqi",on:{click:function(n){t.readAll(e)}}},[n("span",[t._v("收起")])]):t._e()])]),t._v(" "),t._m(0,!0)])})),t._v(" "),n("ShowImg",{attrs:{active:t.showImgShow,imgUrl:t.imgUrl},on:{toggle:t.showImg}})],1)},staticRenderFns:[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"on-close"},[e("i",{staticClass:"iconfont icon-cc-close-crude"})])}]};var i=n("VU/8")(o,s,!1,function(t){n("01gH")},null,null);e.default=i.exports}});