Clear-Host

# Require Powershell Core 6.x
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

$Credentials = (Get-Content "$PSScriptRoot\DS-Config.json" -Raw) | ConvertFrom-Json
$Manager = $Credentials.MANAGER
$Port = $Credentials.PORT
$API_Key = $Credentials.API_KEY
$Policy_ID = $Credentials.POLICYID

$API_Path = "/api/policies/"

$DSM_URI="https://" + $Manager + ":" + $Port + $API_Path + $Policy_ID

$Headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$Headers.Add("api-secret-key", $API_Key)
$Headers.Add("api-version", 'v1')

try{
    $Response = Invoke-RestMethod -Uri $DSM_URI -Method Get -Headers $Headers
}
catch{
    Write-Host "[ERROR]	Failed to get object.	$_"
    Write-Host "An error occurred during authentication. `nError returned was: $($_.Exception.Message)"
    Exit
}

$PolicyName = $Response.name
$OutputFile = "$PSScriptRoot\$PolicyName.json"
$PolicyOutput = $Response | ConvertTo-Json
Write-Output $PolicyOutput | Out-File $OutputFile
