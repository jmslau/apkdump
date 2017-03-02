for line in $(cat $1)
do

   #echo $line
   # Get package name
   pkg_name=${line#*:}
   #echo "Package Name: $pkg_name"

   # Get path of that package
   path=$(adb shell pm path $pkg_name)
   path=${path#*:}
   #echo "Path: $path"
   
   # Pull it off and make it some unique APK name

   dest=${path#/data/app/}
   dest=${dest#/system/priv-app/}
   dest=${dest#/system/app/}
   dest=${dest#/vendor/app/}
   dest=${dest%/base.apk}
   dest=${dest%.apk}
   dest=${dest#*/}
   dest="$dest.apk"
   
   echo "Pulling $dest"

   # Create dir if it doesn't exist
   [ ! -d ./apks  ] && mkdir ./apks
   
   [ ! -f ./apks/$dest ] && adb pull $path ./apks/$dest
   
   
done
