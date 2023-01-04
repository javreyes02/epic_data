library('spotifyr')
library('dplyr')
library('stringr')
library('gsubfn')
library('purrr')
library('writexl')
library('glue')

source('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/epic_data_code/00_spotify_api_keys.R')

today_date = Sys.Date()

access_token <- get_spotify_access_token()

total_followers_jh <- tibble(total_followers = get_artist(id = '2kdmTOXncgNHSuYVMhdd5I')$followers$total)

troy_saga <- get_album_tracks(id = '2j94jmFiOvCwS8Oj6br91A')

get_popularity <- function(in_track){
  
  tibble(track = get_track(in_track)$name,
         album = get_track(in_track)$album$name,
         popularity = get_track(in_track)$popularity,
         date = today_date)
  
}

tracks_listens <- map_dfr(troy_saga$id, get_popularity)

write_xlsx(x = list('artist_jh' = total_followers_jh,
                    'tracks_listens' = tracks_listens),
           path = glue('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/data_collection/data_{today_date}.xlsx'))

## automation
## https://anderfernandez.com/en/blog/how-to-automate-r-scripts-on-windows-and-mac/