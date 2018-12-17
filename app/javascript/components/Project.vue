<template>
  <div class='ui fluid card mt-50'>
    <div class='content'>
      <div class='header pb-1'>
        <i class='ui icon calendar' />
        {{project.title}}
        <div class="right floated">
          <i class="ui link icon pencil" />
          <i @click="handleDeleteProject(project.id)" class="ui link icon trash" />
        </div>
      </div>
      <task-form />
      <div class='ui divided items'>
        <task v-for="task in project.tasks" :task="task" />
      </div>
    </div>
  </div>
</template>

<script>
import Task from 'components/Task'
import TaskForm from 'components/TaskForm'

export default {
  props: ['project', 'handleDeleteProject'],
  components: {
    Task,
    TaskForm,
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
