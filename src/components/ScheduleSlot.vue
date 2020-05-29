<template>
  <div @mousedown.left="fillFirstSlot" @mouseover="fillSlot"
	@mousedown.right="unfillFirstSlot" :class="{ active2: filled }">
  </div>
</template>

<script>
export default {
  name: 'ScheduleSlot',

	props: {
		addToggle: Boolean,
		removeToggle: Boolean,
	},

	data() {
		return {
			filled: false,
		}


	},


	methods: {
		fillFirstSlot: function() {
			this.filled = true;
		},
		fillSlot: function() {
			if (this.addToggle) {
				this.filled = true;
			}

			else if (this.removeToggle) {
				this.filled = false;
			}
		},

		unfillFirstSlot: function() {
			this.filled = false;
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
