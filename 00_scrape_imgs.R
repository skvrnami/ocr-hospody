library(rvest)

dir.create(glue::glue("output/301"))
for(i in 1:492){
    cat(i)
    book_id <- 301
    page_no <- i
    url <- glue::glue("https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=7&bookid={book_id}&page={page_no}")
    html <- read_html(url)
    html %>% 
        html_node("img") %>% 
        html_attr("src") %>% 
        paste0("https://sources.cms.flu.cas.cz/src/", .) %>% 
        download.file(., destfile = glue::glue("output/{book_id}/{page_no}.jpg"))
    Sys.sleep(1)
}

dir.create(glue::glue("output/171"))
for(i in 1:507){
    cat(i)
    book_id <- 171
    page_no <- i
    url <- glue::glue("https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=7&bookid={book_id}&page={page_no}")
    html <- read_html(url)
    html %>% 
        html_node("img") %>% 
        html_attr("src") %>% 
        paste0("https://sources.cms.flu.cas.cz/src/", .) %>% 
        download.file(., destfile = glue::glue("output/{book_id}/{page_no}.jpg"))
    Sys.sleep(1)
}