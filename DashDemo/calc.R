datasource = 'synthea'
dataset = 'synthea_sample_data_csv_apr2020'
datatype = 'csv'

datapath = file.path(getwd(), datasource, dataset, datatype)
datafiles = list.files(datapath, pattern = '*.csv')

encounters_file = 'encounters.csv'
encounters_csv = file.path(datapath, encounters_file)
encounters = read.csv(encounters_csv)

library(gt)
library(tidyverse)
library(glue)

encounters %>%
  mutate(start_date = as.Date(substr(START, 1, 10), format = "%Y-%m-%d"))

# Define the start and end dates for the data range
start_date <- "2010-06-07"
end_date <- "2010-06-14"

# Create a gt table based on preprocessed
# `sp500` table data
sp500 %>%
  filter(date >= start_date & date <= end_date) %>%
  select(-adj_close) %>%
  gt() %>%
  tab_header(
    title = "S&P 500",
    subtitle = glue::glue("{start_date} to {end_date}")
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 3
  ) %>%
  fmt_currency(
    columns = vars(open, high, low, close),
    currency = "USD"
  ) 
