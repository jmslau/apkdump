# apkdump
Bash script that dumps all APKs from a connected device.

## Usage
1. Ensure you have Android SDK installed on your computer and that adb is in your path.
2. Connect a developer-enabled device to your computer (something that has bash on it).
2. Download `apk_dump.sh`
3. `chmod +x ./apk_dump.sh`
4. `adb shell pm list packages > packages.txt`
5. `./apk_dump.sh packages.txt`

The Extracted APKs will be copied into ./apks.
