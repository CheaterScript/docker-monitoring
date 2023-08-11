@echo off
@echo Stop Exporters...
pushd %~dp0

netsh advfirewall firewall add rule name=9182 protocol=TCP localport=9182 dir=in action=block
netsh advfirewall firewall add rule name=9835 protocol=TCP localport=9835 dir=in action=block

call %~dp0exporter\windows\uninstall.bat

@popd