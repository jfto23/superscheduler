<template>
  <div>
		<div class=schedule-form>
			<input @keyup.enter="addCourse" type="text" v-model="newCourse"> 
			<button class=add-btn @click="addCourse">Add</button>
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
			courseId: null,
			},
		selectedIndex: null,
		}
	},


	methods: {
		addCourse: function() {
			if (this.newCourse) {
				this.courses.push({
					name: this.newCourse,
					courseId: Date.now(),
				});
				this.selectCourse(this.courses.length-1);
				this.newCourse = null;
				this.saveCourses();
			}
		},

		removeCourse: function(index) {
			if (this.selectedCourse === this.courses[index]) {
				this.selectedCourse = { name: null, courseId: null };
				this.selectedIndex = null;
			}
			this.courses.splice(index,1);
			this.saveCourses();
		},

		selectCourse: function(index) {
			this.selectedCourse = this.courses[index];
			this.selectedIndex = index;
		},

		saveCourses: function() {
			const parsed = JSON.stringify(this.courses);
			localStorage.setItem("courses", parsed);

		}


	},

	mounted() {
		if (localStorage.getItem("courses")) {
			try {
				this.courses = JSON.parse(localStorage.getItem("courses"));
			}
			catch(e) {
				localStorage.removeItem("courses");
			}

		}

	}
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
	border: none;
	padding: 8px;
	color: white;
	font-size: 1.25rem;
	width: 50%;
	border-radius: 3px;
	background: #2e3440;
	box-shadow: 2px 2px 5px 1px #14161c;
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
	padding: 10px;
	overflow: hidden;
	width: 40%;
	border-radius: 10px;
	margin: 10px;
	box-shadow: 2px 2px 5px 1px #14161c;

}

.selected {
	border: 4px solid #3b4252;
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

.add-btn {
	margin: 10px;

}
a {
  color: #42b983;
}
</style>
