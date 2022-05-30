# hospital-occupancy-tracker
workflow that reads daily updated content, processes and plots data, and saves result to csv file
<br>
tracks occupancy rates of local emergency rooms
<br>
updates every day at 16 UTC
<p>
note to myself:<br>
<i>
- problem when extracting pdf with package "pdftools" in workflow: use runner macos-10.15 and install XQuartz before pdftools is installed. 
Add "run: brew install xquartz --cask" to yml file
<br>
- to read csv files with french characters use encoding = "latin1"
<br>
- re-activate workflow under Actions > Workflows
 </i>

[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)

 
## Occupancy rates in Montreal emergency rooms
<img src = "img/today.png" width=800 />
