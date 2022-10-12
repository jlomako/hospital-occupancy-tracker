# Occupancy rates in Montréal emergency rooms
## hospital-occupancy-tracker
[![hospital_occupancy_tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml)

* github action that tracks occupancy rates in emergency rooms in Montreal
* reads content from web, sorts/ processes data, saves new data to csv, plots data
* collects data for <a href = "https://jlomako.shinyapps.io/occupancy_app/"><b>
occupancy app</b></a>
* data is used by <a href="https://github.com/jlomako/prophet-bot">prophet bot</a> to calculate forecast
<br><br>
 


### note to myself:
* to read csv files with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> pdf won't be saved with <code>git add data/* img/*</code>
* runs on macos-11 now since GH stopped supporting macos-10.15
* data source wasn't updated from Sep 15-19, replaced missing data with data from pdfscraper
* created new yml file that uses versions and gets packages from renv.lock
* renv.lock must stay in direcory (includes packages + versions)
* bot runs on ubuntu now!
