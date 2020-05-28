<template>
  <div class=schedule>
		<table>
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
					<td v-for="(day, day_index) in week" :key="day_index">. </td>
				</tr>

			</tbody>
		</table>

  </div>
</template>

<script>
export default {
  name: 'TheSchedule',

	data() {
		return {
			week: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
			times: [8,9,11,12,13,14,15,16,17],


		}


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
