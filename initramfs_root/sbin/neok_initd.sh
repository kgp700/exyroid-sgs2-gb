#!/system/bin/sh

echo $(date) USER INIT START 
if cd /system/etc/init.d >/dev/null 2>&1 ; then 
for file in S* ; do 
if ! ls "$file" >/dev/null 2>&1 ; then continue ; fi 
echo "START '$file'" 
        /system/bin/sh "$file" 
        echo "EXIT '$file' ($?)" 
    done 
fi
