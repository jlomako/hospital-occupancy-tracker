# hospital-occupancy-tracker
[![hospital_occupancy_tracker](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/hospital_occupancy_tracker.yml)
[![save_data_to_files](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/save_data_to_files.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/save_data_to_files.yml)
[![save_wait_time_to_files](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/get_wait_times.yml/badge.svg)](https://github.com/jlomako/hospital-occupancy-tracker/actions/workflows/get_wait_times.yml)

This bot uses cron jobs to track occupancy rates in local emergency rooms. Data is collected on a daily/hourly basis.
The first version of this bot was written in R and has been moved to <a href = "https://github.com/jlomako/hospital-occupancy-tracker-R">hospital-occupancy-tracker-R</a>.


## Some notes to myself about the <a href="https://www.donneesquebec.ca/recherche/dataset/d4541afe-9391-44bf-a78f-dae3c9cf1217/resource/968af2e2-8c0f-43d4-9f34-100bd8d295a7/download/listevariables_notesmetho_relevehoraireurgence_20230202.pdf">data</a>: 

Data file includes for each region in Quebec, the number of functional stretchers, the number of patients on stretchers, the number of patients on stretchers for more than 24 hours, the number of patients on stretchers for more than 48 hours, the total number of patients present in the ED, the total number of patients waiting for medical care, the average length of ambulatory stay (**data from the previous day**) and the average length of stay on stretchers (**data from the previous day**). The date and time of the data and its update are also specified. The file is updated every hour.

**Nombre_de_civieres_fonctionnelles**: Number of evaluation stretchers recognized in the functional capacity of the functional capacity of the ED and validated by the MSSS, thus excluding shock and overflow stretchers and overflow stretchers in the ED.

**Nombre_de_civieres_occupees**: Number of patients on stretchers at the time of the survey, including users who are waiting for hospitalization, those on shock and overflow stretchers in the overflow stretchers in the emergency department.

**Nombre_total_de_patients_presents_a_lurgence**: Represents the total number of patients present at the time of the survey, including stretchered and ambulatory (in the waiting room). A patient is counted in this number from the moment they arrive in the ED until they leave. This number therefore includes those who saw a nurse or not, those who saw a doctor or not, those waiting for an exam or exam results (blood test, ultrasound, etc.) (blood test, ultrasound, X-ray), those waiting for a consultation with a specialist, and those waiting for specialist as well as those waiting for a hospital bed.

**Nombre_total_de_patients_en_attente_de_PEC**: Represents the total number of patients present, at the time of the survey, including ambulatory (in the waiting room) and on a stretcher, **who are waiting for medical care**. A patient is counted in this number from the time they arrive at the emergency department until they are seen by a physician. This number includes only those patients who have not yet seen a physician for the first time.

**DMS_sur_civiere:** Average length of stay on stretcher. The average length of stay on a stretcher represents the time between arrival and departure of the user from the ED,  for clients who occupied a stretcher during their stay. The data are in decimal number format.

**DMS_ambulatoire:**  Average length of stay for ambulatory care. The average ambulatory length of stay represents the length of time between the arrival and the departure of the patient from the emergency room, for clients who are ambulatory (waiting room). The data is in decimal number format. 

**Average length of stay** measures the time between the arrival of the patients and their departure from the ED. They are calculated from the number of clients who left the ED the **previous day**. They include patients who were referred and those who left the ED before being seen by a physician. These times vary throughout the day, depending on the volume of patients and the priority of cases. Situations that can increase the average length of stay include consultations requested in the ED for a specialist, access to an inpatient bed and required tests. 

A visit is ambulatory when the client's medical or psychosocial condition does not require them to be on a stretcher. These patients will be in the waiting room.
