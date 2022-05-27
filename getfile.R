# get pdf and save to depository

url <- "https://santemontreal.qc.ca/fileadmin/fichiers_portail/Donnees_urgence/urgence_quotidien_media.pdf"
download.file(url, "pdf/urgence_quotidien_media.pdf", mode="wb", headers = c("User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36")) 
