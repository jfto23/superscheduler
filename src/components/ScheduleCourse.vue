<template>
  <div>
		{{ course.name }}
  </div>
</template>

<script>
export default {
  name: 'ScheduleCourse',

	props: {
		course: Object,
	}
	
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
