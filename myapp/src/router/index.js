import Vue from 'vue'
import Router from 'vue-router'

// 引入页面文件
// import home from '@/view/index'
const home = () => import ('@/view/index')
const one = () => import('@/view/one/index')
const recommend=()=>import('@/view/one/page/recommend')
const frontend = () => import('@/view/one/page/frontend')
const backend = () => import('@/view/one/page/backend')

const two =()=> import('@/view/two/index')

const three =()=> import('@/view/three/index')

// 我的路由
const myadmin = () => import('@/view/myadmin/index')
const activities = () => import('@/view/myadmin/children/activities')
const answer = () => import('@/view/myadmin/children/answer')
const articles = () => import('@/view/myadmin/children/articles')
const likes = () => import('@/view/myadmin/children/likes')
const shares = () => import('@/view/myadmin/children/shares')
const following = () => import('@/view/myadmin/children/following')
const follows = () => import('@/view/myadmin/children/following/follows')
const tags = () => import('@/view/myadmin/children/following/tags')
const collections = () => import('@/view/myadmin/children/collections')

// 设置路由
const settings = () => import('@/view/settings/index')
const profile = () => import('@/view/settings/children/profile')
const account = () => import('@/view/settings/children/account')
const password = () => import('@/view/settings/children/password')
const mail = () => import('@/view/settings/children/mail')

// 标签路由
const subscribe = () => import('@/view/subscribe/index')
const subscribed = () => import('@/view/subscribe/children/subscribed')
const alltags = () => import('@/view/subscribe/children/alltags')

// 分享路由
const newshare = () => import('@/view/newshare/index')

// 指导页路由
const guidelines = () => import('@/view/guidelines/index')

// 重置密码路由
const resetPassword = () => import('@/view/resetpassword/index')

// 上传组件
const upload = () => import('@/components/drogupload/DrogUpload')

// 编辑写文章页面
const edit =()=>import('@/view/edit/index')

// 测试页面
const test = () => import('@/view/test/index')

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: '/',
  linkActiveClass: 'youAreInHere',
  linkExactActiveClass: 'youAreInHereExact',
  routes: [
    {
      path: '/',
      component: home,
      children: [
        {
          path: '',
          redirect: '/one'
        },
        {
          path: '/one',
          component: one,
          children:[
            {
              path: '',
              component: recommend,
            },
            {
              path: 'recommend',
              name:'recommend',
              component: recommend,
            },
            {
              path: 'frontend',
              name:'frontend',
              component: frontend,
            },
            {
              path: 'backend',
              name: 'backend',
              component: backend,
            }
          ]
        },
        {
          path: '/two',
          component: two,
          name: 'two',
        },
        {
          path: '/three',
          component: three,
          name: 'three',
        },
        {
          path: '/myadmin',
          component: myadmin,
          children:[
            {
              path: '',
              component: activities,
            },
            {
              path: 'activities',
              component: activities,
              name:'activities'
            },
            {
              path: 'shares',
              component: shares,
              name: 'shares'
            },
            {
              path: 'articles',
              component: articles,
              name: 'articles'
            },
            {
              path: 'likes',
              component: likes,
              name: 'likes'
            },
            {
              path: 'answer',
              component: answer,
              name: 'answer'
            },
            {
              path: 'following',
              component: following,
              name: 'following'
            },
            {
              path: 'follows',
              component: follows,
              name: 'follows'
            },
            {
              path: 'tags',
              component: tags,
              name: 'tags'
            },
            {
              path: 'collections',
              component: collections,
              name: 'collections'
            }
          ]
        },
        {
          path: '/settings',
          component: settings,
          children:[
            {
              path: '',
              component: profile,
            },
            {
              path: 'profile',
              component: profile,
              name:'profile'
            },
            {
              path: 'account',
              component: account,
              name: 'account'
            },
            {
              path: 'password',
              component: password,
              name: 'password'
            },
            {
              path: 'mail',
              component: mail,
              name: 'mail'
            }
          ]
        },
        {
          path: '/subscribe',
          component: subscribe,
          children:[
            {
              path: '',
              component: subscribed,
            },
            {
              path: 'subscribed',
              component: subscribed,
              name: 'subscribed',
            },
            {
              path: 'alltags',
              component: alltags,
              name: 'alltags',
            }
          ]
        },
        {
          path: '/newshare',
          component: newshare,
          name: 'newshare',
        },
        {
          path: '/edit',
          component: edit,
          name: 'edit',
        }
      ]
    },
    {
      path: '/guidelines',
      component: guidelines,
      name: 'guidelines'
    },
    {
      path: '/reset-password',
      component: resetPassword,
      name: 'reset-password'
    },
    {
      path: '/upload',
      component: upload,
      name: 'upload'
    },
    {
      path: '/test',
      component: test,
      name: 'test'
    },
  ],
  scrollBehavior(to, from, savedPosition) {
    // console.log('scrollBehavior',savedPosition);
    // 这个功能只在支持 history.pushState 的浏览器中可用。
    // 当任意路由跳转后，DOM 完全更新后被调用。
    // 刷新不会触发点击路由按钮，因此也不会运行。
    // return 期望滚动到哪个的位置
    // return new Promise((resolve,reject)=>{
    //   setTimeout(() => {
    //     resolve({x : 0, y : 0})
    //   }, 500);
    // })
  }
})
