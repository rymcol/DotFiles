function backup

if count $argv > /dev/null
    set drive $argv[1]
else
    echo "You must provide the external drive as an argument… `localbackup [drive]`"
    return 2
end

restic -r /Volumes/$drive/restic backup ~/Developer --cleanup-cache
restic -r /Volumes/$drive/restic backup ~/Pictures --cleanup-cache
restic -r /Volumes/$drive/restic backup ~/Music --cleanup-cache
restic -r /Volumes/$drive/restic forget --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 2 --prune

end
