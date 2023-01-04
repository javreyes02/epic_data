library('cronR')


f <- '/Users/Julia/Documents/Documents/Side Projects/Epic_Data/01_data_collection.R'
cmd <- cron_rscript(f)
cmd
cron_add(command = cmd, frequency = 'daily', at = '8AM', id = 'epic_data_collection',
         description = 'scrape listener data for Epic: The Musical each week', tags = 'epic')
