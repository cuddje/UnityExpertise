@echo off
adb shell perfetto -c - --txt -o /data/misc/perfetto-traces/trace > perfetto_config.txt

echo buffers: { >> perfetto_config.txt
echo     size_kb: 8960 >> perfetto_config.txt
echo     fill_policy: DISCARD >> perfetto_config.txt
echo } >> perfetto_config.txt
echo buffers: { >> perfetto_config.txt
echo     size_kb: 1280 >> perfetto_config.txt
echo     fill_policy: DISCARD >> perfetto_config.txt
echo } >> perfetto_config.txt
echo data_sources: { >> perfetto_config.txt
echo     config { >> perfetto_config.txt
echo         name: "linux.process_stats" >> perfetto_config.txt
echo         target_buffer: 1 >> perfetto_config.txt
echo         process_stats_config { >> perfetto_config.txt
echo             scan_all_processes_on_start: true >> perfetto_config.txt
echo         } >> perfetto_config.txt
echo     } >> perfetto_config.txt
echo } >> perfetto_config.txt
echo data_sources: { >> perfetto_config.txt
echo     config { >> perfetto_config.txt
echo         name: "linux.ftrace" >> perfetto_config.txt
echo         ftrace_config { >> perfetto_config.txt
echo             ftrace_events: "mm_event/mm_event_record" >> perfetto_config.txt
echo             ftrace_events: "kmem/rss_stat" >> perfetto_config.txt
echo             ftrace_events: "kmem/ion_heap_grow" >> perfetto_config.txt
echo             ftrace_events: "kmem/ion_heap_shrink" >> perfetto_config.txt
echo         } >> perfetto_config.txt
echo     } >> perfetto_config.txt
echo } >> perfetto_config.txt
echo duration_ms: 30000 >> perfetto_config.txt

adb shell perfetto -c perfetto_config.txt
del perfetto_config.txt
