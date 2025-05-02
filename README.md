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
