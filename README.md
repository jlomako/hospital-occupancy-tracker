# hospital-occupancy-tracker
[![hospital_occupancy_tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml)

This bot uses cron jobs to track occupancy rates in local emergency rooms. Data is collected on a daily basis and stored in a csv file which is then used by <a href = "https://github.com/jlomako/Montreal-ER">Montreal-ER</a> and by <a href="https://github.com/jlomako/prophet-bot">Prophet bot to calculate forecasts</a>.

### notes to myself:
* made some changes to the bot to make it faster, now runs in python instead of R
* R files have been moved to another repository, see <a href = "https://github.com/jlomako/hospital-occupancy-tracker-R">hospital-occupancy-tracker-R</a>
