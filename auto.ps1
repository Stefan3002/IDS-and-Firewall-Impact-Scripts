# Define the number of iterations and the command to measure
$iterations = 500
$source = "C:\Users\secri\Desktop\Halloween+Candy+Rankings\*"
$destination = "C:\Users\secri\Desktop\Halloween+Candy+Rankings+COPY1"
$results = @()

# Loop to run Measure-Command
for ($i = 1; $i -le $iterations; $i++) {
    $time = Measure-Command { xcopy $source $destination /i /e /q /y }
    $results += [PSCustomObject]@{
        Iteration = $i
        Seconds = $time.TotalSeconds
        Milliseconds = $time.TotalMilliseconds
    }
    Write-Host "Iteration $i completed: $($time.TotalSeconds) seconds"
}

# Save results to a CSV file
$results | Export-Csv -Path "C:\Users\secri\Desktop\copy_times.csv" -NoTypeInformation -Force
Write-Host "Results saved to C:\Users\secri\Desktop\copy_times.csv"
