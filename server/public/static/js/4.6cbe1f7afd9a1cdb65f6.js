webpackJsonp([4],{"2vc3":function(t,i){},"H/K8":function(t,i,n){"use strict";Object.defineProperty(i,"__esModule",{value:!0});var e={render:function(){var t=this,i=t.$createElement,n=t._self._c||i;return n("main",{staticClass:"containter"},[n("div",{staticClass:"settings-box"},[n("nav",{staticClass:"settings-nav"},[n("ul",t._l(t.list,function(i,e){return n("li",{key:e,class:{active:t.navActive==i.path},on:{click:function(n){t.goChildren(i.path)}}},[n("span",[t._v(t._s(i.name))])])}))]),t._v(" "),n("div",{staticClass:"setting-view"},[n("div",{staticClass:"setting-view-box"},[n("transition",{attrs:{name:t.transitionName}},[n("router-view",{staticClass:"child-view"})],1)],1),t._v(" "),n("aside")])])])},staticRenderFns:[]};var s=n("VU/8")({data:function(){return{navActive:"profile",list:[{name:"个人资料",path:"profile"},{name:"账号关联",path:"account"},{name:"修改密码",path:"password"}],transitionName:"slide-right"}},methods:{goChildren:function(t){this.$router.push({name:t}),this.navActive=this.$route.name}},watch:{$route:function(t,i){var n=this.$router.isBack;this.transitionName=n?"slide-right":"slide-left",this.$router.isBack=!1}}},e,!1,function(t){n("2vc3"),n("rrJg"),n("sIRC")},null,null);i.default=s.exports},rrJg:function(t,i){},sIRC:function(t,i){}});