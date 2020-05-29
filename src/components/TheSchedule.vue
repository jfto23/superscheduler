<template>
  <div class=schedule>
		<table @mousedown="dragToggleOn" @mouseup="dragToggleOff">
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
					<td v-if="(time_index-1) % 4 === 0" rowspan="4">
						{{ 8 +((time_index-1) / 4)}}</td>
					<td 
						v-for="(day, day_index) in week"
						:key="day_index">
						<ScheduleSlot :dragToggle=dragToggle></ScheduleSlot>	
					</td>
				</tr>

			</tbody>
		</table>

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
			dragToggle: false,
		}

	},


	methods: {
		dragToggleOn: function() {
			this.dragToggle = true;
		},

		dragToggleOff: function() {
			this.dragToggle = false;
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

table, th, td {
	border: 1px solid white;
}

table {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
		user-select: none;
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
