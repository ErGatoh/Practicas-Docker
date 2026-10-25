# Despliega el entorno IoT completo en Windows (PowerShell).
# Uso:  .\desplegar.ps1
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

docker info *> $null
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: Docker no está en marcha (abre Docker Desktop)"; exit 1 }

if (-not (Test-Path .env)) {
    Copy-Item .env.example .env
    Write-Host "He creado el fichero .env. Edítalo, cambia las claves y vuelve a ejecutar .\desplegar.ps1"
    exit 1
}
if (Select-String -Path .env -Pattern "cambia-" -Quiet) {
    Write-Host "ERROR: en .env quedan valores de ejemplo sin cambiar"
    exit 1
}

docker compose config --quiet
docker compose pull --quiet
docker compose up -d --wait
docker compose ps
