# Scoop
if (-Not(Get-Command "scoop" -errorAction SilentlyContinue))
{
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') -ErrorAction SilentlyContinue
}
scoop bucket add extras

# NSSM
scoop install nssm --global

# Exporter
scoop bucket add nvidia_gpu_exporter https://github.com/utkuozdemir/scoop_nvidia_gpu_exporter.git
scoop install nvidia_gpu_exporter/nvidia_gpu_exporter --global
If (-Not(Get-Service "nvidia_gpu_exporter" -ErrorAction SilentlyContinue))
{
    nssm install nvidia_gpu_exporter "C:\ProgramData\scoop\apps\nvidia_gpu_exporter\current\nvidia_gpu_exporter.exe"
}
Start-Service nvidia_gpu_exporter