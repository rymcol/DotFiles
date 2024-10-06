function nasbackup

restic -r /run/user/1000/gvfs/smb-share:server=10.0.7.7,share=home/restic backup ~/Developer --cleanup-cache
restic -r /run/user/1000/gvfs/smb-share:server=10.0.7.7,share=home/restic backup ~/Pictures --cleanup-cache
restic -r /run/user/1000/gvfs/smb-share:server=10.0.7.7,share=home/restic backup ~/Music --cleanup-cache
restic -r /run/user/1000/gvfs/smb-share:server=10.0.7.7,share=home/restic backup ~/Downloads --cleanup-cache
restic -r /run/user/1000/gvfs/smb-share:server=10.0.7.7,share=home/restic backup ~/Videos --cleanup-cache
restic -r /run/user/1000/gvfs/smb-share:server=10.0.7.7,share=home/restic forget --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 2 --prune

end
