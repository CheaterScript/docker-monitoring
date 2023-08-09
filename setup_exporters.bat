@echo off
@echo Setup Exporters...
pushd %~dp0

call %~dp0exporter\windows\install.bat

@popd