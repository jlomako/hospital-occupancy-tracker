# hospital-occupancy-tracker
scheduled workflow that reads daily updated content from web, sorts/processes data, saves new data to csv, plots data
<p>
tracks occupancy rates in local emergency rooms, updates every day at 11am
</p>

<p>
 <b>note to myself about some problems I ran into:</b><br>
* when this project was still reading data from a pdf, loading R package "pdftools" resulted in errors -->
 <a href="https://github.com/r-lib/actions/issues/78#issuecomment-611733294">solution</a>: use runner "macos-10.15" and install XQuartz before pdftools is installed: Add <code>run: brew install xquartz --cask</code> to yml file<br>
* to read csv files with french characters use <code>encoding = "latin1"</code><br> 
* R automatically generates Rplot.pdf together with ggsave -> still looking for a working solution to prevent that<br>
 

[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

 
## Occupancy rates in Montreal emergency rooms
<img src = "img/today.png" width=800 />
