library('purrr')
library('writexl')
library('readxl')
library('glue')
library('ggplot2')


all_tracks_listens <- read_excel('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/all_data.xlsx',
           sheet = 'all_tracks_listens')

all_jh_followers <- read_excel('/Users/Julia/Documents/Documents/Side Projects/Epic_Data/all_data.xlsx',
                                 sheet = 'all_jh_followers')

ggplot(all_tracks_listens) +
  geom_line(aes(x = date, y = popularity, group = track, color = track)) +
  scale_y_continuous(
    breaks = seq(0,100,10),
    limits = c(0,100)
  ) +
  theme_classic() +
  theme(
    legend.position = 'bottom',
    legend.title = element_blank()
  ) +
  labs(title = "Popularity of Epic: The Musical Tracks Over Time",
       x = element_blank(),
       y = "Popularity (0-100)")

ggplot(all_jh_followers) +
  geom_line(aes(x = date, y = total_followers)) +
  scale_y_continuous(
    n.breaks = 10,
    limits = c(10000,25000)
  ) +
  theme_classic() +
  labs(title = "Followers for Artist, Jorge Rivera-Herrans",
       x = element_blank(),
       y = "Followers")
