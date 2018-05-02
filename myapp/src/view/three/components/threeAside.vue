<template>
  <aside class="three-aside">
    <div class="three-tag" v-for="(v,key,i) in tags" :key="i">
      <a href="">{{v.title}}</a>
      <div class="three-tag-child">
        <a href="" v-for="(vv,ii) in v.tags" :key="ii">{{ii}}</a>
      </div>
      <div class="three-tag-child-child">
        <div class="three-tag" v-for="(vv,ii) in v.tags" :key="ii">
          <a href="">{{ii}}</a>
          <div class="three-tag-child">
            <a href="" v-for="(vvv,iii) in vv" :key="iii+'iii'">{{vvv.tags_name}}</a>
          </div>
        </div>
        <div class="three-tag three-tag-last" v-if="v.alltags!=''">
          <div class="three-tag-child">
            <a href="" v-for="(vv,ii) in v.alltags" :key="ii+'alltags'">{{vv}}</a>
          </div>
        </div>
      </div>
    </div>
  </aside>
</template>
<script>
export default {
  data() {
    return {
      tags:[
        {
          title:'前端',
          tags:{
            JavaScript:[
              {
                tags_name:'开发框架'
              },
              {
                tags_name:'UI组件'
              },
              {
                tags_name:'VUE'
              },
              {
                tags_name:'React'
              }
            ],
            CSS:[
              {
                tags_name:'开发框架',
              },
              {
                tags_name:'UI组件',
              }
            ],
            HTML:[
              {
                tags_name:'HTML5',
              },
              {
                tags_name:'语义化标签',
              }
            ]
          },
          alltags:[]
        },
        {
          title:'Python',
          tags:{
            '初级学习':[
              {
                tags_name:'web学习'
              },
              {
                tags_name:'科学计算'
              },
              {
                tags_name:'计算'
              },
              {
                tags_name:'React'
              }
            ],
            '深入学习':[
              {
                tags_name:'开发框架',
              },
              {
                tags_name:'UI组件',
              }
            ],
            '进阶学习':[
              {
                tags_name:'HTML5',
              },
              {
                tags_name:'语义化标签',
              }
            ]
          },
          alltags:['html5', 'css3', 'javascript']
        }
      ]
    }
  }
}
</script>

