import Vue from 'vue'
import App from '../App.vue'
import 'semantic-ui-css/semantic.css'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  new Vue({
    render: h => h(App)
  }).$mount('app')
})
