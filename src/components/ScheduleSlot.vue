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
			colorIndex: null,
		}


	},



	methods: {
		fillFirstSlot: function() {
			this.filled = true;
			this.pickColor();
		},
		changeSlot: function() {
			if (this.addToggle) {
				this.filled = true;
				this.pickColor();
			}

			else if (this.removeToggle) {
				this.filled = false;
				this.pickColor();
			}


		},

		unfillFirstSlot: function() {
			this.filled = false;
		},

		pickColor: function() {
			this.colorIndex = (1 + this.courses.indexOf(this.selectedCourse));
		},

		applyColor: function() {

			return {
				'active1': this.filled && this.colorIndex===1,
				'active2': this.filled && this.colorIndex===2,
				'active3': this.filled && this.colorIndex===3,
				'active4': this.filled && this.colorIndex===4,
				'active5': this.filled && this.colorIndex===5,
				'active6': this.filled && this.colorIndex===6,

			}

		}

	}

	
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.active1 {
	background-color: #b48ead;
}

.active2 {
	background-color: #a3be8c;
}
.active3 {
	background-color: #ebcb8b;
}
.active4 {
	background-color: #d08770;
}
.active5 {
	background-color: #bf616a;
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
