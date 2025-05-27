# 🧹 Auto_Clean

A Bash script that detects your operating system and automates system cleanup accordingly. Supports major Linux distributions and macOS.

---

## 🚀 How to Run

1. **Clone the repository:**

   ```bash
   git clone https://github.com/rakshitmalik136/Auto_Clean.git
   ```

2. **Navigate to the directory:**

   ```bash
   cd Auto_Clean/
   ```

3. **Run the script:**

   ```bash
   ./system_cleanup.sh
   ```

---

## ⏰ Automate with Cron

You can set up a cron job to run the cleanup script automatically at regular intervals (e.g., every Sunday at 2:00 AM).

### 🔧 Steps to Add Cron Job

1. Open the crontab editor:

   ```bash
   crontab -e
   ```

2. Add the following line at the end of the file:

   ```bash
   0 2 * * 0 /bin/bash /full/path/to/Auto_Clean/system_cleanup.sh >> /var/log/system_cleanup.log 2>&1
   ```

   🔍 **Explanation:**
   - `0 2 * * 0` → Runs at 2:00 AM every Sunday
   - `/bin/bash` → Ensures it's executed in Bash
   - `/full/path/to/Auto_Clean/system_cleanup.sh` → Replace with the **absolute path** to your script
   - `>> /var/log/system_cleanup.log 2>&1` → Appends output (stdout + stderr) to a log file

3. Save and exit. Cron will automatically schedule the job.

---

## ⚠️ Note

This script **will not work on Windows**, due to the following reasons:

- Windows uses **PowerShell/CMD**, not Bash.
- Commands like `apt`, `dnf`, `journalctl`, etc., are **Linux/macOS specific**.
- Even on **WSL (Windows Subsystem for Linux)**, cleanup applies only to the Linux subsystem, **not** the actual Windows OS.

---

## 💡 Tip

Make sure to give execute permission if needed:

```bash
chmod +x system_cleanup.sh
```

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
