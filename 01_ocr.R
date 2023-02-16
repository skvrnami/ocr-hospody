library(dplyr)
library(tesseract)

# tesseract_download("lat")

files_301 <- list.files("output/301/", pattern = "*.jpg", full.names = TRUE)
files_171 <- list.files("output/171/", pattern = "*.jpg", full.names = TRUE)

lat <- tesseract("lat", options = list("tessedit_pageseg_mode"=1))

for(i in seq_along(files_301)){
    cat(i, "\n")
    try({
        page_id <- stringr::str_extract(files_301[i], "[0-9]+.jpg") %>% 
            gsub(".jpg", "", .)
        text <- ocr(files_301[i], engine = lat)    
        writeLines(text, glue::glue("texts/301/{page_id}.txt"))  
    })
}

for(i in seq_along(files_171)){
    cat(i, "\n")
    try({
        page_id <- stringr::str_extract(files_171[i], "[0-9]+.jpg") %>% 
            gsub(".jpg", "", .)
        text <- ocr(files_171[i], engine = lat)    
        writeLines(text, glue::glue("texts/171/{page_id}.txt"))  
    })
}

