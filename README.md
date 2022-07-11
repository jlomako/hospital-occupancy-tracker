# hospital-occupancy-tracker
scheduled workflow that reads content from web, sorts/processes data, saves new data to csv, plots data
<p>
tracks occupancy rates in local emergency rooms, updates daily
</p>

[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

<p>
 
## Occupancy rates in Montreal emergency rooms
<img src = "img/today.png" width=800 />

### note to myself:
* to read csv files with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> still looking for a solution to prevent R from doing that<br> --> pdf won't be saved with <code>git add data/* img/*</code>

