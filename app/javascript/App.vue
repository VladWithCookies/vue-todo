<template>
  <div>
    <div class='ui two column centered grid'>
      <div class='column'>
        <project />
        <project />
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
import Project from 'components/Project'

export default {
  components: {
    Project,
  }
}
</script>

<style>
.add-btn {
  text-align: center;
  margin-top: 50px;
}
</style>
