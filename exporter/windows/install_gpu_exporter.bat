@echo off
@echo install Nvidia_GPU_Exporter
pushd %~dp0

IF "%PROCESSOR_ARCHITECTURE%" == "X86" (
x86\nssm.exe install nvidia_gpu_exporter %~dp0x86\nvidia_gpu_exporter.exe
x86\nssm.exe start nvidia_gpu_exporter
) ELSE (
x64\nssm.exe install nvidia_gpu_exporter %~dp0x64\nvidia_gpu_exporter.exe
x64\nssm.exe start nvidia_gpu_exporter
)

@popd