param([Parameter(Mandatory=$true)][string]$Root)
$ErrorActionPreference = 'Stop'
$manifest = Join-Path $Root 'passbolt/Package.appxmanifest'
if (-not (Test-Path $manifest)) { throw "Upstream manifest missing: $manifest" }
[xml]$xml = Get-Content -Raw $manifest
$ns = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
$ns.AddNamespace('p','http://schemas.microsoft.com/appx/manifest/foundation/windows10')
$ns.AddNamespace('uap','http://schemas.microsoft.com/appx/manifest/uap/windows10')
$identity = $xml.SelectSingleNode('/p:Package/p:Identity',$ns)
$identity.SetAttribute('Name','FanavaranEtelaatKhebreh.EITPass')
# Identity Publisher is a certificate subject, not a free-form company label.
# Preserve upstream subject until owner supplies matching signing identity.
$props = $xml.SelectSingleNode('/p:Package/p:Properties',$ns)
$props.SelectSingleNode('p:DisplayName',$ns).InnerText = 'EITPass'
$props.SelectSingleNode('p:PublisherDisplayName',$ns).InnerText = 'Fanavaran Etelaat Khebreh'
$visual = $xml.SelectSingleNode('/p:Package/p:Applications/p:Application/uap:VisualElements',$ns)
$visual.SetAttribute('DisplayName','EITPass')
$visual.SetAttribute('Description','EITPass password manager')
$xml.Save($manifest)
Write-Host "Updated package identity and display metadata: $manifest"
