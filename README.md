# IDS and Firewall Impact Scripts

This repository contains the benchmarking and testing scripts used in the study **"Assessing the Performance Overhead of Firewall-based Intrusion Detection Systems on Home Computers"**, accepted at **ICCCI 2025**. The research investigates the performance implications of running firewall and IDS software on everyday systems, focusing on metrics relevant to regular users, such as RAM usage, boot time, and network performance.

## 📋 Overview

The scripts included here were designed to:

- Benchmark **file copy speeds** (local and network)
- Analyze the **performance impact** of software such as Snort, Avast One, and GData firewalls on both Windows and Ubuntu systems

## 🧪 Test Scenarios

The system was tested under four configurations:

1. **Baseline** – No firewall or IDS active  
2. **Firewall only** – Avast One / GData on Windows; Ubuntu built-in firewall  
3. **IDS only** – Snort on Ubuntu  
4. **Both active** – Firewall and IDS running simultaneously

## 📁 Folder Structure

- `local-copy/` – Scripts for measuring file copy performance on the same machine  
- `remote-download/` – Scripts for measuring upload/download times via SFTP  
- `remote-download/` – Scripts for measuring upload/download times via SFTP   

## 📊 Metrics Collected in the Study

- Boot time (seconds)  
- RAM usage (GB)  
- Number of system processes  
- File copy time (seconds)  
- SFTP upload/download speed (seconds)

## 📖 Reference

If you use or reference this work, please cite the following paper:

```bibtex
@inproceedings{secrieru2025ids,
  author    = {Ștefan Secrieru and Sebastian-Aurelian Ștefănigă},
  title     = {Assessing the Performance Overhead of Firewall-based Intrusion Detection Systems on Home Computers},
  booktitle = {Proceedings of the 17th International Conference on Computational Collective Intelligence (ICCCI)},
  year      = {2025},
  note      = {Forthcoming},
}
```

## 🔧 Requirements

- Python 3.x  
- Linux utilities (e.g., `systemd-analyze`, `top`)  
- FileZilla for SFTP tests  
- Snort 3.x (for Ubuntu-based IDS testing)

## Disclaimer

Any password used in the files have been utilized for testing purposes only, and have been changed / deactivated before the scripts were made open-source.

## 📬 Contact

For questions or collaboration inquiries, please contact:

**Ștefan Secrieru**  
Email: stefan.secrieru@e-uvt.ro 
GitHub: [@Stefan3002](https://github.com/Stefan3002)
