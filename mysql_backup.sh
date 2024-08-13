#!/bin/bash

# Replace with your MySQL credentials and backup directory
MYSQL_USER="root"
MYSQL_PASSWORD="Netomi@1234"
MYSQL_DATABASE="mydb"
BACKUP_DIR="/root/mysql_backup"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Generate the backup filename with timestamp
BACKUP_FILE="$BACKUP_DIR/mysql_backup_$(date +%Y-%m-%d).sql.gz"

# Create the backup
mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" | gzip > "$BACKUP_FILE"

# Check if the backup was created successfully
if [ -f "$BACKUP_FILE" ]; then
  echo "MySQL backup created successfully: $BACKUP_FILE"
else
  echo "Error creating MySQL backup"
fi
