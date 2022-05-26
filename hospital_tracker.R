##############################################################
# hospital occupancy tracker
#
# gets content from pdf and saves results to csv file
# gets Occupancy rates in Montreal emergency rooms

# packages:
library(tidyverse)
library(pdftools)

url <- "https://santemontreal.qc.ca/fileadmin/fichiers_portail/Donnees_urgence/urgence_quotidien_media.pdf"

text_pdf <- pdf_text(url)
# get rows from pdf
by_row_pdf <- str_split(text_pdf, pattern = "\n")

# function to concatenate words from a list with single words 
get_string <- function(list_of_words){
  name = ""
  for (i in 1:length(list_of_words)){
    name <- paste(name, list_of_words[i])
  }
  # remove first character in word (empty space)
  name <- str_sub(name, 2)
} 

# function that splits a string at first number to get hospital name
get_name <- function(nice_string){
  strsplit(nice_string, split = "(?<=[a-zA-Z])\\s*(?=[0-9])", perl = TRUE)[[1]][1]
}

# function that splits a string at first number and separates all numbers
get_number <- function(nice_string){
  number <- strsplit(nice_string, split = "(?<=[a-zA-Z])\\s*(?=[0-9])", perl = TRUE)[[1]][2]
  str_split_fixed(number, " ", 8)
}

# for each row in pdf, get hospital name and numbers, row is NA if not a hospital
df <- data.frame(matrix(ncol = 9, nrow = 0))
for (i in 1:length(unlist(by_row_pdf))){ # go through pdf line by line
  x <- by_row_pdf[[1]][i] # get strings for each line
  x <- str_extract_all(x, boundary("word"))[[1]] # separate strings into single word elements
  
  if (length(x) > 8) { # only proceed if row has more than 8 word elements
    x <- get_string(x) # get string of whole row (separated by single space
    name <- get_name(x) # extract name from string
    numbers <- get_number(x) # extract numbers from string
    if (!numbers[1,7] == "") { # only write name and numbers to dataframe if column 7 is not empty
      df[i,] <- data.frame(name,numbers) 
    }
  }
}
# dataframe with all hospitals and numbers from table, incl subtotals
df <- na.omit(df)

# clean up dataframe
# get only hospital name and occupancy rate, exclude subtotals, add current date
df <- df %>% 
  select(hospital_name = X1, occupancy_rate = X2) %>%
  # exclude subtotals
  filter(hospital_name != "Sous total") %>%
  mutate(date = Sys.Date())


# write row to csv
row <- df %>% pivot_wider(names_from=hospital_name, values_from=occupancy_rate)
# write.csv(row, file = "data/hospitals.csv", row.names = FALSE) # run only once!
write_csv(row,"data/hospitals.csv",append = T)


## visualisation

# to do: fix date
# visualize current occupancy rates
df$occupancy_rate <- as.numeric(df$occupancy_rate)
df %>% 
    filter(hospital_name != "Total") %>%
    ggplot(aes(x = reorder(hospital_name, occupancy_rate), y = occupancy_rate, fill = occupancy_rate)) + 
    geom_col(position = "identity", size = 0.5, show.legend = FALSE) +
    coord_flip() +
    scale_fill_gradient2(low = "light green", high = "red", mid = "yellow", midpoint = 80) + 
    theme_minimal() +
    labs(title = "Occupancy rates (%)", subtitle = "in Montreal emergency rooms", caption = Sys.Date(), x = NULL, y = NULL) +
    theme(panel.grid.minor = element_blank())

ggsave("img/today.png")
ggsave("img/today.jpeg")

# to do: plot tracker
