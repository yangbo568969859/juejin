webpackJsonp([24],{NIlh:function(t,s){},WpgI:function(t,s,i){"use strict";Object.defineProperty(s,"__esModule",{value:!0});var a={render:function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("div",{staticClass:"profile"},[i("div",{staticClass:"profile-view"},[i("h1",[t._v("修改密码")]),t._v(" "),i("ul",{staticClass:"profile-list"},[i("li"),t._v(" "),i("li",{staticClass:"item"},[i("span",{staticClass:"title"},[t._v("原密码")]),t._v(" "),i("div",{staticClass:"profile-input-box"},[i("input",{attrs:{type:"text",placeholder:"请输入原密码"}}),t._v(" "),i("div",{staticClass:"action-box"},[i("button",{staticClass:"edit-btn"},[i("span",{staticClass:"iconfont"}),t._v(" "),i("span",{on:{click:function(s){t.forgetPassword()}}},[t._v("忘记密码？")])])])])]),t._v(" "),t._m(0),t._v(" "),t._m(1)]),t._v(" "),i("button",{staticClass:"submit-btn",on:{click:function(s){t.confirmEdit()}}},[t._v("确认修改")])])])},staticRenderFns:[function(){var t=this.$createElement,s=this._self._c||t;return s("li",{staticClass:"item"},[s("span",{staticClass:"title"},[this._v("新密码")]),this._v(" "),s("div",{staticClass:"profile-input-box"},[s("input",{attrs:{type:"text",placeholder:"请输入新密码"}}),this._v(" "),s("div",{staticClass:"action-box"},[s("button",{staticClass:"edit-btn"},[s("span",{staticClass:"iconfont"}),this._v(" "),s("span")])])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("li",{staticClass:"item"},[s("span",{staticClass:"title"},[this._v("确认新密码")]),this._v(" "),s("div",{staticClass:"profile-input-box"},[s("input",{attrs:{type:"text",placeholder:"确认新密码"}}),this._v(" "),s("div",{staticClass:"action-box"},[s("button",{staticClass:"edit-btn"},[s("span",{staticClass:"iconfont"}),this._v(" "),s("span")])])])])}]};var n=i("VU/8")({data:function(){return{}},methods:{forgetPassword:function(){this.$router.push({name:"reset-password"})},confirmEdit:function(){}}},a,!1,function(t){i("NIlh")},null,null);s.default=n.exports}});