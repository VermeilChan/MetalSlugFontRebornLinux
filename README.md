# MSFONT Installation Guide

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation Steps](#installation-steps)
3. [Usage](#usage)
4. [License](#license)

## Prerequisites

Before you begin the installation process, ensure that you have the following prerequisites:

- A Linux-based operating system (e.g., Debian, Ubuntu, Fedora, OpenSUSE Tumbleweed, or Arch).
- Basic knowledge of running commands in a terminal (Optional).

## Installation Steps

Follow these steps to install MSFONT on your Linux system:

1. **Download the Latest Release:**
   - Go to the [Releases page](https://github.com/VermeilChan/MetalSlugFontRebornLinux/releases) and download the latest release.

2. **Extract the Archive:**
   - After downloading the release, extract the downloaded file named `MSFONT-Linux.tar.gz` to a directory of your choice using the following command:
     ```bash
     tar -xzvf MSFONT-x86_64-Linux.tar.gz
     ```

3. **Navigate to the 'Scripts' Folder:**
   - Change your working directory to the 'Scripts' folder using the `cd` command:
     ```bash
     cd MetalSlugFontRebornLinux/Scripts
     ```

4. **Choose Your Linux Distribution:**
   - Depending on your Linux distribution, select the appropriate installation script from the following options:
     - For Ubuntu, run:
       ```bash
       bash install-msfont-ubuntu.sh
       ```
     - For Debian, run:
       ```bash
       bash install-msfont-debian.sh
       ```
     - For Fedora, run:
       ```bash
       bash install-msfont-fedora.sh
       ```
     - For openSUSE Tumbleweed, run:
       ```bash
       bash install-msfont-opensuse.sh
       ```
     - For Arch, run:
       ```bash
       bash install-msfont-arch.sh
       ```

5. **Run MSFONT:**
   - After running the appropriate installation script, all the necessary dependencies will be installed. Once the installation is complete, you can launch MSFONT by running:
     ```bash
     bash start-msfont.sh
     ```