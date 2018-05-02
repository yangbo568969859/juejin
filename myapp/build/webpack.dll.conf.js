// webpack.dll.conf.js
const webpack = require('webpack');
const config = require('../config')
const AssetsPlugin = require('assets-webpack-plugin')
// 配置需要打包到dll中的模块
const vendors = [
  'vue/dist/vue.common.js',
  'vuex',
  'vue-router',
  'axios'
];
module.exports = {
  output: {
    path: __dirname + '/../static/dll',
    filename: '[name].[chunkhash].js',
    library: '[name]_[chunkhash]',
  },
  entry: {
    vendor: vendors,
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      },
      sourceMap: true
    }),
    new webpack.DllPlugin({
      path: __dirname + '/../static/dll/manifest.json', // manifest文件的输出路径,必须为绝对路径
      name: '[name]_[chunkhash]', // name是dll暴露的对象名，要跟output.library保持一致
      context: __dirname,
    }),
    // 把带hash的dll插入到html中
    new AssetsPlugin({
      filename: 'bundle-config.json',
      path: './'
    })
  ],
};
