# hospital-occupancy-tracker
[![hospital_occupancy_tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml)

This bot uses cron jobs to track occupancy rates in local emergency rooms. Data is collected on a daily/hourly basis and stored in csv files which are then used by <a href = "https://github.com/jlomako/Montreal-ER">Montreal-ER</a> and by <a href="https://github.com/jlomako/prophet-bot">Prophet bot to calculate forecasts</a>.

The first version of this bot was written in R and has been moved to <a href = "https://github.com/jlomako/hospital-occupancy-tracker-R">hospital-occupancy-tracker-R</a>.
