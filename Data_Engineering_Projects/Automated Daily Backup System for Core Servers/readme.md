# 🗄️ Automated Daily Backup System for Core Servers

> A zero-touch Bash automation solution for secure, scheduled backup of critical server files — eliminating manual bottlenecks and human error.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Solution](#solution)
- [How It Works](#how-it-works)
- [Usage](#usage)
- [Cron Scheduling](#cron-scheduling)
- [Skills & Technologies](#skills--technologies)

---

## Overview

Designed and implemented as part of a Lead Linux Developer role at **ABC International Inc.**, this project automates the identification, compression, and secure storage of files modified within the last 24 hours — replacing a fragile, manual intern-driven process.

---

## Problem Statement

The previous workflow required interns to **manually** identify and back up recently updated files (including sensitive encrypted password files). This approach was:

| Issue | Description |
|-------|-------------|
| ⏱️ **Time-consuming** | Significant daily manual labor |
| 🔓 **Insecure** | Prone to human error and unauthorized access |
| 📂 **Inefficient** | Lacked a standardized archiving format |

---

## Solution

A single Bash script — `backup.sh` — that fully automates the backup pipeline:

```
Identify modified files (last 24h) → Collect into array → Compress to .tar.gz → Store in destination
```

Scheduled via **Cron** for nightly execution at midnight with zero human intervention.

---

## How It Works

### 1. 🔧 Environment Configuration

The script accepts the **source** and **destination** directories as command-line arguments and uses `pwd` for absolute path resolution — ensuring correctness regardless of execution context.

### 2. ⏰ Temporal Filtering (24-Hour Window)

```bash
currentTS=$(date +%s)
yesterdayTS=$((currentTS - 86400))   # 86,400 seconds = 24 hours

for file in "$targetDir"/*; do
    fileTS=$(date -r "$file" +%s)
    if [[ $fileTS -gt $yesterdayTS ]]; then
        toBackup+=("$file")
    fi
done
```

- Captures current Unix timestamp
- Derives a threshold (`yesterdayTS`) by subtracting 86,400 seconds
- Compares each file's last-modified timestamp against the threshold

### 3. 📦 Efficient Archiving

Modified files are collected into a **Bash Array**, then passed to `tar` in a single operation:

```bash
tar -czvf "$destDir/backup-$(date +%Y-%m-%d).tar.gz" "${toBackup[@]}"
```

- Minimizes disk I/O
- Produces a portable, compressed `.tar.gz` archive
- Archive name is timestamped for easy versioning

### 4. 🤖 Cron Automation

The script is registered in `crontab` to run **every night at midnight**:

```
0 0 * * * /path/to/backup.sh /home/user/source /home/user/backups
```

---

## Usage

### Prerequisites

- Linux/macOS environment
- Bash 4+
- `tar` and `gzip` installed (standard on most systems)

### Setup

```bash
# 1. Clone or download the script
git clone https://github.com/your-username/automated-backup-system.git
cd automated-backup-system

# 2. Grant execution permissions
chmod +x backup.sh

# 3. Run manually (Target → Destination)
./backup.sh /home/user/source /home/user/backups
```

---

## Cron Scheduling

To enable fully automated nightly backups:

```bash
# Open crontab editor
crontab -e

# Add this line to schedule at midnight daily
0 0 * * * /absolute/path/to/backup.sh /home/user/source /home/user/backups
```

Verify the job is registered:

```bash
crontab -l
```

---

## Skills & Technologies

| Category | Details |
|----------|---------|
| 🐚 **Scripting** | Advanced Bash — loops, arrays, conditionals |
| 🖥️ **System Administration** | `chmod`, directory navigation, Cron scheduling |
| 🗜️ **Data Management** | Archiving & compression with `tar` and `gzip` |
| ⚙️ **Automation** | Manual-to-scheduled workflow transformation |

---

## Author

**Lead Linux Developer** @ ABC International Inc.

---

*Built to make backups boring — because boring means it's working.*
