import axios from 'axios'

const setupCSRFToken = () => {
  const csrfToken = document.querySelector("meta[name=csrf-token]").content;
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
};

export default setupCSRFToken;
