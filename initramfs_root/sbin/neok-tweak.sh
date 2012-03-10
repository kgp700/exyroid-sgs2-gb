#!/system/bin/sh

echo "10" > /proc/sys/vm/vfs_cache_pressure
echo "10" > /proc/sys/vm/swappiness
echo "0" > /sys/block/mmcblk0/queue/iostats
echo "30" > /proc/sys/vm/dirty_ratio
echo "1" > /proc/sys/vm/oom_kill_allocating_task
echo "3" > /sys/module/cpuidle/parameters/enable_mask

sync
echo "3" > /proc/sys/vm/drop_caches

# Remount ext4 partitions with optimizations
  for k in $(/sbin/busybox mount | /sbin/busybox grep ext4 | /sbin/busybox cut -d " " -f3)
  do
        sync
        /sbin/busybox mount -o remount,commit=15 $k
  done

exit;
