<template>
  <div>
		<input @keyup.enter="addCourse" type="text" v-model="newCourse"> 
		<button @click="addCourse"> Add course</button>
		<br>
		Here is the list of courses
		<ul>
			<li v-for="(course,index) in courses" :key="index">
				<ScheduleCourse :course=courses[index]>
				</ScheduleCourse>
				<button @click="removeCourse(index)"> Remove</button>
				<button @click="selectCourse(index)"> Select</button>
			</li>
		</ul>
		CURRENTLY SELCTED{{ selectedCourse.name }}
		<br>
		<TheSchedule :selectedCourse=selectedCourse :courses=courses></TheSchedule>
  </div>
</template>

<script>
import ScheduleCourse from './ScheduleCourse.vue';
import TheSchedule from './TheSchedule.vue';
export default {
  name: 'ScheduleForm',

	components: {
		ScheduleCourse,
		TheSchedule
	},

	data() {
		return {
		courses: [],
		newCourse: null,
		selectedCourse: {
			name: null,
			},
		}
	},


	methods: {
		addCourse: function() {
			if (this.newCourse) {
				this.courses.push({
					name: this.newCourse,
				});
				this.newCourse = null;
			}
		},

		removeCourse: function(index) {
			if (this.selectedCourse === this.courses[index]) {
				this.selectedCourse = { name: null };
			}
			this.courses.splice(index,1);
		},

		selectCourse: function(index) {
			this.selectedCourse = this.courses[index];
		}

	},
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
