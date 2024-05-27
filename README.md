# Fast-track Delphi: code only

Olivier Duperrex <a href="https://orcid.org/0000-0002-0932-6846"><img alt="ORCID logo" src="https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png" width="16" height="16" /></a>, Camille Velarde Crézé <a href=" https://orcid.org/0000-0002-4686-9401"><img alt="ORCID logo" src="https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png" width="16" height="16" /></a>, Unisanté, Lausanne

## Purpose

The `fast-track Delphi` was developed by [Unisanté](https://www.unisante.ch/) to provide consensus information for political decisions in context of public health crisis.

The process consists in three rounds of consultation. The participants are brought together in a first round during which a series of topics/questions/statements will be collected using a nominal group technique (NGT). The participants then express their opinion on these statements by responding individually to questions in the second and third rounds using an online questionnaire built with [**`REDCapR`**](https://ouhscbbmc.github.io/REDCapR/).

In order to produce results in a very short time frame, we use an [R project](https://r4ds.had.co.nz/workflow-projects.html) to analyse the results and produce **editable word documents** :

-   a generic report and individualised reports for the second round (dft2)

-   a generic report and individualised reports for the third round (dft3)

-   an overall executive summary

## Fast-track Delphi Toolkit

This document is part of a toolkit:

-   Code only [![](https://img.shields.io/badge/doi-10.16909/dataset/40-blue.svg)](https://doi.org/10.16909/dataset/40)

-   Demonstration set (code, anonymized dataset and outputs) [![](https://img.shields.io/badge/doi-10.16909/dataset/41-blue.svg)](https://doi.org/10.16909/dataset/41)

-   User guide [![](https://img.shields.io/badge/doi-10.16909/dataset/39-blue.svg)](https://doi.org/10.16909/dataset/39)

Please go through the [Fast-track Delphi: user guide](https://github.com/Unisante/delphi-fast-track-user-guide) to discover the steps with demo data, see what it produces and then try it out.



## Softwares and packages

-   interface and language : [**`RStudio`**](https://www.rstudio.com/) and [**`R Statistical Software`**](https://www.r-project.org/)

-   obtain data : [**`REDCapR`**](https://ouhscbbmc.github.io/REDCapR/) (not necessary for the demo)

-   data management, analysis and visualisation : mainly [**`data.table`**](https://rdatatable.gitlab.io/data.table/), with some [**`tidyverse`**](https://www.tidyverse.org/) and other packages. Regex expressions are sometimes used.

-   reports : [**`officedown`**](https://ardata-fr.github.io/officeverse/officedown-for-word.html) which builds on [**`bookdown`**](https://pkgs.rstudio.com/bookdown/), and [**`flextable`**](https://davidgohel.github.io/flextable/) from the [**`officeverse`**](https://ardata-fr.github.io/officeverse/index.html)


## Citation

Please use the following to cite this document :

Duperrex O and Velarde Crézé C. Fast-track Delphi: code only. v0.5. 2023. Département Promotion de la santé et préventions, Unisanté, Lausanne, Suisse. Available from: [https://github.com/Unisante/delphi-fast-track](https://github.com/Unisante/delphi-fast-track). DOI: [10.16909/dataset/40](https://doi.org/10.16909/dataset/40)

## Licence

© 2024 by Olivier Duperrex is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).

![CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png){fig-align="left"}

