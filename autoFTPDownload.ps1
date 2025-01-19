Import-Module Posh-SSH

# Define variables
$SFTP_User = "ubuntu"
$SFTP_Host = "85.120.206.53"
$Remote_Dir = "/home/ubuntu/CYBERSEC-tests/remote_down.zip"
$Local_Folder = "C:\Users\secri\Desktop\remote_down"  # Local folder path
$Output_CSV = "transfer_times_download.csv"

# Create the CSV header if not exists
if (-not (Test-Path $Output_CSV)) {
    "Timestamp,TransferTime" | Out-File $Output_CSV
}

# Loop to send folder multiple times
for ($i = 1; $i -le 500; $i++) {  # Run 1 time, adjust as needed

	

   

    # Send the folder using SFTP (via Posh-SSH module)
    $sftpSession = New-SFTPSession -ComputerName $SFTP_Host -Credential (New-Object System.Management.Automation.PSCredential($SFTP_User, (ConvertTo-SecureString "OJI5030ONi" -AsPlainText -Force))) -KeyFile "C:\Users\secri\Desktop\personal_laptop_key\openssh"
    

	Remove-Item -Path "C:\Users\secri\Desktop\remote_down\remote_down.zip" -Recurse -Force

 $Start_Time = Get-Date  # Record start time

    # Use Set-SFTPItem to transfer the folder (with -Recurse to include subfolders and files)
    Get-SFTPItem -SessionId $sftpSession.SessionId -Path $Remote_Dir -Destination $Local_Folder


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
