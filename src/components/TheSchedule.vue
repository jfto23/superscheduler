<template>
	<div class=grid-item>
		<div class=container>
			<div class=menu>
				From:<select v-model.number="startTime">
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
				To:<select v-model.number="endTime">
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
				<br>
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

	watch: {
		startTime: function() {
			localStorage["startTime"] = this.startTime;
		},

		endTime: function() {
			localStorage["endTime"] = this.endTime;
		},

		includeWeekends: function() {
			localStorage["includeWeekends"] = this.includeWeekends;
		},

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

	},

	mounted() {
		if (localStorage.getItem("startTime")) {
			this.startTime = parseInt(localStorage.getItem("startTime"));
		}
		if (localStorage.getItem("endTime")) {
			this.endTime = parseInt(localStorage.getItem("endTime"));
		}
		if (localStorage.getItem("includeWeekends")) {
			this.includeWeekends = localStorage.getItem("includeWeekends");
		}

	}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.grid-item {
	grid-row: 1/2;
}

.container {
	display: grid;
	grid-template-columns: 1fr 3fr;
}

.menu {
	margin-left: 10px;
}


table, td, th {
	border: 1px solid var(--border-color);
}


table {
	margin-top: 10%;
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

th {
	font-size: 1vw;
	padding: 10px;
}

.hour {
	width: 10%;
}

tr:nth-child(even) {
	background-color: var(--off-color);
}

tbody [rowspan] {
	border-right: 2px solid black;

}

tbody [rowspan],
tbody [rowspan] ~ th,
tbody [rowspan] ~ td,
tfoot {
	border-top: 2px solid black;
}

table td + td, table th + th {
	border-left: 2px solid black;
}

</style>
