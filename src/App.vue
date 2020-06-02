<template>
  <div id="app" :class="theme">
		<div class=theme-selector>
			<select v-model="theme">
				<option>nord</option>
				<option>light</option>
				<option>dark</option>
			</select>
		</div>
    <ScheduleForm>
    </ScheduleForm>
  </div>
</template>

<script>
import ScheduleForm from './components/ScheduleForm.vue'

export default {
  name: 'App',

  components: {
    ScheduleForm
  },

	data() {
		return {
			theme: "nord"
		}
	},

	watch: {
		theme: function() {
			localStorage["theme"] = this.theme;
		}
	},

	mounted() {
		if (localStorage.getItem("theme")) {
			this.theme = localStorage.getItem("theme");
		}
	},


	


}
</script>

<style>
.light {
	--main-color: #f5f5f5;
	--card-color: #f5f5f5;
	--input-color: #f5f5f5;
	--table-color: #f5f5f5;
	--btn-font-color: gray;
	--font-color: black;
	--off-color: #d6d6d6;
	--border-color: #bababa;
}

.nord {
	--main-color: #2e3440;
	--card-color: #2e3440;
	--input-color: #2e3440;
	--table-color: #2e3440;
	--btn-font-color: #4c566a;
	--font-color: #eceff4;
	--off-color: #4c566a;
	--border-color: #3b4252;
}

.dark {
	--main-color: #303030;
	--card-color: #303030;
	--input-color: #303030;
	--table-color: #212121;
	--btn-font-color: gray;
	--font-color: #e8e6e3;
	--off-color: #424242;
	--border-color: #303030;
}

select {
	margin: 15px;
	background-color: var(--main-color);
	border: none;
	box-shadow: 2px 2px 5px 1px #14161c;
	color: var(--font-color);
	font-size: 1.10rem;
	border-radius: 5px;
	padding: 5px;
	-moz-appearance: none;
}

a {
	margin: 15px;
	background-color: var(--main-color);
	border: none;
	box-shadow: 2px 2px 5px 1px #14161c;
	color: var(--font-color);
	font-size: 1.10rem;
	border-radius: 5px;
	padding: 5px;
	text-decoration: none;
}



#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
	background-color: var(--main-color);
	color: var(--font-color);
	min-height: 100vh;
	overflow: auto;
}

.theme-selector {
	position: absolute;
	top:0;
	right:0;
	z-index: 100;

}
body {
	margin: 0px;
}


</style>
