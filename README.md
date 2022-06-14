# hospital-occupancy-tracker
scheduled workflow that reads daily updated content from web, sorts/processes data, saves new data to csv, plots data
<p>
tracks occupancy rates in local emergency rooms, updates every day at 11am
</p>

<p>
<b>note to myself:</b><br>
* to read csv files with french characters use <code>encoding = "latin1"</code><br> 
* R automatically generates Rplot.pdf together with ggsave --> still looking for a solution to prevent R from doing that<br> --> won't be saved with <code>git add data/* img/*</code>


[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

 
## Occupancy rates in Montreal emergency rooms
<img src = "img/today.png" width=800 />
