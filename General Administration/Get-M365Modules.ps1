<#Installs common M365 administrative modules#>
function Get-M365Modules {
    $modules = @( 
        "AzureAD",
        "ExchangeOnlineManagement",
        "Microsoft.Online.SharePoint.PowerShell",
        "MicrosoftTeams",
        "MSOnline",
        "SharePointPnPPowerShellOnline",
        "Microsoft.Graph",
        "Microsoft.Graph.Beta"
    )
    
    foreach($module in $modules){
        if (Get-Module -ListAvailable -Name $module) {
            Write-Host "Module $module is already installed." -ForegroundColor Green
        }
        else {
            Write-Host "Installing module $module" -ForegroundColor Yellow
            Install-Module -Name $module -Force -AllowClobber -Scope AllUsers -Confirm:$false
        }
    }
}

Get-M365Modules