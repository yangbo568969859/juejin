<template>
  <div v-if="active" class="bouncing-loader">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
  </div>
</template>
<script>
export default {
  name:'Loading',
  props:['active'],
  data() {
    return {

    }
  },
  methods:{

  }
}
</script>
<style>
@keyframes bouncing-loader {
  from {
    opacity: 1;
    transform: translateY(0);
  }
  to {
    opacity: 0.1;
    transform: translateY(-1rem);
  }
}
.bouncing-loader {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}
.bouncing-loader > div {
  width: 7px;
  height: 7px;
  margin: 3rem 0.3rem;
  background: #0084ff;
  border-radius: 50%;
  animation: bouncing-loader 0.4s infinite alternate;
}
.bouncing-loader > div:nth-child(2) {
  animation-delay: 0.1s;
}
.bouncing-loader > div:nth-child(3) {
  animation-delay: 0.2s;
}
.bouncing-loader > div:nth-child(4) {
  animation-delay: 0.3s;
}
</style>
