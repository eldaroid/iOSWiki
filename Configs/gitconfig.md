Поместить этот код в `vim ~/.gitignore`:

```
[user]
	name = eldaroid
	email = eldario10@mail.ru
[core]
	excludesfile = ~/.gitignore_global
[http]
	postBuffer = 1048576000
	maxRequestBuffer = 100M
[ssh]
	postBuffer = 2048M
	maxRequestBuffer = 1024M
 [alias]
	a = add -A
	l = ! git log --pretty=format:\"%C(yellow)%h %C(cyan)%ar [%C(blue)%an%C(reset)] %C(auto)%d | %Creset%s\" --graph --shortstat -10
	co = checkout
	cm = commit -m
# --amend добавляет изменения к предыдущему коммиту, не создавая новый
	cma = commit --amend -m
# с флагом -a можно не писать git add, но только если файлы не новый
	cam = commit -am
# для команда, начинающихся с git, нужно вставлять !
	alias = ! git config --list | grep alias
	st = ! git status && echo "Last commit hash =" $(git rev-parse --short HEAD) && echo "Commits after developer branch =" $(git cherry -v develop | wc -l)
[color "status"]
	added = green bold
	changed = yellow bold
 	untracked = red bold
[log]
	date = short
```

