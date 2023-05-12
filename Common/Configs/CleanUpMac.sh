# To start a project copy content below to file: vim CleanUpMac.sh, make it executable: chmod +x, then run: time sh CleanUpMac.sh
# &>/dev/null - Смысл вкратце — "Весь вывод указанной команды (вывод в терминале) спихнуть в черную дыру!"

# Colored output in terminal
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
rm -rf ~/Library/Caches/* &>/dev/null
echo "${Green}done cleaning from ~/Library/Caches"
# user logs
echo "${Blue}cleaning user log file from ~/Library/logs"
rm -rf ~/Library/logs/* &>/dev/null
echo "${Green}done cleaning from ~/Library/logs"
# user preference log
echo "${Blue}cleaning user preference logs"
# rm -rf ~/Library/Preferences/*
echo "${Green}done cleaning from /Library/Preferences"
# system caches
echo "${Blue}cleaning system caches"
sudo rm -rf /Library/Caches/* &>/dev/null
echo "${Green}done cleaning system cache"
# system logs
echo "${Blue}cleaning system logs from /Library/logs"
sudo rm -rf /Library/logs/* &>/dev/null
echo "${Green}done cleaning from /Library/logs"
echo "${Blue}cleaning system logs from /var/log"
sudo rm -rf /var/log/* &>/dev/null
echo "${Green}done cleaning from /var/log"
echo "${Blue}cleaning from /private/var/folders"
sudo rm -rf /private/var/folders/* &>/dev/null
echo "${Green}done cleaning from /private/var/folders"
# Homebrew
echo "${Blue}cleaning cache Homebrew"
brew cleanup --force -s &>/dev/null
brew cask cleanup &>/dev/null
rm -rfv /Library/Caches/Homebrew/* &>/dev/null
brew tap --repair &>/dev/null
echo "${Green}done cleaning Homebrew"
# Xcode
echo "${Blue}cleaning cache Xcode"
xcrun simctl delete unavailable &>/dev/null
xcodebuild -alltargets clean &>/dev/null
rm -rf ~/Library/Preferences/com.apple.Xcode.plist/* &>/dev/null
rm -rf ~/Library/Developer/Xcode/DerivedData &>/dev/null
rm -rf ~/Library/Developer/CoreSimulator &>/dev/null
rm -rf ~/Library/Developer/Xcode/Archives &>/dev/null
rm -rf ~/Library/Developer/Xcode/iOS DeviceSupport &>/dev/nul
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache" &>/dev/null
echo "${Green}done cleaning Xcode"
# Удалите неиспользуемые пакеты и кеши anaconda
echo "${Blue}cleaning anaconda"
conda clean --dry-run --all &>/dev/null
conda config --set auto_activate_base false &>/dev/null
echo "${Green}done cleaning anaconda"
# MS Teams
echo "${Blue}cleaning MS Teams"
rm -rf ~/Library/Application\ Support/Microsoft/Teams/Cache/* &>/dev/null
rm -rf ~/Library/Application\ Support/Microsoft/Teams/Service\ Worker/CacheStorage/* &>/dev/null
echo "${Green}done cleaning MS Teams"
# Slack:
echo "${Blue}cleaning Slack"
rm -rf ~/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application\ Support/Slack/Cache &>/dev/null
rm -rf ~/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application\ Support/Slack/Service\ Worker/CacheStorage &>/dev/null
echo "${Green}done cleaning slack"
# ios photo caches
echo "${Blue}cleaning ios photo caches"
rm -rf ~/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/* &>/dev/null
echo "${Green}done cleaning from ~/Pictures/iPhoto Library/iPod Photo Cache"
# application caches
echo "${Blue}cleaning application caches"
for x in $(ls ~/Library/Containers/)
do
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/* &>/dev/null
    echo "${Green}done cleaning ~/Library/Containers/$x/Data/Library/Caches"
done
echo "${BGreen}done cleaning for application caches"

newAvailable=$(df / | tail -1 | awk '{print $4}')
count=$((newAvailable - oldAvailable))
bytesToHuman $count

echo "${BIPurple}Now you can go to open source mac-cleanup project for the ongoing cleaning mac: ${BIGreen}github.com/fwartner/mac-cleanup${Color_Off}"
