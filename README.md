# Get-DS_Policy_Info

AUTHOR	: Yanni Kashoqa

TITLE	: Deep Security Policy Information Lookup

VERSION	: 0.1

DESCRIPTION	: This Powershell script will retrieve Deep Security Policy information for the purpose of archiving or comparison.

FEATURES:
The ability to perform the following:-
- Export policy setting by Policy ID

REQUIRMENTS

- Supports Deep Security as a Service
- PowerShell 6.0 and higher
- API Key
- Create a DS-Config.json in the same folder with the following content making sure to fill the API Key and Policy ID.
{
    "MANAGER": "app.deepsecurity.trendmicro.com",
    "PORT": "443",
    "API_KEY": "",
    "POLICYID": ""
}


