## 000_parameters.R
## Prepared by olivier.duperrex@unisante.ch
## Modified on 2023-10-24
## 
## Elements that can be modified according to the topic, the language,
## and desired adjustments on the output
## 
## To modify the structure of the tables and plots: 00_functions.R

## variable : is a question
## item : is the possible answers
## value_labels : labels of possible answers
## cols : columns


## 0. general elements --------------------------------------------------------
## . paths ---------------------------------------------------------

path_to_my_token <- here::here('token_delphi_ft_this_project.R')
## if you see an error message : object 'token_delphi_ft_this_project.R' not found,
## open 'token_delphi_ft_this_project.R.example' and follow the instructions

source(path_to_my_token, encoding = 'UTF-8') # returns redcap_uri, token_dft2 and token_dft3

path_texts_intro_local <- here::here('texts_intro')

path_texts_intro_server <- "//path/to/your/server/texts_intro" # replace with yours - not used in demo



## . authors ----
authors_text <- "Camille Velarde Crézé, Olivier Duperrex - Unisanté" # replace with yours

## . email_tester ---------------------------------------------------
email_tester <- c(
  'participant_27@some.email', 
  'tester_2@some.email'
  )


## . reports titles -----------------------------------------------
project_text <- "Fast-track Delphi – TEST of templates"

title_round_2 <-   glue::glue("{project_text} – 2nd round")
title_round_3 <-   glue::glue("{project_text} – 3rd round")



subtitle_generic <- 'Generic report'
subtitle_participant <- "Individualised report"

heading_situation <- "Situation and objectives"
heading_method <- "Methods"
heading_toc <- "Table of content {#toc}"  ## the #toc will provide links
# heading_list_tables <- "Results tables"

heading_participants_characteristics <- "Characteristics of participants"

heading_questions_type1 <- "Type 1 Questions"
heading_questions_type2 <- "Type 2 Questions"
heading_questions_type3 <- "Type 3 Questions"

heading_comment_section <- "Comments on "

email_recipient_text <- "Individualised report for: " # used in individual reports


## 1. define metrics --------------------------------------------
## . delphi scale -------------------------------------------------
min_scale_delphi <- 1
max_scale_delphi <- 9



## . consensus and agreement thresholds ----------------------------
# . agreement reached if median >=7 : OK  sign bold and green 
# . disagreement reached if median <=3 : OK with exclamation mark
# 
# . consensus reached if IQR_range <= 3


agreement_threshold_type1 <- 7      # agreement if median >=7
disagreement_threshold_type1 <- 3   # disagreement if median <=3 

consensus_threshold_type1 <- 3      # iqr_range <= 3

agreement_threshold_type2_3 <-  0.66
# agreement_threshold_type3 <-  0.66



## . icons ----
icon_ok <- "\U2714" # tick mark

icon_agreement_reached    <- icon_ok    
icon_disagreement_reached <- paste0(icon_ok, " !")

## . define colors ----
red_unisante <- "#D91136" ## rgb(217, 17, 54)
color_txt <- "red"

green_ok     <- "#5BB951" ## rgb(91, 185, 91)

bg_color     <- 'grey92'  ## rgb(235, 235, 235)	#EBEBEB
barcol_color <- 'grey70'  ## rgb(179, 179, 179)	#B3B3B3
border_color <- "grey40"  ## rgb(102, 102, 102)	#666666


## 2. labels and levels ---------------------------------------------
## . pattern_boxes_fr -----------------------------------------------
## to use with REDCapR::regex_named_captures

## \x7f-\xff was added to take french caracters into account () - worked with R 4.1 but not R4.2 ???
# pattern_boxes_fr <- "(?<=\\A| \\| )(?<id>\\d{1,}), (?<label>[\x20-\x7B\x7D-\x7E\x7f-\xff]{1,})(?= \\| |\\Z)"


## new solution : add À-ÖØ-öø-ÿ at the beginning !! ---
##https://stackoverflow.com/a/48925757/6176250
pattern_boxes_fr <- "(?<=\\A| \\| )(?<id>\\d{1,}), (?<label>[À-ÖØ-öø-ÿ\x20-\x7B\x7D-\x7E]{1,})(?= \\| |\\Z)"
# pattern_boxes_fr <- stringr::regex("
#                                    (?<=\\A| \\| )       # positive lookbehind : 
#                                    (?<id>\\d{1,}),      # 
#                                    (?<label>[À-ÖØ-öø-ÿ\x20-\x7B\x7D-\x7E]{1,})
#                                    (?= \\| |\\Z)
#                                    ", comments = TRUE)
## please go to https://regex101.com/ and paste this line in it to understand it



# example
# REDCapR::regex_named_captures(pattern = pattern_boxes_fr, text = choices_1)



## . thankyou_string ----
## Some thank you sentences are sometimes part of the variable label or the levels labels. 
## Here we have two different patterns as regex that will be used in `clean_variable_label()`
## 
## For english, use `[Pp]lease.*`
## For french,  use `[Mm]erci.* `
## For german,  use `[Dd]anke.*`
## 
## Adjust if necessary the blank line just before comment = TRUE
## https://stringr.tidyverse.org/articles/regular-expressions.html


thankyou_string <- stringr::regex("
  \\s?          # optional whitespace
  [[:punct:]]   # any punctuation symbol
  \\s?          # optional whitespace
  [Pp]lease.*    # word 'Merci' with upper- or lower-case for the first letter and anything following it
  
                                 ", comments = TRUE)



## . sections: lists and labels ----
## one per round in case they are different

list_sections_round_2 <- c('Z', 'A', 'B', 'C')
list_sections_round_3 <- c('Z', 'A', 'B', 'C')

label_section_Z_long  <- "Topic : long title"
label_section_Z       <- "Preamble"
label_section_A       <- "Section A - title"
label_section_B       <- "Section B - title"
label_section_C       <- "Section C - title"

list_labels_sections_round_2  <- c(label_section_Z_long, label_section_A, label_section_B, label_section_C)
list_labels_sections_round_3  <- c(label_section_Z_long, label_section_A, label_section_B, label_section_C)





## . label txt ----
colon_punctuation_txt <- ": " ## english ": " - french " : "

statement_txt         <- 'Statement'
item_txt_type_2_3     <- 'Statement'

comment_txt_singular  <- 'Comment'
comment_txt_plural    <- 'Comments'

## . label short for various variables ----
# Moved to point 5 - simpler way to add short labels
# label_gender_short    <- 'Gender'
# label_job_short       <- 'Professional activity'
# label_job_o_short     <- 'Professional activity - préciser'
# label_joblang_short   <- 'Location of professional activity'
# label_email_short     <- 'email'
# label_conflicts_short <- "Conflict of interest"

label_agreement       <- 'Agreement'

footnote_agreement_column_type1 <-
  paste0(" ",
    icon_agreement_reached,
    "  = agreement reached (median ≥ ", agreement_threshold_type1, ")  ; ",
    icon_disagreement_reached,
    " = disagreement reached (median ≤ ", disagreement_threshold_type1, ")"
  )

footnote_agreement_column_type2_3 <-
  paste0(" ",
         icon_agreement_reached,
         "  = agreement reached (≥ ",
  agreement_threshold_type2_3 * 100, "% of responses)"
  )
  

label_consensus        <- 'Consensus'
label_consensus_2lines <- 'Con-sensus'  ## '-' allows a narrower column in word

footnote_consensus_column <- paste0(" Consensus reached (IQR ≤ ", consensus_threshold_type1, ")")

label_execsummary_agree_consensus_yes     <- 'Consensual agreement reached'
label_execsummary_disagree_consensus_yes  <- 'Consensual disagreement reached'
label_execsummary_consensus_no            <- 'No consensus'

label_responses_participant_single <- 'Your\nresponse'  ## '\n' creates a new line
label_responses_participant_plural <- 'Your\nresponses'   ## '\n' creates a new line


## . labels for no opinion ----
no_op_long  <- "I do not want or do not wish to answer this question."
no_op_short <- "No opinion"


## . labels for 'Other (please comment...)' ----
## double escape \\ are required because it will be used in a regex
other_please_long  <- "Other \\(please specify your answer in the comment below\\)"
other_please_short <- "Other"

other_country <- "Another country"

## . levels_type1 ----
# levels_type1_fr <- c(
#   "Désaccord total (1)" = 1,
#   "(2)"                 = 2,
#   "Désaccord (3)"       = 3,
#   "(4)"                 = 4,
#   "Neutre (5)"          = 5,
#   "(6)"                 = 6,
#   "Accord (7)"          = 7,
#   "(8)"                 = 8,
#   "Accord total (9)"    = 9
# )
# 
# levels_type1_en <- c(
#   "Total disagreement (1)" = 1,
#   "(2)"                 = 2,
#   "Disagreement (3)"       = 3,
#   "(4)"                 = 4,
#   "Neutral (5)"          = 5,
#   "(6)"                 = 6,
#   "Agreement (7)"          = 7,
#   "(8)"                 = 8,
#   "Total agreement (9)"    = 9
# )
# 
# 
# levels_type1 <- levels_type1_en



## . metadata : separator for comments in field_name ----

# separator_comment_statements <- "destin"
separator_comment_statements <- " to qualify"

## 3. elements for plots  -------------------------------------------
## 
## . tablec_aption_type1 ----
table_caption_type1 <- "Answers to type 1 questions"

## . table_caption_type1_participant ----
## no closing bracket because it is add in 04a_create_flextable_results_type_1_participants.R
table_caption_type1_participant <- glue::glue("({color_txt} = Particip.") 

                                                                       
##  . high_res ----
## use high values for width and height to retain ability to read after reimporting !
## these values will be divided by a multiple of 72 
## during re-importation by create_type_1_exec_summary()  

width_png_high_res  <- 1600
height_png_high_res <-  600

# multiple_pixels   <- 720
# png_percent_for_inclusion_in_table <- 0.10

width_exec_table   <- 1.7
height_exec_table  <- 0.65

label_n_pct        <- "n (%)"
label_median       <- 'Median'
label_median_short <- 'Med.'
label_stats        <- "[IQR]\n(min-max)"
label_scale        <- "(1) Total disagreement ...\n... Total agreement (9)"


breaks_gg <- min_scale_delphi:max_scale_delphi
limits_gg <- c(min_scale_delphi - 1,
               max_scale_delphi + 1)








## 4. elements for executive summary --------------------------------
title_overall <- "Templates REDCap : are they working?"  # for overall executive summary 
subtitle_overall <- project_text

## . statement_numbers_in_dft2_to_keep_for_execsummary ----
## some of the statements of round 2 have been refined in dft3, so are not kept in executive summary
## update this line after round 2 is finished

statement_numbers_in_dft2_to_keep_for_execsummary <- ""
# statement_numbers_in_dft2_to_keep_for_execsummary <- c(4, 11, 18)


## 5. define the descriptive variables by type  ----
## . create a temporary table depending on which one is available

if (exists('dft2_data_redcapr_raw') == TRUE) {
  dt0 <- dft2_data_redcapr_raw
} 

if(exists('dft2_data_clean') == TRUE) {
  dt0 <- dft2_data_clean
}


## . cols_0 : descriptive variables ----
## .. START condition 1 ----
if (exists('dt0') == TRUE) {
  cols_0 <- grep("_0_", names(dt0), value = TRUE)
  
  cols_0
  class(cols_0)
  data.table(cols_0)
  
  ## . cols_0_subset_type3 : characteristics variables with value labels in type3 format ----
  ## this will be added to the lookup table
  cols_0_subset_type3 <- grep("__", cols_0, value = TRUE)
  
  if (length(cols_0_subset_type3) > 0) {  
  cols_0_subset_type3_unique <-
    cols_0_subset_type3 %>%
    stringr::word(1, sep = '\\___') %>%
    unique()
  }

  
  ## . cols_0_subset_value_labels : initial variables with value labels ----
  cols_0_subset_value_labels <- c(
    'dft2_0_gender',
    'dft2_0_job',
    'dft2_0_joblang'
  )
   
  
  ## . create a data.table with short variable labels ----
  ## note the added categorical variable 'dft2_0_nb_patients_cat'
  
  dt_labels_cols_0 <-
    fread(
      "
  field_name, labels_cols_0_short
  dft2_0_gender,   Gender
  dft2_0_age,   Âge
  dft2_0_job,   Professional activity
  dft2_0_job_o,   Professional activity  please detail
  dft2_0_joblang,   Location of professional activity
  dft2_0_email,   email
  dft2_0_conflicts,   Conflict of interest
  dft2_0_conflicts_raw,   Conflict of interest - initial response
"
    )
  
  writexl::write_xlsx(dt_labels_cols_0,
                      path = here::here('output', 'checks', 'dt_labels_cols_0.xlsx'))
  save(dt_labels_cols_0,
       file = here::here('output', 'RData', 'dt_labels_cols_0.RData'))
  
  
  
  ## . cols_0_subset_for_table_1 ----
  ## used in '02a_dft2_prepare_tables_without_participant_id.R'
  ## define here the variable to include in the Table 1
  cols_0_subset_for_table_1 <-
    c(cols_0_subset_value_labels,
      # cols_0_subset_continuous_cat,
      cols_0_subset_type3)
  
  cols_0_subset_for_table_1
  
  ## . order_dft2_0_table_1 ----
  ## used in '02a_dft2_prepare_tables_without_participant_id.R'
  ## define here the order in which the variables will be listed
  order_dft2_0_table_1 <- c(
    'dft2_0_gender',
    'dft2_0_job',
    'dft2_0_joblang'
  )
  order_dft2_0_table_1
  
}
## .. END condition 1 ----

caption_table_1 <- "
NB: Proportions are calculated on number of participants.
* Plusieurs réponses possibles - la somme des proportions peut donc dépasser le 100%" 


## 6. conflicts_keywords ----
## Need to update according to the responses - either in 01b_ft2_recode_data.R or 'output/checks/chk_dft2_0_conflicts.xlsx'
conflicts_keywords <- 'aucun|0|none|pas de|ras'
