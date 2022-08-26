# hospital-occupancy-tracker
[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

* scheduled workflow that tracks occupancy rates in local emergency rooms
* reads content from web, sorts/processes data, saves new data to csv, plots data
* collects data for shiny app
* explore data: <a href = "https://jlomako.shinyapps.io/occupancy_app/">
jlomako.shinyapps.io/occupancy_app/</a>
<br><br>
 
### Occupancy rates in Montréal emergency rooms
<img src = "img/today.png" width=800 />

### note to myself:
* to read csv files with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> pdf won't be saved with <code>git add data/* img/*</code>
* runs on macos-11 now (GH stopped supporting macos-10.15)
