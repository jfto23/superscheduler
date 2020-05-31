<template>
  <div id="app" class="light-theme">
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
  },



}
</script>

<style>
.light-theme {
	--main-color: #f5f5f5;
	--font-color: black;
	--off-color: #d6d6d6;
	--border-color: #bababa;
}

.nord-theme {
	--main-color: #2e3440;
	--font-color: #eceff4;
	--off-color: #4c566a;
	--border-color: #3b4252;
}

.dark-theme {
	--main-color: #181a1b;
	--font-color: #e8e6e3;
	--off-color: #1c1e1f;
	--border-color: black;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
	background-color: var(--main-color);
	color: var(--font-color);
	min-height: 100vh;
	overflow: auto;
}
body {
	margin: 0px;
}


</style>
