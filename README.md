# hospital-occupancy-tracker
scheduled workflow that tracks occupancy rates in local emergency rooms
<br>
reads content from web, sorts/processes data, saves new data to csv, plots data
<p>

[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

<p>
I also made a Shiny app out of this: <b><a href="jlomako.shinyapps.io/occupancy_app/">
jlomako.shinyapps.io/occupancy_app/</a></b>
<p>
 
## Occupancy rates in Montreal emergency rooms
<img src = "img/today.png" width=800 />

### note to myself:
* to read csv files with french characters use <code>encoding = "latin1"</code>
* R automatically generates Rplot.pdf together with ggsave --> still looking for a solution to prevent R from doing that<br> --> pdf won't be saved with <code>git add data/* img/*</code>
* runs on macos-11 now (GH stopped supporting macos-10.15)
