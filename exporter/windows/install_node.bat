@echo off
@echo Install Node_Exporter...
pushd %~dp0

IF "%PROCESSOR_ARCHITECTURE%" == "X86" (
    msiexec /x %~dp0x86\windows_exporter-0.23.1-386.msi /q
    msiexec /i %~dp0x86\windows_exporter-0.23.1-386.msi ENABLED_COLLECTORS="ad,adfs,cache,cpu,cpu_info,cs,container,dfsr,dhcp,dns,fsrmquota,iis,logical_disk,logon,memory,msmq,mssql,netframework_clrexceptions,netframework_clrinterop,netframework_clrjit,netframework_clrloading,netframework_clrlocksandthreads,netframework_clrmemory,netframework_clrremoting,netframework_clrsecurity,net,os,process,remote_fx,service,tcp,time,vmware" TEXTFILE_DIR="C:\custom_metrics" /q
) ELSE (
    msiexec /x %~dp0x64\windows_exporter-0.23.1-amd64.msi /q
    msiexec /i %~dp0x64\windows_exporter-0.23.1-amd64.msi ENABLED_COLLECTORS="ad,adfs,cache,cpu,cpu_info,cs,container,dfsr,dhcp,dns,fsrmquota,iis,logical_disk,logon,memory,msmq,mssql,netframework_clrexceptions,netframework_clrinterop,netframework_clrjit,netframework_clrloading,netframework_clrlocksandthreads,netframework_clrmemory,netframework_clrremoting,netframework_clrsecurity,net,os,process,remote_fx,service,tcp,time,vmware" TEXTFILE_DIR="C:\custom_metrics" /q
)

@popd