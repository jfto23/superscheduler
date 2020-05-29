<template>
  <div id="app">
    <ScheduleForm>
    </ScheduleForm>
  </div>
</template>

<script>
import ScheduleForm from './components/ScheduleForm.vue'

export default {
  name: 'App',
  components: {
    ScheduleForm
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin-top: 60px;
}

body {
	background-color: #2e3440; 
	color: white;

}
</style>
