@echo on

pushd %~dp0

call %~dp0\install_node.bat
call %~dp0\install_gpu_exporter.bat

start http://127.0.0.1:9835/
start http://127.0.0.1:9182/
@popd