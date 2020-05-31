<template>
  <div @mousedown.left="fillFirstSlot" @mouseover="changeSlot"
		@mousedown.right="unfillFirstSlot" :class="applyColor()">

  </div>
</template>

<script>
export default {
  name: 'ScheduleSlot',

	props: {
		addToggle: Boolean,
		removeToggle: Boolean,
		selectedCourse: null,
		courses: Array,
		id: String,
	},

	data() {
		return {
			filled: false ,
			courseIndex: null,
			course: { name: "", courseId: null},
		}


	},

	watch: {
		courses: function() {
			if (this.courseExists) {
				this.updateIndex();
			}
		},

		courseExists: function() {
			if (!this.courseExists) {
				this.course = { name: null, courseId: null };
				this.courseIndex = null;
				this.filled = false;
			}
		},

		filled: function() {
			if (!this.filled) {
				this.course = { name: null, courseId: null };
				this.courseIndex = null;
				this.saveData();
			}
		}


	},

	computed: {
		courseExists: function() {
				for (let course of this.courses) {
					try{
						if (course.courseId === this.course.courseId) {
							return true;
						}
					}
					catch(e) {
						return false;
					}

				}
				return false;

		},


	},


	methods: {
		fillFirstSlot: function() {
			this.filled = true;
			this.setCourse();
		},
		changeSlot: function() {
			if (this.addToggle) {
				this.filled = true;
				this.setCourse();
			}

			else if (this.removeToggle) {
				this.filled = false;
				this.setCourse();
			}
		},

		unfillFirstSlot: function() {
			this.filled = false;
			this.setCourse();
		},

		setCourse: function() {
			this.courseIndex = (this.courses.indexOf(this.selectedCourse));
			this.course = this.selectedCourse;
			this.saveData();
		},

		updateIndex: function() {
				for (let course of this.courses) {
						if (course.courseId === this.course.courseId) {
							this.courseIndex = this.courses.indexOf(course);
						}

				}
				this.saveData();
		},

		applyColor: function() {
			return {
				'active0': this.filled && this.courseIndex===0,
				'active1': this.filled && this.courseIndex===1,
				'active2': this.filled && this.courseIndex===2,
				'active3': this.filled && this.courseIndex===3,
				'active4': this.filled && this.courseIndex===4,
				'active5': this.filled && this.courseIndex===5,
				'removed': this.filled && !this.courseExists,

			}

		},

		saveData: function() {
			const parsedCourse = JSON.stringify(this.course);

			localStorage["courseIndex"+this.id] = this.courseIndex;
			localStorage.setItem("filled"+this.id, JSON.stringify(this.filled));
			localStorage.setItem("course"+this.id, parsedCourse);
		},

	},

	mounted() {
		if (localStorage.getItem("course"+this.id)) {
			this.filled = JSON.parse(localStorage.getItem("filled" + this.id));
			this.course = JSON.parse(localStorage.getItem("course"+ this.id));
			this.courseIndex = parseInt(localStorage["courseIndex" + this.id])
		}

	}

	
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.active0 {
	background-color: #b48ead;
}

.active1 {
	background-color: #a3be8c;
}
.active2 {
	background-color: #ebcb8b;
}
.active3 {
	background-color: #d08770;
}
.active4 {
	background-color: #bf616a;
}

.removed {
	background-color: initial;

}

div {
	height: 15px;
}
</style>
