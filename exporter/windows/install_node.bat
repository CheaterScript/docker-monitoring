@echo off
@echo Install Node_Exporter...
pushd %~dp0

IF "%PROCESSOR_ARCHITECTURE%" == "X86" (
    msiexec /x %~dp0x86\windows_exporter-0.23.1-386.msi /q
    msiexec /i %~dp0x86\windows_exporter-0.23.1-386.msi ENABLED_COLLECTORS="ad,iis,logon,memory,process,tcp,thermalzone" /q
) ELSE (
    msiexec /x %~dp0x64\windows_exporter-0.23.1-amd64.msi /q
    msiexec /i %~dp0x64\windows_exporter-0.23.1-amd64.msi ENABLED_COLLECTORS="ad,iis,logon,memory,process,tcp,thermalzone" /q
)

@popd