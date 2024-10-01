#!/bin/bash
# Backup the file and archive it to store in other location

backup_file="/root/realtime_project/support_files/data_backup.txt"
backup_directory="/dailybackup"
file_name="backup_$(date +'%d.%m.%Y_%H.%M.%S').tar.gz"

#Checking if the file is present in the directory or not
if [ -f "$backup_file" ]
then
        echo "File is available. processing backup"
else
        echo "File not available. Please check $backup_file"
        exit 1
fi

# archive the backup file
tar -czf "$backup_directory/$file_name" "$backup_file" 2>/dev/null

#check the bachup was complete
if [ $? -eq 0 ] 
then
        echo "Backup was completed succesfully"
else
        echo "Backup failed"
        exit 1
fi
