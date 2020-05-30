<template>
  <div>
		<div class=schedule-form>
			<input @keyup.enter="addCourse" type="text" v-model="newCourse"> 
			<button @click="addCourse">Add</button>
			<br>
			<ul>
				<li v-for="(course,index) in courses" :key="index">
					<ScheduleCourse :course=courses[index]>
					</ScheduleCourse>
					<button class=course-btn @click="removeCourse(index)">Remove</button>
					<button class=course-btn @click="selectCourse(index)">Select</button>
				</li>
			</ul>
			{{ selectedCourse.name }}
			<br>
		</div>
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
.schedule-form {
	width: 40%;
	float: right;
	text-align: left;
	margin: 5%;

}

input {
	background-color: #3b4252;
	border: none;
	padding: 8px;
	border-radius: 8px;
	color: white;
	font-size: 1.25rem;
}

button {
	background-color:#2e3440;
	border: none;
	color: white;
	font-size: 1rem;
}

.course-btn {
	float: right;

}

input:focus{
	outline: none;

}
li {
	font-size: 1.5rem;
	border: 2px solid #3b4252;
	padding: 10px;
	overflow: hidden;
	width: 40%;
	border-radius: 10px;
	margin: 2px;

}
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
