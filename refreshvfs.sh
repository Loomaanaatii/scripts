#!/bin/sh
# Clear the cache of rclone vfs mount
echo "Cleaning rclone VFS mount cache"
echo "Please wait..."
rclone rc vfs/refresh recursive=true
echo "Clean completed."
done