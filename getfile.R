# get pdf and save to depository

url <- "https://www.msss.gouv.qc.ca/professionnels/statistiques/documents/urgences/Rap_horaire_SituatUrgence1.pdf"
download.file(url, "pdf/urgence_quotidien_media.pdf", mode="wb")) 
# download.file(url, "pdf/urgence_quotidien_media.pdf", mode="wb", headers = c("User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36")) 
