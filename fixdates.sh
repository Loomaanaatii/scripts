#!/bin/sh

homedir=$(getent passwd "$username" | cut -d: -f6)

echo "Cleaning plex media added dates"
sudo systemctl docker stop
sudo copy "/opt/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "$homedir"/PlexDBs/
sudo sqlite3 "/opt/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "UPDATE metadata_items SET added_at = originally_available_at WHERE DATETIME(added_at) > DATETIME('now');"
sudo sqlite3 "/opt/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" "UPDATE metadata_items SET created_at = originally_available_at WHERE DATETIME(created_at) > DATETIME('now');"
sudo systemctl docker start
echo "Completed"
done