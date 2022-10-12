# hospital-occupancy-tracker
[![hospital_occupancy_tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml)

This bot tracks occupancy rates in emergency rooms in Montreal. It reads content from web, sorts and processes data, and saves new data to csv. The collected data is used by <a href = "https://github.com/jlomako/Montreal-ER"><b>Montreal-ER</b></a> and by <a href="https://github.com/jlomako/prophet-bot"><b>prophet bot</b></a> to calculate forecasts.


### note to myself:
* to read csv files with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> pdf won't be saved with <code>git add data/* img/*</code>
* runs on macos-11 now since GH stopped supporting macos-10.15
* data source wasn't updated from Sep 15-19, replaced missing data with data from pdfscraper
* created new yml file that uses versions and gets packages from renv.lock
* renv.lock must stay in direcory (includes packages + versions)
* bot runs on ubuntu now!
