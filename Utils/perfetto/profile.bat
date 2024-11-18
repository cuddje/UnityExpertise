@echo off
setlocal enabledelayedexpansion

:: 创建一个临时配置文件
set CURRENT_DIR=%~dp0
set CONFIG_FILE=perfetto_config.txt

:: 写入配置内容
(
    echo buffers: {
    echo     size_kb: 8960
    echo     fill_policy: DISCARD
    echo }
    echo data_sources: {
    echo     config {
    echo         name: "android.ftrace"
    echo         ftrace_config {
    echo             ftrace_events: "surface/setFrameRate"
    echo         }
    echo     }
    echo }
    echo duration_ms: 30000
) > %CONFIG_FILE%

:: 执行 Perfetto
adb shell perfetto -c %CONFIG_FILE% -o /data/misc/perfetto-traces/trace

:: 删除临时配置文件
@rem del %CONFIG_FILE%

endlocal
