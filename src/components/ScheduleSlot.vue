<template>
  <div @mousedown="fillFirstSlot" @mouseover="fillSlot" :class="{ active: filled }">
		.
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

.active {
	background-color: green;
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
