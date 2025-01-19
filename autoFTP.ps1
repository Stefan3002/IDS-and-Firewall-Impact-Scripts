Import-Module Posh-SSH

# Define variables
$SFTP_User = "ubuntu"
$SFTP_Host = "85.120.206.53"
$Remote_Dir = "/home/ubuntu/CYBERSEC-tests"
$Local_Folder = "C:\Users\secri\Desktop\100MB.zip"  # Local folder path
$Output_CSV = "transfer_times.csv"

# Create the CSV header if not exists
if (-not (Test-Path $Output_CSV)) {
    "Timestamp,TransferTime" | Out-File $Output_CSV
}

# Loop to send folder multiple times
for ($i = 1; $i -le 500; $i++) {  # Run 1 time, adjust as needed

	

   

    # Send the folder using SFTP (via Posh-SSH module)
    $sftpSession = New-SFTPSession -ComputerName $SFTP_Host -Credential (New-Object System.Management.Automation.PSCredential($SFTP_User, (ConvertTo-SecureString "OJI5030ONi" -AsPlainText -Force))) -KeyFile "C:\Users\secri\Desktop\personal_laptop_key\openssh"
    

	Remove-SFTPItem -SessionId $sftpSession.SessionId -Path "/home/ubuntu/CYBERSEC-tests/100MB.zip"
 $Start_Time = Get-Date  # Record start time

    # Use Set-SFTPItem to transfer the folder (with -Recurse to include subfolders and files)
    Set-SFTPItem -SessionId $sftpSession.SessionId -Path $Local_Folder -Destination $Remote_Dir

    $End_Time = Get-Date  # Record end time

    # Calculate transfer time in seconds
    $Transfer_Time = ($End_Time - $Start_Time).TotalSeconds

    # Get timestamp
    $Timestamp = $End_Time.ToString("yyyy-MM-dd HH:mm:ss")

    # Write results to CSV
    "$Timestamp,$Transfer_Time" | Out-File $Output_CSV -Append

    Write-Host "Transfer $i completed in $Transfer_Time seconds."
}


# Close the SFTP session
Remove-SFTPSession -SessionId $sftpSession.SessionId
