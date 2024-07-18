function Send-Email {
    param(
        [string]$To,
        [string]$From,
        [string]$Subject,
        [string]$Body,
        [string]$SmtpServer,
        [string]$SmtpUsername,  # Add parameters for SMTP username and password
        [string]$SmtpPassword,  # Add parameters for SMTP username and password
        [string]$AttachmentFilePath = $null
    )

    # Create a MailMessage object
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = $From
    $message.To.Add($To)
    $message.Subject = $Subject
    $message.Body = $Body

    # Attach the file if provided
    if ($AttachmentFilePath) {
        $attachment = New-Object System.Net.Mail.Attachment($AttachmentFilePath)
        $message.Attachments.Add($attachment)
    }

    # Create a SmtpClient object
    $smtp = New-Object System.Net.Mail.SmtpClient($SmtpServer)

    # Specify credentials and enable SSL/TLS encryption
    $smtp.Credentials = New-Object System.Net.NetworkCredential($SmtpUsername, $SmtpPassword)
    $smtp.EnableSsl = $true

    # Send the email
    $smtp.Send($message)
}
