@echo off
@echo Stop Exporters...
pushd %~dp0

netsh advfirewall firewall delete rule name=9182
netsh advfirewall firewall delete rule name=9835

call %~dp0exporter\windows\uninstall.bat

@popd