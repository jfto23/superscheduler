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
						:key="day_index"
						>
						<ScheduleSlot :id="''+day_index+time_index" :courses=courses :selectedCourse=selectedCourse :addToggle=addToggle :removeToggle=removeToggle></ScheduleSlot>	
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

	props: {
		selectedCourse: Object,
		courses: Array,
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
	width: 40%;
	margin-top: 5%;
	margin-left: 10%;
}

table, td, th {
	border: 1px solid var(--border-color);
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
		box-shadow: 2px 2px 5px 1px #14161c;
		background-color: var(--table-color);
}
td {
	width: 25%;
}
th {
	font-size: 1vw;
}

.hour {
	width: 10%;
}

tr:nth-child(even) {
	background-color: var(--off-color);
}

</style>
