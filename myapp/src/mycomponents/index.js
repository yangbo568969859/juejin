import BackTop from '@/mycomponents/global/gotop/src/main'

const components = [
  BackTop
]

const install = (Vue, OPTs) => {
  if (install.installed) {
    return
  }
  components.map(component => {
    Vue.component(component.name, component)
  })
}

export default {
  version: '0.0.1',
  author: 'YangSir',
  install,
  BackTop
}
