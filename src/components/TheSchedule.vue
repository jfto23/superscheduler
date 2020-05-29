<template>
  <div class=schedule>
		<table @mousedown.left="addToggleOn" @mouseup.left="addToggleOff"
		@mousedown.right="removeToggleOn" @mouseup.right="removeToggleOff"
		@contextmenu.prevent>
			<thead>
				<tr>
					<th></th>
					<th v-for="(day, day_index) in week" :key="day_index">
						{{ day }}
					</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="time_index in 40" :key="time_index">
					<td class=hour v-if="(time_index-1) % 4 === 0" rowspan="4">
						{{ 8 +((time_index-1) / 4)}}h</td>
					<td 
						v-for="(day, day_index) in week"
						:key="day_index">
						<ScheduleSlot :addToggle=addToggle :removeToggle=removeToggle></ScheduleSlot>	
					</td>
				</tr>

			</tbody>
		</table>
		{{ addToggle }}
		{{ removeToggle }}
  </div>
</template>

<script>
import ScheduleSlot from './ScheduleSlot.vue'
export default {
  name: 'TheSchedule',
	components: {
		ScheduleSlot,
	},

	data() {
		return {
			week: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
			times: [8,9,11,12,13,14,15,16,17],
			addToggle: false,
			removeToggle: false,
		}

	},


	methods: {
		addToggleOn: function() {
			this.addToggle = true;
		},

		addToggleOff: function() {
			this.addToggle = false;
		},

		removeToggleOn: function() {
			this.removeToggle = true;
		},

		removeToggleOff: function() {
			this.removeToggle = false;
		},

	}

	
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.schedule {
	margin: auto;
	width: 50%;
}

table, td, th {
	border: 1px solid #4C566A;
}


table {
		table-layout: fixed;
		width: 100%;
		border-collapse: collapse;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
		user-select: none;
}
td{
	width: 25%;
}

.hour {
	width: 10%;
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
