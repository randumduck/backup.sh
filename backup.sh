#!/bin/bash

# Default source directory
DEFAULT_SRC="/path/to/your/default/source/directory"

# Function to display help
show_help() {
    echo "Usage: sudo ./backup.sh [-s source] -d destination"
    echo
    echo "Options:"
    echo "  -s source       Specify the source directory (optional)"
    echo "  -d destination  Specify the destination directory (required)"
    echo
    echo "If the source directory is not specified, the default source directory will be used."
    echo "The script will overwrite files with the same name but different sizes, and skip files with the same name, size, and hash."
}

# Parse command line arguments
while getopts ":s:d:h" opt; do
  case ${opt} in
    s )
      src=$OPTARG
      ;;
    d )
      dest=$OPTARG
      ;;
    h )
      show_help
      exit 0
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      show_help
      exit 1
      ;;
    : )
      echo "Invalid option: -$OPTARG requires an argument" 1>&2
      show_help
      exit 1
      ;;
  esac
done

# Check if destination is provided
if [ -z "$dest" ]; then
  echo "Destination is required."
  show_help
  exit 1
fi

# Use default source if not provided
if [ -z "$src" ]; then
  src=$DEFAULT_SRC
fi

# Check if the destination exists
if [ ! -d "$dest" ]; then
  echo "Destination does not exist. Please check the path and try again."
  exit 1
fi

# Calculate total size of the source directory
total_size=$(du -sb "$src" | awk '{print $1}')

# Run the backup with sudo permission and show progress bar
sudo rsync -a --delete --ignore-existing --checksum "$src"/* "$dest" | pv -s $total_size > /dev/null

# Confirm completion
echo "Backup completed successfully!"
