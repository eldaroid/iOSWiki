iOS: Пакеты brew без sudo

В банке не разрешено дефолтное расположение brew: /opt/homebrew для Apple Silicon на arm архитектур, /usr/local for macOS для Intel чипов на x86 архитектуре.

mkdir ~/homebrew 

скачать оттуда https://github.com/Homebrew/brew/tarball/master

(echo; echo 'eval "$(~/homebrew/bin/brew shellenv)"') >> ~/.zprofile 
eval "$(~/homebrew/bin/brew shellenv)"
~/homebrew/bin/brew update --force --quiet 
chmod -R go-w "$(brew --prefix)" 




Профит, дальше можно устанавливать любые пакеты: brew install cocoapods.

brew может выдать ошибку "Error: Your Xcode is outdated. Please update to Xcode 15 (or delete it). Xcode can be updated from the App Store". Нужно: удалить строку check_xcode_minimum_version в ~/homebrew/Library/Homebrew/extend/os/mac/diagnostic.rb

Ruby
