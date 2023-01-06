library('dplyr')
library('purrr')
library('writexl')
library('readxl')
library('glue')

## file_name <- files[1]

import_track_listens <- function(file_name){
  
  read_excel(glue('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/data_collection/{file_name}'),
             sheet = 'tracks_listens')
}

import_followers <- function(file_name){
  
  read_excel(glue('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/data_collection/{file_name}'),
             sheet = 'artist_jh')
  
}
files <- list.files('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/data_collection')

all_tracks_listens <- map_dfr(files, import_track_listens)
all_jh_followers <- map_dfr(files, import_followers)

write_xlsx(list('all_tracks_listens' = all_tracks_listens,
                 'all_jh_followers' = all_jh_followers),
            '/Users/Julia/Documents/Documents/Side Projects/Epic_Data/all_data.xlsx')
