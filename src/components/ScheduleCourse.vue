<template>
  <div>
		{{ course.name }}
		{{ course.monday }}
		{{ course.tuesday }}
		{{ course.wednesday }}
		{{ course.thursday }}
		{{ course.friday }}
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
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
a {
  color: #42b983;
}
</style>
