import Vue from 'vue'
import App from '../App.vue'
import 'semantic-ui-css/semantic.css'
import setupCSRFToken from '../api/setupCSRFToken';

document.addEventListener('DOMContentLoaded', () => {
  setupCSRFToken();
  document.body.appendChild(document.createElement('app'))
  new Vue({
    render: h => h(App)
  }).$mount('app')
})
