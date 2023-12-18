# README

Pseudo-replikační materiály k paperu [Škvrňák, J. – Škvrňák, M.: Alkohol a účty panství České země do husitské revoluce (Alcohol and the Accounts of the Domain: the Czech Lands until the Hussite Revolution)](https://www.historickycasopis.sk/index.php?id=hc42023-skvrnak-jan-skvrnak-michael-alkohol-a-ucty-panstvi-ceske-zeme-do-husitske-revoluce)

## Sources 
- [Die Landtafel des Markgrafthumes Mähren. Brünner Cuda](https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=7&bookid=171)
- [Die Landtafel des Markgrafthumes Mähren. Olmützer Cuda](https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=7&bookid=301)
- [Decem registra censuum](https://sources.cms.flu.cas.cz/src/index.php?s=v&cat=41&bookid=154)
etc.

## Plan
- [x] stáhnout zemské desky  
    `00_scrape_imgs.R`
- [x] ocrkat => text  
    `01_ocr.R`  
    texty jsou v `texts/*/*.txt`  
- [x] najít zmínky o hospodách, chmelu a sladu  
    `02_hospody.Rmd`
    
