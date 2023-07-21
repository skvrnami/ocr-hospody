library(rvest)
library(dplyr)

# TODO: replace base_url with cat
#' @param book_id Id of book inferred from the URL
#' @param end_page Last page to be scraped, number determined from the URL
#' @param start_page Start page to scrape from (default to 1), useful when 
#' the for loop breaks because of poor internet connection etc.
#' @param base_url base URL
download_book_imgs <- function(book_id, end_page, start_page = 1, base_url){
    if(!dir.exists(glue::glue("output/{book_id}"))){
        dir.create(glue::glue("output/{book_id}"))   
    }
    for(i in start_page:end_page){
        cat(i)
        page_no <- i
        url <- glue::glue("{base_url}={book_id}&page={page_no}")
        html <- read_html(url)
        html %>% 
            html_node("img") %>% 
            html_attr("src") %>% 
            paste0("https://sources.cms.flu.cas.cz/src/", .) %>% 
            download.file(., destfile = glue::glue("output/{book_id}/{page_no}.jpg"))
        Sys.sleep(1)
    }
}

# Codex diplomaticus Bohemiae
## CDB I
download_book_imgs(book_id = 1244, end_page = 579, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=2&bookid")
## CDB II
download_book_imgs(book_id = 1243, end_page = 585,
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=2&bookid")
## CDB III/1
download_book_imgs(book_id = 565, end_page = 272, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=2&bookid")
## CDB III/2
download_book_imgs(book_id = 598, end_page = 125, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=2&bookid")

# Regesta Bohemiae et Moraviae
## RBM I
download_book_imgs(book_id = 222, end_page = 819, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM II
download_book_imgs(book_id = 132, end_page = 1495, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM III
download_book_imgs(book_id = 130, end_page = 962, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM IV
download_book_imgs(book_id = 196, end_page = 1020, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VI/1
download_book_imgs(book_id = 698, end_page = 200, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VI/2
download_book_imgs(book_id = 699, end_page = 357, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VII/1
download_book_imgs(book_id = 1061, end_page = 193, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VII/2
download_book_imgs(book_id = 1060, end_page = 209, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VII/3
download_book_imgs(book_id = 1062, end_page = 193, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VII/4
download_book_imgs(book_id = 1063, end_page = 169, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")
## RBM VII/5
download_book_imgs(book_id = 1064, end_page = 163, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=8&bookid")


# Die Landtafel des Markgrafthumes Mähren. Brünner Cuda
download_book_imgs(book_id = 171, end_page = 507, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=7&bookid")
# Die Landtafel des Markgrafthumes Mähren. Olmützer Cuda
download_book_imgs(book_id = 301, end_page = 492, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=7&bookid")
# Decem registra censuum
download_book_imgs(book_id = 154, end_page = 449, 
                   base_url = "https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=41&bookid")

