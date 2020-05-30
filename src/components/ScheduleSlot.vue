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
	},

	data() {
		return {
			filled: false,
			courseIndex: null,
			course: { name: "" },
		}


	},

	watch: {
		courses: function() {
			if (this.courses.includes(this.course) && this.courseIndex >=
				this.courses.length) {
				this.courseIndex -= 1;
			}


		}

	},

	computed: {
		courseExists: function() {
			try {
				return this.courses.includes(this.course);
			}
			catch(err) {
				return false
			}

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
		},

		setCourse: function() {
			this.courseIndex = (this.courses.indexOf(this.selectedCourse));
			this.course = this.courses[this.courseIndex];
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
