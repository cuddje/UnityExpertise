adb shell perfetto \
  -c - --txt \
  -o /data/misc/perfetto-traces/trace \
<<EOF

buffers: {
    size_kb: 63488
    fill_policy: DISCARD
}
buffers: {
    size_kb: 2048
    fill_policy: DISCARD
}
data_sources: {
    config {
        name: "android.packages_list"
        target_buffer: 1
    }
}
data_sources: {
    config {
        name: "linux.system_info"
        target_buffer: 1
    }
}
data_sources: {
    config {
        name: "linux.ftrace"
        ftrace_config {
        }
    }
}
duration_ms: 10000

EOF
