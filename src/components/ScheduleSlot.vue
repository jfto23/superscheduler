<template>
  <div @mousedown="fillFirstSlot" @mouseover="fillSlot" :class="{ active2: filled }">
  </div>
</template>

<script>
export default {
  name: 'ScheduleSlot',

	props: {
		dragToggle: Boolean,
	},

	data() {
		return {
			filled: false,
		}


	},


	methods: {
		fillFirstSlot: function() {
			if (this.filled) {
				this.filled = false;
			}
			else {
				this.filled = true;
			}
		},
		fillSlot: function() {
			if (this.dragToggle) {
				this.filled = !this.filled;
			}
		},
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
.active6 {
	background-color: #3B4252;
}

div {
	height: 12px;
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
