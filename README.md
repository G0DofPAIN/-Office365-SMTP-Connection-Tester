# Office365 SMTP Connection Tester

A secure, interactive PowerShell tool for systems administrators to validate Office365 SMTP configurations, test credentials (including App Passwords), and troubleshoot email delivery issues without hardcoding sensitive data.

## 🚀 Features
- **Secure:** No hardcoded passwords or emails. Uses secure masked string inputs.
- **Interactive:** Prompts the user for email, password/app password, and recipient target at runtime.
- **Pre-configured:** Built specifically for Office365/Outlook environments (Port 587 with STARTTLS).

## 📋 Prerequisites
- Windows PowerShell 5.1 or PowerShell Core.
- An Office365/Outlook account.
- *Note:* If Multi-Factor Authentication (MFA) is enabled on your account, you **must** generate and use an **App Password** instead of your regular password.

## 💻 How to Use
1. Clone this repository or download the script.
2. Open PowerShell and navigate to the script's directory.
3. Run the script:
```powershell
   .\Test-SMTPSettings.ps1
