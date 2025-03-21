```markdown
# Backup Script

## Overview

This repository contains a bash script designed to back up files and directories from a specified source location to a destination location, such as an external hard drive or USB drive. The script uses `rsync` for efficient file transfer and `pv` for displaying a progress bar.

## Features

- **Source and Destination Specification**: Allows the user to specify the source and destination directories via command-line arguments.
- **Default Source Directory**: Uses a default source directory if none is specified.
- **Progress Bar**: Displays a progress bar during the file transfer process.
- **File Overwrite and Skip Logic**: Overwrites files with the same name but different sizes, skips files with the same name, size, and hash.
- **Help Menu**: Provides usage instructions and options.

## Requirements

- `rsync`: A fast and versatile file copying tool.
- `pv`: A tool for monitoring the progress of data through a pipeline.

### Installation

To install `rsync` and `pv`, run the following commands:

```bash
sudo apt-get install rsync
sudo apt-get install pv
```

## Usage

### Basic Usage

To back up files from the default source directory to a specified destination:

```bash
sudo ./backup.sh -d "destination location"
```

### Specifying Source and Destination

To specify both the source and destination directories:

```bash
sudo ./backup.sh -s "source location" -d "destination location"
```

### Help Menu

To display the help menu with usage instructions:

```bash
sudo ./backup.sh -h
```

## Script Details

### Script Logic

1. **Help Menu**: Displays usage instructions and options.
2. **Argument Parsing**: Parses command-line arguments for source and destination directories.
3. **Default Source Directory**: Uses a default source directory if none is specified.
4. **Destination Check**: Checks if the destination directory exists.
5. **Total Size Calculation**: Calculates the total size of the source directory for the progress bar.
6. **File Transfer**: Uses `rsync` to transfer files from the source to the destination, displaying a progress bar with `pv`.

### Example Output

```bash
sending incremental file list
0fc9a59967013eb0489422f8d5824f6d.jpeg
        691,063 100%    1.42MB/s    0:00:00 (xfr#1, to-chk=19/20)
34816-1920x1080-desktop-full-hd-naruto-background-photo.jpg
        205,465 100%  453.96kB/s    0:00:00 (xfr#2, to-chk=18/20)
...
Backup completed successfully!
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgements

- rsync
- pv

```
