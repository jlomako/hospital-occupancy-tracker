# hospital-occupancy-tracker
scheduled workflow that reads daily updated content from web, sorts/processes data, saves new data to csv, plots data
<p>
tracks occupancy rates in local emergency rooms, updates every day at 16 UTC
</p>

<p>
note to myself about some problems I ran into:<br>
<i>
- when this project was still a pdf tracker, loading R package "pdftools" resulted in errors --> solution: use runner "macos-10.15" and install XQuartz before pdftools is installed: Add <code>run: brew install xquartz --cask</code> to yml file
<br>
- to read csv files with french characters use encoding = "latin1"
<br>
- R automatically generates Rplot.pdf together with ggsave -> I haven't found a working solution to prevent that yet
 </i>

[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

 
## Occupancy rates in Montreal emergency rooms
<img src = "img/today.png" width=800 />
