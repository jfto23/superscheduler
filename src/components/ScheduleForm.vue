<template>
  <div class=main-container>
		<div class=schedule-form>
			<input autofocus @keyup.enter="addCourse" type="text" v-model="newCourse"> 
			<button class=add-btn @click="addCourse">ADD</button>
			<br>
			<ul>
				<li v-for="(course,index) in courses" :key="index" :class=" {
				'selected': index===selectedIndex}" @dblclick="selectCourse(index)">
					<ScheduleCourse :course=courses[index]>
					</ScheduleCourse>
					<button class=course-btn @click="removeCourse(index)">REMOVE</button>
					<button class=course-btn @click="selectCourse(index)">SELECT</button>
					<span :class="{'active0': index===0, 
					'active1':index===1, 
					'active2':index===2, 
					'active3':index===3, 
					'active4':index===4, 
					'active5':index===5, 
					'active6':index===6, 
					'active7':index===7, 
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
			if (this.newCourse && this.courses.length <8) {
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
.main-container {
	display: grid;
	grid-template-columns: 2fr 1fr;
}

.schedule-form {
	grid-column: 2/3;
	margin-top: 20%;
	justify-self:center;

}

input {
	-webkit-appearance: none;
	border: none;
	padding: 8px;
	color: var(--font-color);
	font-size: 1.25rem;
	width: 300px;
	border-radius: 3px;
	background: var(--input-color);
	box-shadow: 2px 2px 5px 1px #14161c;
}

button {
	background-color: var(--main-color);
	border: none;
	color: var(--btn-font-color);
	font-size: 1rem;
	margin: 3px;
}

button:hover {
	color: var(--font-color);
}

.course-btn {
	float: right;
	background-color: var(--card-color);
}

input:focus{
	outline: none;

}
li {
	background-color: var(--card-color);
	font-size: 1.5rem;
	padding: 10px;
	width: 300px;
	border-radius: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	box-shadow: 2px 2px 5px 1px #14161c;
	-webkit-touch-callout: none;
	-webkit-user-select: none; 
	-khtml-user-select: none; 
	-moz-user-select: none; 
	-ms-user-select: none; 
	user-select: none;

}

ul > li:first-child {
	margin-top: 20px;

}

.selected {
	border: 3px solid var(--border-color);
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
.active5 {
	color: #8fbcbb;
}
.active6 {
	color: #5e81ac;
}
.active7 {
	color: #81a1c1;
}

ul {
  list-style-type: none;
  padding: 0;
}

.add-btn {
	margin: 10px;

}
</style>
