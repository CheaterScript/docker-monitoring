@echo off

pushd %~dp0

IF "%PROCESSOR_ARCHITECTURE%" == "X86" (
    @echo Uninstall Node_Exporter...
    msiexec /x %~dp0x86\windows_exporter-0.23.1-386.msi /q
    @echo Uninstall Nvidia_GPU_Exporter...
    x86\nssm.exe stop nvidia_gpu_exporter
    x86\nssm.exe remove nvidia_gpu_exporter confirm
) ELSE (
    @echo Uninstall Node_Exporter...
    msiexec /x %~dp0x64\windows_exporter-0.23.1-amd64.msi /q
    @echo Uninstall Nvidia_GPU_Exporter...
    x64\nssm.exe stop nvidia_gpu_exporter
    x64\nssm.exe remove nvidia_gpu_exporter confirm
)

@popd
@echo Uninstall Success!
pause