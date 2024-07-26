function nasbackup

restic -r /Volumes/home/restic backup ~/Developer --cleanup-cache
restic -r /Volumes/home/restic backup ~/Pictures --cleanup-cache
restic -r /Volumes/home/restic backup ~/Music --cleanup-cache
restic -r /Volumes/home/restic backup ~/Downloads --cleanup-cache
restic -r /Volumes/home/restic forget --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 2 --prune

end
