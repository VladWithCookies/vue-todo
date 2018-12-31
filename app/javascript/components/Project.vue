<template>
  <div class='ui fluid card mt-50'>
    <div class='content'>
      <div class='header pb-1'>
        <i class='ui icon calendar' />
        <div v-if="editMode" class="ui transparent input">
          <input v-model="newProjectTitle" type="text" />
        </div>
        <span v-else>{{project.title}}</span>
        <div class="right floated">
          <template v-if="editMode">
            <i @click="handleUpdate" class="ui link icon check green" />
            <i @click="handleToggleEdit" class="ui link icon close red" />
          </template>
          <template v-else>
            <i @click="handleToggleEdit" class="ui link icon pencil" />
            <i @click="handleDeleteProject(project.id)" class="ui link icon trash" />
          </template>
        </div>
      </div>
      <task-form />
      <div class='ui divided items'>
        <task v-for="task in project.tasks" :key="task.id" :task="task" />
      </div>
    </div>
  </div>
</template>

<script>
import { updateProject } from 'api';
import Task from 'components/Task'
import TaskForm from 'components/TaskForm'

export default {
  data: () => ({
    editMode: false,
    newProjectTitle: ''
  }),
  created () {
    this.newProjectTitle = this.project.title;
  },
  props: ['project', 'handleDeleteProject'],
  components: {
    Task,
    TaskForm,
  },
  methods: {
    handleToggleEdit() {
      this.editMode = !this.editMode;
    },
    handleUpdate() {
      updateProject(this.project.id, this.newProjectTitle);
      this.editMode = false;
      this.project.title = this.newProjectTitle;
    }
  }
}
</script>

<style>
  .pb-1 {
    padding-bottom: 1rem;
  }
  .mt-50 {
    margin-top: 50px !important;
  }
</style>
