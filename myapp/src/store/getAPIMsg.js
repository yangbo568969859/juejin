const baseurl = 'localhost:18080';
const getAPIMsg = [
  {
    // post请求
    name: 'login',
    url: '/login'
  },
  {
    // 所有标签请求
    name: 'subscribe',
    url: '/subscribe'
  },
  {
    // 关注标签请求
    name: 'subscribed',
    url: '/subscribed'
  },
  {
    // 活动列表请求
    name: 'eventslist',
    url: '/eventslist'
  },
  {
    // 城市列表请求
    name: 'citylist',
    url: '/citylist'
  },
  {
    // git库列表请求
    name: 'customrepos',
    url: '/customrepos'
  },
  {
    // 订阅列表请求
    name: 'subscribecode',
    url: '/subscribecode'
  },
  {
    // banner列表请求
    name: 'bannerlist',
    url: '/bannerlist'
  },
  {
    // getusermessage列表请求
    name: 'getusermessage',
    url: '/getusermessage'
  },
  {
    // recommendlist列表请求
    name: 'recommendlist',
    url: '/recommendlist'
  }
];

export default getAPIMsg
