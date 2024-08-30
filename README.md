# Git Version Control Demo Project #2

This is a project for the Reproducible Research lecture of BSTA 511 Biostatistics in Practice in 2024. It is used to demonstrate version control using GitHub.  

# Statistical Analysis Plan (`sap_sample.Rmd`)

Execute the following command in terminal to create sap_sample.docx and sap_sample.html. 
Be sure to `cd` into the `bsta511_2024_project_3.2` directory.

```
Rscript -e "library(rmarkdown); rmarkdown::render('sap_sample.Rmd', output_format = c('word_document', 'html_document'))"
```
