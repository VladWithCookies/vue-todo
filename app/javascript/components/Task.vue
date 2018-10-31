<template>
  <div class='item'>
    <div class='ui fitted checkbox'>
      <input type='checkbox' :checked="task.done">
      <label></label>
    </div>
    <div class='middle aligned content'>
      {{task.content}}
    </div>
    <div class='right floated'>
      <i class='ui icon pencil' />
      <i class='ui icon trash' />
    </div>
  </div>
</template>

<script>
export default {
  props: ['task'],
}
</script>

<style>
  .content {
    margin-left: 10px !important;
  }
</style>
