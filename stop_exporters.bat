@echo off
@echo Stop Exporters...
pushd %~dp0

call %~dp0exporter\windows\uninstall.bat

@popd