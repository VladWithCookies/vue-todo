<template>
  <div>
    <div class='ui two column centered grid'>
      <div class='column'>
        <project
          v-for='project in projects'
          :key='project.id'
          :project='project'
        />
      </div>
    </div>
    <div class='add-btn fluid'>
      <button class='ui blue  button'>
        <i class='ui icon plus' />
        Add TODO list
      </button>
    </div>
  </div>
</template>

<script>
import normalize from 'json-api-normalize';
import { getProjects } from 'api';
import Project from 'components/Project'

export default {
  data: () => ({
    projects: [],
  }),
  created () {
    getProjects().then((resp) => {
      this.projects = normalize(resp.data).get(['title'])
    });
  },
  components: {
    Project,
  },
}
</script>

<style>
.add-btn {
  text-align: center;
  margin-top: 50px;
}
</style>
