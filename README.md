# MD5 Collision

This repository contains my implementation and exploration of MD5 hash collisions, based on the ECE/CS 5560 course lab. The goal of the lab is to demonstrate how MD5 collisions can be generated and exploited using available tools, and to understand the underlying vulnerabilities in the MD5 hashing algorithm.

## 🔍 Overview

The lab is structured into four major tasks, progressing from basic collision validation to generating functional scripts with identical MD5 hashes but different behaviors.

📄 A detailed lab report documenting all steps, commands, observations, and analysis is included here:
- `MD5_collision_report.pdf`

## 📁 Project Structure

```
.
├── task1/                      # Verifying known MD5 collisions and SHA-256 differences
├── task2/                      # Generating new MD5 collisions using fastcoll
├── task3/                      # Constructing same-prefix collision files with different suffix behavior
├── task4/                      # Bonus: Creating real-world files (e.g. PDF) with same MD5 hash
├── md5-collision-instructions.docx   # Official lab handout and assignment instructions
└── MD5_collision_report.pdf   # My detailed report 
```

## 🧪 Lab Tools & Setup

- **fastcoll**: Tool by Marc Stevens for generating MD5 collisions  
  Source: http://www.win.tue.nl/hashclash/fastcoll_v1.0.0.5-1_source.zip
- **OpenSSL**: Used for verifying MD5 and SHA-256 hashes
- **xxd**: Converts between binary and hexadecimal representations
- **bash**: For script creation and behavior testing

## 🚩 Lab Tasks

### Task 1: Verifying Known MD5 Collisions

- Convert provided hex strings to binary:
  ```bash
  xxd -r -p file1.hex > file1
  xxd -r -p file2.hex > file2
  ```
- Confirm collision:
  ```bash
  openssl dgst -md5 file1 file2    # Should match
  openssl dgst -sha256 file1 file2 # Should differ
  ```

### Task 2: Generating Custom MD5 Collisions

- Create initial messages:
  ```bash
  echo "Message A" > file1
  echo "Message B" > file2
  ```
- Generate collision:
  ```bash
  time ./fastcoll -o file1 file2
  ```
- Verify and analyze:
  ```bash
  xxd -p file1
  openssl dgst -md5 file1 file2
  openssl dgst -sha256 file1 file2
  ```

### Task 3: Same Prefix, Different Behavior

- Create prefix and suffix script parts
- Generate colliding binaries:
  ```bash
  fastcoll -p prefix -o col1 col2
  cat col1 suffix > file1.sh
  cat col2 suffix > file2.sh
  ```
- Validate MD5 collision and behavior:
  ```bash
  chmod +x file1.sh file2.sh
  ./file1.sh
  ./file2.sh
  ```

- Final product: Create two scripts (`good.sh`, `evil.sh`) with identical MD5 hashes but different printed messages:
  - `good.sh`: prints `I mean no harm.`
  - `evil.sh`: prints `Your computer is hacked!`

### Task 4 (Extra Credit): Real-World File Collisions

- Pick a format like PDF or JPG
- Use `fastcoll` or adapted tooling to create two files with:
  - Identical MD5
  - Different SHA-256
  - Different content or rendering

## 📝 Report

All experiments, commands, outputs, analysis, and screenshots are documented in [`MD5_Collision_Report.pdf`](./MD5_Collision_Report.pdf).  
This report includes:

- Task walkthroughs
- Hash output comparisons
- Behavioral analysis of collisions
- Reflections on MD5 insecurity

## 📚 Credit

- Lab based on material from **ECE/CS 5560 - Fundamentals of Information Security**
- MD5 collision tool by Marc Stevens: http://www.win.tue.nl/hashclash
- Visual inspiration from [corkami/collisions](https://github.com/corkami/collisions)
