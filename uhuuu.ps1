# Solicita elevação de privilégios
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Lista todas as unidades
$drives = Get-PSDrive -PSProvider 'FileSystem'

foreach ($drive in $drives) {
    $drivePath = $drive.Root
    Write-Host "Limpando unidade $drivePath"
    
    # Remove todos os arquivos e pastas
    Get-ChildItem -Path $drivePath -Force -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    
    # Sobrescreve o espaço livre (requer o utilitário cipher.exe do Windows)
    cipher /w:$drivePath
}

Write-Host "Todas as unidades foram limpas e o espaço livre foi sobrescrito."
Read-Host -Prompt "Pressione Enter para sair"