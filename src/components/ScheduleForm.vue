<template>
  <div>
		<div class=schedule-form>
			<input @keyup.enter="addCourse" type="text" v-model="newCourse"> 
			<button @click="addCourse">Add</button>
			<br>
			<ul>
				<li v-for="(course,index) in courses" :key="index" :class=" {
				'selected': index===selectedIndex}" @dblclick="selectCourse(index)">
					<ScheduleCourse :course=courses[index]>
					</ScheduleCourse>
					<button class=course-btn @click="removeCourse(index)">Remove</button>
					<button class=course-btn @click="selectCourse(index)">Select</button>
					<span :class="{'active0': index===0, 
					'active1':index===1, 
					'active2':index===2, 
					'active3':index===3, 
					'active4':index===4, 
						}">&#9632;</span>
				</li>
			</ul>
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
		selectedIndex: null,
		}
	},


	methods: {
		addCourse: function() {
			if (this.newCourse) {
				this.courses.push({
					name: this.newCourse,
				});
				this.selectCourse(this.courses.length-1);
				this.newCourse = null;
			}
		},

		removeCourse: function(index) {
			if (this.selectedCourse === this.courses[index]) {
				this.selectedCourse = { name: null };
				this.selectedIndex = null;
			}
			this.courses.splice(index,1);
		},

		selectCourse: function(index) {
			this.selectedCourse = this.courses[index];
			this.selectedIndex = index;
		},


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
	border-bottom: 4px solid #3b4252;
	color: white;
	font-size: 1rem;
	margin: 3px;
}

button:hover {
	border-bottom: 4px solid white;
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

.selected {
	border: 2px solid #8fbcbb;
}

.active0 {
	color: #b48ead;
}

.active1 {
	color: #a3be8c;
}
.active2 {
	color: #ebcb8b;
}
.active3 {
	color: #d08770;
}
.active4 {
	color: #bf616a;
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
