library(dplyr)
library(tesseract)

# tesseract_download("lat")
lat <- tesseract("lat", options = list("tessedit_pageseg_mode"=1))

find_files <- function(path, pattern = "*.jpg"){
    list.files(
        path = path, 
        pattern = pattern, 
        full.names = TRUE
    )
}

files_301 <- find_files("output/301/")
files_171 <- find_files("output/171/")
files_154 <- find_files("output/154/")

files_130 <- find_files("output/130/")
files_132 <- find_files("output/132/")
files_154 <- find_files("output/154/")
files_196 <- find_files("output/196/")
files_222 <- find_files("output/222/")
files_565 <- find_files("output/565/")
files_598 <- find_files("output/598/")
files_698 <- find_files("output/698/")
files_699 <- find_files("output/699/")
files_1060 <- find_files("output/1060/")
files_1061 <- find_files("output/1061/")
files_1062 <- find_files("output/1062/")
files_1063 <- find_files("output/1063/")
files_1064 <- find_files("output/1064/")
files_1243 <- find_files("output/1243/")
files_1244 <- find_files("output/1244/")

files_543 <- find_files("output/543/")
files_544 <- find_files("output/544/")

files_86 <- find_files("output/86/")
files_192 <- find_files("output/192/")

ocr_files <- function(files, path, engine = lat){
    if(!dir.exists(path)){
        dir.create(path)
    }
    for(i in seq_along(files)){
        cat(i, "\n")
        try({
            page_id <- stringr::str_extract(files[i], "[0-9]+.jpg") %>% 
                gsub(".jpg", "", .)
            text <- ocr(files[i], engine = engine)
            writeLines(text, glue::glue("{path}/{page_id}.txt"))
        })
    }
}

ocr_files(files_154, "texts/154")
ocr_files(files_171, "texts/171")
ocr_files(files_301, "texts/301")

ocr_files(files_130, "texts/130")
ocr_files(files_132, "texts/132")
ocr_files(files_154, "texts/154")
ocr_files(files_196, "texts/196")
ocr_files(files_222, "texts/222")
ocr_files(files_565, "texts/565")
ocr_files(files_598, "texts/598")
ocr_files(files_698, "texts/698")
ocr_files(files_699, "texts/699")
ocr_files(files_1060, "texts/1060")
ocr_files(files_1061, "texts/1061")
ocr_files(files_1062, "texts/1062")
ocr_files(files_1063, "texts/1063")
ocr_files(files_1064, "texts/1064")
ocr_files(files_1243, "texts/1243")
ocr_files(files_1244, "texts/1244")

ocr_files(files_543, "texts/543")
ocr_files(files_544, "texts/544")

ocr_files(files_86, "texts/86")
ocr_files(files_192, "texts/192")


merge_files <- function(path){
    files <- list.files(path, full.names = TRUE)
    files_df <- data.frame(
        file = files, 
        order = as.numeric(stringr::str_extract(files, "([0-9]+)\\.txt", group = 1))
    ) %>% 
        arrange(order)
    unlist(purrr::map(files_df$file, readLines))
}

merge_files("texts/543") %>% writeLines("output/543.txt")
merge_files("texts/544") %>% writeLines("output/544.txt")
