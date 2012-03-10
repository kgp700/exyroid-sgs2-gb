#!/sbin/busybox sh

if [ -f /system/xbin/su ] || [ -f /system/bin/su ];
then
	echo "already ROOTED"
else
	echo "Copying su binary"
	/sbin/busybox mount /system -o remount,rw
	/sbin/busybox rm -f /system/bin/su
	/sbin/busybox rm -f /system/xbin/su
	/sbin/busybox mkdir /system/xbin
	/sbin/busybox chmod 755 /system/xbin
	/sbin/busybox cp /res/misc/su /system/xbin/su
	/sbin/busybox chown 0.0 /system/xbin/su
	/sbin/busybox chmod 4755 /system/xbin/su
	/sbin/busybox mount /system -o remount,ro
fi

if [ -f /system/app/Superuser.apk ] || [ -f /data/app/Superuser.apk ];
then
	echo "Superuser.apk already exists"
else
	echo "Copying Superuser.apk"
	/sbin/busybox mount /system -o remount,rw
	/sbin/busybox rm -f /system/app/Superuser.apk
	/sbin/busybox rm -f /data/app/Superuser.apk
	/sbin/busybox cp /res/misc/Superuser.apk /system/app/Superuser.apk
	/sbin/busybox chown 0.0 /system/app/Superuser.apk
	/sbin/busybox chmod 644 /system/app/Superuser.apk
	/sbin/busybox mount /system -o remount,ro
fi
