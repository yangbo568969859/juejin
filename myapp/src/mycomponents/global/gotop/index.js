import BackTop from './backtop/src/main';

/* ignore next */
BackTop.install = function (Vue) {
  Vue.component(BackTop.name, BackTop);
}

export default BackTop;
