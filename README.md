# hospital-occupancy-tracker
[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

* github action that tracks occupancy rates in emergency rooms in Montreal
* reads content from web, sorts/processes data, saves new data to csv, plots data
* collects data for shiny app: <a href = "https://jlomako.shinyapps.io/occupancy_app/"><b>
jlomako.shinyapps.io/occupancy_app/</b></a>
<br><br>
 
### Occupancy rates in Montréal emergency rooms
<img src = "img/today.png" width=560>

### note to myself:
* to read csv files with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> pdf won't be saved with <code>git add data/* img/*</code>
* runs on macos-11 now since GH stopped supporting macos-10.15
