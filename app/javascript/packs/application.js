import Vue from 'vue'
import App from '../App.vue'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  new Vue({
    render: h => h(App)
  }).$mount('app')
})
