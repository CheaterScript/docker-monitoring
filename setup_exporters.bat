@echo off
@echo Setup Exporters...
pushd %~dp0

netsh advfirewall firewall add rule name=9182 protocol=TCP localport=9182 dir=in action=allow
netsh advfirewall firewall add rule name=9835 protocol=TCP localport=9835 dir=in action=allow

call %~dp0exporter\windows\install.bat

@popd