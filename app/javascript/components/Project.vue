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
      <form class='ui form'>
        <div class='field'>
          <div class='ui fluid right labeled action input'>
            <label class="ui label">+</label>
            <input v-model.trim="newTaskTitle" type='text' placeholder='Start typing here to create a task...'>
            <button @click="handleCreateTask" type="button" class='ui green button'>Add Task</button>
          </div>
        </div>
      </form>
      <div class='ui divided items'>
        <task v-for="task in project.tasks" :key="task.id" :task="task" />
      </div>
    </div>
  </div>
</template>

<script>
import normalize from 'json-api-normalize';

import { updateProject, createTask } from 'api';
import Task from 'components/Task'

export default {
  data: () => ({
    editMode: false,
    newTaskTitle: '',
    newProjectTitle: ''
  }),
  created () {
    this.newProjectTitle = this.project.title;
  },
  props: ['project', 'handleDeleteProject'],
  components: {
    Task
  },
  methods: {
    handleToggleEdit() {
      this.editMode = !this.editMode;
    },
    handleUpdate() {
      updateProject(this.project.id, this.newProjectTitle);
      this.editMode = false;
      this.project.title = this.newProjectTitle;
    },
    handleCreateTask() {
      if (this.newTaskTitle === '') return;

      createTask(this.project.id, this.newTaskTitle).then(resp => {
        const newTask = normalize(resp.data).get(['id', 'content']);
        const tasks = this.project.tasks || [];

        this.project.tasks = [...tasks, newTask];
        this.newTaskTitle = '';
      });
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
