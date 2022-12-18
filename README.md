# hospital-occupancy-tracker
[![hospital_occupancy_tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml)

This bot uses cron jobs to track occupancy rates in local emergency rooms. Data is collected on a daily basis and stored in a csv file which is then used by <a href = "https://github.com/jlomako/Montreal-ER">Montreal-ER</a> and by <a href="https://github.com/jlomako/prophet-bot">Prophet bot to calculate forecasts</a>.

### notes to myself:
* to read csv with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> pdf won't be saved with <code>git add data/* img/*</code>
* runs on macos-11 since GH stopped supporting macos-10.15
* data source wasn't available from Sep 15-19, replaced missing data with data from pdfscraper
* created new yml file that reads packages from renv.lock
* bot runs on ubuntu now
* rewrote the whole script in python, added .py script with requirements.txt - will write new yml workflow and then switch from R to Python
* removed plots from script as this is done in shiny in <a href = "https://github.com/jlomako/Montreal-ER">Montreal-ER</a>
* (faster) bot runs in Python now
