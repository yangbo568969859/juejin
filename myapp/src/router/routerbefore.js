import store from '@/store'
// 引入路由对应的中文 name
import { routerMsg, secondrouterMsg} from '@/router/routerENNameToCHName.js'

export const getScrollAndChangeMeta = (to, from, next) => {

  // 当前要进入的 路由的 组件英文名
  let _name = to.name;
  console.log(_name);
  // 匹配中文的路由名
  let CNName = routerMsg[_name] || '未知路径';
  // 修改 document.title 中文名
  document.title = CNName;
  // 路由匹配路径的 来源
  let _matchRouter = to.matched;
  // console.log(_matchRouter);

  next();
}
