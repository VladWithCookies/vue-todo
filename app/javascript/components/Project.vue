<template>
  <div class='ui fluid card mt-50'>
    <div class='content'>
      <div class='header pb-1'>
        <i class='ui icon calendar' />
        {{project.title}}
        <div class="right floated">
          <i class="ui icon pencil" />
          <i class="ui icon trash" />
        </div>
      </div>
      <task-form />
      <div class='ui divided items'>
        <task />
        <task />
        <task />
      </div>
    </div>
  </div>
</template>

<script>
import Task from 'components/Task'
import TaskForm from 'components/TaskForm'

export default {
  props: ['project'],
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
