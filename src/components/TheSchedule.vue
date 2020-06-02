<template>
	<div>
		From: <select v-model.number="startTime">
			<option>0</option>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
			<option>11</option>
		</select>
		To: <select v-model.number="endTime">
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
		</select>
		<div>
			Include weekends:
			<select v-model="includeWeekends">
				<option>false</option>
				<option>true</option>
			</select>
		</div>
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
					<tr v-for="time_index in (endTime-startTime)*4" :key="time_index">
						<td class=hour v-if="(time_index-1) % 4 === 0" rowspan="4">
							{{ startTime +((time_index-1) / 4)}}h</td>
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
			startTime: 8,
			endTime: 18,
			addToggle: false,
			removeToggle: false,
			includeWeekends: "false",
		}

	},

	computed: {
		week: function() {
			if (this.includeWeekends === "false") {
				return ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
			}
			else {
				return ["Monday", "Tuesday", "Wednesday", "Thursday",
					"Friday", "Saturday","Sunday"];
			}
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
