# hospital-occupancy-tracker
reads daily updated content from pdf, extracts and plots data, saves results to csv file
<br>
tracks occupancy rates in local emergency rooms
<br>
updates every day at 12pm <b>--- paused for now ---> </b>script works but access to pdf is denied when running through github actions :[
<p>
note to myself:<br>
<i>
- to run workflow on macos, XQuartz needs to be installed before pdftools is installed. 
Add "run: brew install xquartz --cask" to yml file
<br>
- re-activate workflow under Actions > Workflows
<br>
- to do: try with different ip?
</i>

[![hospital-tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/main.yml)


<h2>Occupancy rates in Montreal emergency rooms</h2>
<img src = "img/today.png" width=800 />
