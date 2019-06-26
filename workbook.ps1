param
(
    [Parameter (Mandatory = $false)]
    [object] $WebhookData
)

# If runbook was called from Webhook, WebhookData will not be null.
if ($WebhookData) {
 
    # Check User-Agent in the header to validate that the request is from Grafana.
    if ($WebhookData.RequestHeader.{User-Agent} -eq 'Grafana')
    {
        Write-Output "Header.User-Agent has required information"}
    else
    {
        Write-Output "Header.User-Agent missing required information";
        exit;
    }

    # Retrieve a list of VM from Webhook request body written in json format in message field.
    $vms = (ConvertFrom-Json -InputObject (ConvertFrom-Json -InputObject $WebhookData.RequestBody).message)

    # Authenticate to Azure by using the service principal and certificate. Then, set the subscription.
    Write-Output "Authenticating to Azure with service principal and certificate"
    $ConnectionAssetName = "AzureRunAsConnection"
    Write-Output "Get connection asset: $ConnectionAssetName"

    $Conn = Get-AutomationConnection -Name $ConnectionAssetName
            if ($Conn -eq $null)
            {
                throw "Could not retrieve connection asset: $ConnectionAssetName. Check that this asset exists in the Automation account."
            }
            Write-Output "Authenticating to Azure with service principal." 
            Add-AzureRmAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint | Write-Output

        # Stop each virtual machine
        foreach ($vm in $vms)
        {
            $vmName = $vm.Name
            Write-Output "Stopping $vmName"
            Stop-AzureRMVM -Name $vm.Name -ResourceGroup $vm.ResourceGroup -Force
        }
}
else {
    # Error
    write-Error "WebhookData is not found."
}