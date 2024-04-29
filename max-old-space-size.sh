#!/usr/bin/env bash

# Automatic setting of NODE_OPTIONS for `--max-old-space-size`

max_mem=$(cat /sys/fs/cgroup/memory.max)
max_mem_mb=$(($max_mem/1024/1024))

case $max_mem_mb in

    # 512MB - Render Free & Starter
    512)
        export NODE_OPTIONS="--max-old-space-size=420 $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
        ;;
    # 2GB - Render Standard
    2048)
        export NODE_OPTIONS="--max-old-space-size=1536 $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
        ;;
    # 4GB - Render Pro
    4096)
        export NODE_OPTIONS="--max-old-space-size=3548 $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
        ;;
    # 8GB - Render Pro Plus
    8192)
        export NODE_OPTIONS="--max-old-space-size=7680 $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
        ;;
    # 16GB - Render Pro Max
    16384)
        export NODE_OPTIONS="--max-old-space-size=15872 $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
        ;;
    # 32GB - Render Pro Ultra
    32768)
        export NODE_OPTIONS="--max-old-space-size=32256 $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
        ;;
    # Custom Plan
    *)
        # max mem - 512MB (same as above)
        custom_max_mem=$(($max_mem_mb-512))
        export NODE_OPTIONS="--max-old-space-size=$custom_max_mem $NODE_OPTIONS"
        echo "setting NODE_OPTIONS=$NODE_OPTIONS"
esac
