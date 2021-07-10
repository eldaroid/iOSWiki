# To start a project make it executable: chmod +x, then run: sh CleanUpMac.sh

# Reset
Color_Off='\033[0m'       # Text Reset
BGreen='\033[1;32m'
Green='\033[0;32m'
BGreen='\033[1;32m'
Blue='\033[0;34m'
BIPurple='\033[1;95m'
BIGreen='\033[1;92m'

bytesToHuman() {
	b=${1:-0}
	d=''
	s=1
	S=(Bytes {K,M,G,T,E,P,Y,Z}iB)
	while ((b > 1024)); do
		d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
		b=$((b / 1024))
		((s++))
	done
	echo "$b$d ${S[$s]} of space was cleaned up"
}

oldAvailable=$(df / | tail -1 | awk '{print $4}')

# user cache file
echo "${Blue}cleaning user cache file from ~/Library/Caches"
rm -rf ~/Library/Caches/*
echo "${Green}done cleaning from ~/Library/Caches"
# user logs
echo "${Blue}cleaning user log file from ~/Library/logs"
rm -rf ~/Library/logs/*
echo "${Green}done cleaning from ~/Library/logs"
# user preference log
echo "${Blue}cleaning user preference logs"
# rm -rf ~/Library/Preferences/*
echo "${Green}done cleaning from /Library/Preferences"
# system caches
echo "${Blue}cleaning system caches"
sudo rm -rf /Library/Caches/*
echo "${Green}done cleaning system cache"
# system logs
echo "${Blue}cleaning system logs from /Library/logs"
sudo rm -rf /Library/logs/*
echo "${Green}done cleaning from /Library/logs"
echo "${Blue}cleaning system logs from /var/log"
sudo rm -rf /var/log/*
echo "${Green}done cleaning from /var/log"
echo "${Blue}cleaning from /private/var/folders"
sudo rm -rf /private/var/folders/*
echo "${Green}done cleaning from /private/var/folders"
# Xcode
echo "${Blue}cleaning cache Xcode"
xcrun simctl delete unavailable
xcodebuild -alltargets clean
rm -rf ~/Library/Preferences/com.apple.Xcode.plist/*
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Developer/CoreSimulator
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
echo "${Green}done cleaning Xcode"
# Удалите неиспользуемые пакеты и кеши anaconda
echo "${Blue}cleaning anaconda"
conda clean --dry-run --all
conda config --set auto_activate_base false
echo "${Green}done cleaning anaconda"
# MS Teams
echo "${Blue}cleaning MS Teams"
rm -rf ~/Library/Application\ Support/Microsoft/Teams/Cache/*
rm -rf ~/Library/Application\ Support/Microsoft/Teams/Service\ Worker/CacheStorage/*
echo "${Green}done cleaning MS Teams"
# Slack:
echo "${Blue}cleaning Slack"
rm -rf ~/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application\ Support/Slack/Cache
rm -rf ~/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application\ Support/Slack/Service\ Worker/CacheStorage
echo "${Green}done cleaning slack"
# ios photo caches
echo "${Blue}cleaning ios photo caches"
rm -rf ~/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/*
echo "${Green}done cleaning from ~/Pictures/iPhoto Library/iPod Photo Cache"
# application caches
echo "${Blue}cleaning application caches"
for x in $(ls ~/Library/Containers/) 
do 
    echo "cleaning ~/Library/Containers/$x/Data/Library/Caches/"
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/*
    echo "done cleaning ~/Library/Containers/$x/Data/Library/Caches"
done
echo "${BGreen}done cleaning for application caches"

newAvailable=$(df / | tail -1 | awk '{print $4}')
count=$((newAvailable - oldAvailable))
bytesToHuman $count

echo "${BIPurple}Now you can go to open source mac-cleanup project for the ongoing cleaning mac: ${BIGreen}github.com/fwartner/mac-cleanup"
