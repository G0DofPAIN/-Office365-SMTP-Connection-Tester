# ==============================================================================
# Script Name: Test-SMTPSettings.ps1
# Description: Standard SMTP Testing Script for Office365 / Outlook
# Instructions: Run the script, enter your credentials when prompted.
#               Use an App Password if Multi-Factor Authentication (MFA) is enabled.
# ==============================================================================

Clear-Host
Write-Host "=== Office365 / Outlook SMTP Connection Tester ===" -ForegroundColor Cyan
Write-Host "Note: If MFA is enabled on your account, you MUST use an App Password." -ForegroundColor Yellow
Write-Host ""

# 1. Interactive Inputs
$UserEmail = Read-Host "Enter your Outlook/Office365 Email (e.g., user@company.com)"

if ([string]::IsNullOrEmpty($UserEmail)) {
    Write-Error "Email address cannot be empty."
    Exit
}

# Prompt for password securely (Masked input)
$SecurePassword = Read-Host "Enter your Password / App Password" -AsSecureString
$Credential = New-Object System.Management.Automation.PSCredential ($UserEmail, $SecurePassword)

# 2. Hardcoded Secure Network Settings (Office365 Standard)
$SMTPServer = "smtp.office365.com"
$SMTPPort   = 587

# Target address for the test email
$TargetRecipient = Read-Host "Enter recipient email address to send the test to"

Write-Host "`nConnecting to $SMTPServer on port $SMTPPort..." -ForegroundColor Large

# 3. Execution Block
try {
    # Preparing and sending the test mail
    Send-MailMessage -From $UserEmail `
                     -To $TargetRecipient `
                     -Subject "SMTP Test Connection Successful" `
                     -Body "This is an automated test email validating your SMTP configuration and credentials." `
                     -SmtpServer $SMTPServer `
                     -Port $SMTPPort `
                     -Credential $Credential `
                     -UseSsl `
                     -ErrorAction Stop

    Write-Host "`n[SUCCESS] Test email sent successfully to $TargetRecipient!" -ForegroundColor Green
}
catch {
    Write-Host "`n[FAILURE] Connection or Authentication failed." -ForegroundColor Red
    Write-Host "Details: $_" -ForegroundColor Red
    Write-Host "`nTroubleshooting Tips:" -ForegroundColor Yellow
    Write-Host "1. Double-check if your password or App Password is correct."
    Write-Host "2. Ensure Security Defaults or SMTP Auth policies in Microsoft 365 admin center allow SMTP AUTH."
    Write-Host "3. If using Modern Auth (OAuth2), standard SMTP via Send-MailMessage might be restricted."
}