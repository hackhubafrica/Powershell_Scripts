# Replace with your AbuseIPDB API key
$apiKey = "ab5fb6b4d8828d26e898841a3f43d75117e5578da591a7056b430452e23c49cd415b325aa75f741e"
# IP address to check
$ip = "26.0.0.1"

# Set the headers
$headers = @{
    "Key" = $apiKey
    "Accept" = "application/json"
}

try {
    # Make the request
    $response = Invoke-RestMethod -Uri "https://api.abuseipdb.com/api/v2/check?ipAddress=$ip" -Method Get -Headers $headers

    # Output the response
    if ($response) {
        # Convert the response to JSON and format it nicely
        $jsonOutput = $response | ConvertTo-Json -Depth 4
        Write-Output $jsonOutput
    } else {
        Write-Host "No response received from AbuseIPDB."
    }
} catch {
    Write-Host "An error occurred: $_"
}
