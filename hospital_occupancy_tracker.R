########################################################################
# hospital occupancy tracker
# reads file from web, sorts/processes data, saves new data to csv, plots data

# load packages
library(tidyverse)

url <- "https://www.msss.gouv.qc.ca/professionnels/statistiques/documents/urgences/Releve_horaire_urgences_7jours.csv"

# read csv file with french characters
df <- read.csv(url, encoding = "latin1")

update <- as.Date(df$Mise_a_jour[1])
update_time <- df$Heure_de_l.extraction_.image.[1]

# select montreal hospitals
df <- df %>% select(etab = Nom_etablissement, hospital_name = Nom_installation, beds_total = Nombre_de_civieres_fonctionnelles, beds_occ = Nombre_de_civieres_occupees) %>%
  filter(str_detect(etab, "Montr|CHUM|CUSM|CHU Sainte-Justine")) %>%
  mutate(beds_total = as.numeric(beds_total), beds_occ = as.numeric(beds_occ)) %>% 
  select(hospital_name, beds_occ, beds_total)
# calculate total and add to df 
df %>% summarise(sum(beds_total), sum(beds_occ)) -> total
df <- df %>% add_row(hospital_name = "Total", beds_occ = total[1,2], beds_total = total[1,1] ) %>%
  mutate(occupancy_rate = round(100*(beds_occ/beds_total)), Date = update) %>%
  select(Date, hospital_name, occupancy_rate)

# write row to csv
row <- df %>% pivot_wider(names_from=hospital_name, values_from=occupancy_rate)
# write.csv(row, file = "data/hospitals.csv", row.names = FALSE) # creates file, run only once!
write.table(row, "data/hospitals.csv", append = T, row.names = F, col.names = F, sep = ",")

# visualization

update_txt <- paste("\nlast update:", update, "at", update_time)
df %>% 
  filter(hospital_name != "Total") %>%
  ggplot(aes(x = reorder(hospital_name, occupancy_rate), y = occupancy_rate, fill = occupancy_rate)) + 
  geom_col(position = "identity", size = 0.5, show.legend = F) +
  geom_text(aes(label = paste0(occupancy_rate,"%")), hjust = 1, colour = "white", size = 3) +
  coord_flip() +
  scale_fill_gradient2(low = "light green", high = "red", mid = "yellow", midpoint = 80) + 
  theme_minimal() +
  labs(caption = update_txt, x = NULL, y = NULL) +
  theme(panel.grid.minor = element_blank())

ggsave("img/today.png")
ggsave("img/today.jpeg")

# don't create pdf
pdf(NULL)

# to do:
# visualization tracker 
