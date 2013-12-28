export PATH=$PATH:~/yunio/software/script:/opt/bin:~/.gem/ruby/2.0.0/bin
# alias wps='/opt/wps-office_8.1.0.3718~b1_x86/wps'
# alias wpp='/opt/wps-office_8.1.0.3718~b1_x86/wpp'
# alias wet='/opt/wps-office_8.1.0.3718~b1_x86/et'

# Java
export JAVA_HOME=/opt/software/jdk/
export CLASSPATH=$JAVA_HOME:.
export JIKES_HOME=$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'/opt/avast4workstation-1.3.0/lib/avast4workstation/lib/':'/opt/avast4workstation-1.3.0/lib/avast4workstation/lib-esmtp'

export GREP_OPTIONS='--color=auto'
export EDITOR="vim"

# Set color for manpages
export LESS_TERMCAP_mb=$'\E[01;31m'		# begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'         # end mode
export LESS_TERMCAP_se=$'\E[0m'         # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'  # begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m'			# end underline
export LESS_TERMCAP_us=$'\E[01;32m'     # begin underline


export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

export EDITOR="vim"
TZ='Asia/Shanghai';
export TZ


if [[ $0 == "bash" ]]
then
	# bash
	# set -u #必须初始化变量
	set -o vi
	# set -o noclobber  #禁止输出重定向到已存在文件
	set -o ignoreeof
	shopt -s cdspell
	shopt -s autocd
	shopt -s checkhash
	shopt -s nocaseglob
	shopt -s shift_verbose

	# sync history
	shopt -s histappend
	PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

	# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
	HISTSIZE=2000
	HISTFILESIZE=2450
	export HISTTIMEFORMAT='%F %T '
	# export HISTCONTROL=erasedups:ignorespace
	export HISTCONTROL=ignoredups
	export HISTIGNORE="pwd:ls:ll:l:la:p:history"
	#append recent history to the history file
	history -a
	# Read the contents of the history file and use them as the current history.
	history -r

	. ~/.git-prompt.sh

	function reload_ps1()
	{
		PS1="\`if [[ \$? == 0 ]];
		then
			echo '[\[\e[1m\]\[\e[32m\]\u: \[\e[1m\]\[\e[37m\]\w] \[\e[1m\]\[\e[31m\][\j]\
			\n\[\e[30m\]$(__git_ps1 "[%s]")\[\e[1m\]\[\e[33m\][\!] \[\e[32m\]\$ \[\e[0m\]'
		else
			echo '[\[\e[1m\]\[\e[31m\]\u: \[\e[1m\]\[\e[31m\]\w] \[\e[1m\]\[\e[31m\][\j]\
			\n\[\e[1m\]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[1m\]\[\e[31m\][\!] \[\e[32m\]\$ \[\e[0m\]'
		fi\`"
	}
	reload_ps1

	export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
	function gco()
	{
		git checkout $1
		reload_ps1
	}

	if [[ -a ~/.z.sh ]]
	then
		source ~/.z.sh
	fi

else
	if [[ ! -d ~/.oh-my-zsh ]]
	then
		curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	fi
fi


alias upmenu='xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu > ~/.config/awesome/menu.lua'

# alias
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bb='source ~/.bash_profile'
alias p="ping 8.8.8.8"
alias pb="ping baidu.com"
# alias sql="mysql -uroot -p"
alias sql='sudo mysqld_safe --user=mysql &'
alias nn='nasm -f elf'
alias ld='ld -m elf_i386 -s'

alias m='make'
alias mm='make'
alias mc='make clean'
alias mi='make insmod'
alias mr='make rmmod'

# mount
alias mtc='if [[ ! -d "/mnt/wc" ]]; then sudo mkdir /mnt/wc; fi; sudo mount /dev/sda1 /mnt/wc'
alias mtd='if [[ ! -d "/mnt/wd" ]]; then sudo mkdir /mnt/wd; fi; sudo mount /dev/sda8 /mnt/wd'
alias mtl='if [[ ! -d "/mnt/linux" ]]; then sudo mkdir /mnt/linux; fi; sudo mount /dev/sda5 /mnt/linux'

alias umc='sudo umount /mnt/wc'
alias umd='sudo umount /mnt/wd'
alias uml='sudo umount /mnt/linux'
alias uub='sudo umount /mnt/ub'
alias uuc='sudo umount /mnt/uc'

usb()
{
        if [[ ! -d "/mnt/ub" ]]
        then
                sudo mkdir /mnt/ub
        fi

        if [[ -d $1 ]]
        then
                usb_dev=$1
        else
                usb_dev="sdb1"
        fi

        sudo mount -o iocharset=utf8 /dev/$usb_dev /mnt/ub/
}

usc()
{
        if [[ ! -d "/mnt/uc" ]]
        then
                sudo mkdir /mnt/uc
        fi

        if [[ -d $1 ]]
        then
                usb_dev=$1
        else
                usb_dev="sdc1"
        fi

        sudo mount -o iocharset=utf8 /dev/$usb_dev /mnt/uc/
}

alias v='sudo vim'
#alias gvim='/usr/bin/gvim -f --remote-tab-silent'
alias gvim='/usr/bin/gvim -f'

alias pyproxy='cd ~/yunio/software/software/goagent; python2 proxy.py > /dev/null 2> /dev/null &'
alias pyserver='python2 -m SimpleHTTPServer'
alias py='/usr/bin/python2'
# alias bp='bpython'
# alias ip='ipython'

# # apt-get
# alias ac='sudo apt-get autoremove --purge && sudo apt-get clean && dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs dpkg -P'

# alias as='apt-cache search --names-only'
# alias ac='sudo apt-get autoremove'
# alias ai='sudo apt-get install'
# alias au='sudo apt-get update'
# alias ar='sudo apt-get remove'
# alias aug='sudo apt-get upgrade'
# alias aw='apt-cache show'

# ##清除所有已删除包的残馀配置文件
# alias aptc="sudo apt-get autoremove ; sudo apt-get clean ; dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P"

# pacman
alias pa='sudo pacman --color always -S'
alias pas='sudo pacman --color always -Ss'
alias pasi='sudo pacman --color always -Qi'
alias pac='sudo pacman --color always -Scc'
# alias pau='sudo pacman --color always -Syu --ignore linux --ignore linux-headers'
alias pau='sudo pacman --color always -Syu'
alias pay='sudo pacman --color always -Sy'
alias payi='sudo pacman --color always -S --ignore'
alias par='sudo pacman --color always -Rscn'
alias paqi='sudo pacman --color always -Qi'
alias paql='sudo pacman --color always -Ql'
alias paqo='sudo pacman --color always -Qo' # search file own
alias paqtdq='sudo pacman --color always -Qtdq'
alias parl='sudo pacman --color always -Rs $(pacman -Qtdq)'


# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="sudo /usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"


# alias pacro=]
alias pkglist='comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > ~/yunio/software/software/pkglist'

# yaourt
alias ya='yaourt'
alias yaq='yaourt -Qmg'
alias yau='yaourt -Syua' #刷新全部包(ABS+AUR)
alias yas='yaourt -Ss'        #查找源(ABS+AUR)里带有指定<pattern>的包
alias yaqs='yaourt -Qs'        #查找机器上已安装的包(ABS+AUR)里带有指定<pattern>的包
alias yaqi='yaourt -Qi' #查看机器上已安装的<pattern>包的详细
alias yaqi='yaourt -Ql' #查看机器上已安装的<pattern>包的安装位置
alias yaqd='yaourt -Qtd' #查找机器上所有以“依赖”形式安装的孤立包

alias xx='sudo rmmod psmouse' #; sudo /etc/rc.d/openntpd start'
alias np='sudo nm-applet'
alias ta='tmux attach'
alias jekyll='~/.gem/ruby/2.0.0/bin/jekyll'

# alias rmouse='sudo rmmod psmouse'
# alias imouse='sudo modprobe psmouse'

# alias bak_sys='cd / ; sudo tar cvfJ ~/arch_sys_bak-2011-07-25.tar.xz --exclude=/mnt/* --exclude=/proc/* --exclude=/home/* --exclude=/media/* --exclude=/tmp/* --exclude=/dev/shm/* --exclude=/lost+found/* /  > ~/bak_sys.log 2> ~/bak_sys.err'

alias cr='ctags -R --fields=+lS && cscope -Rbq'
alias df='df -h'
alias dt='dmesg | tail -n 20'
alias du='du -sh'
alias dx='xset s off && xset dpms 0 0 0'
alias md='md5sum'

# alias of git
alias ga='git add'
alias gb='git branch'
alias gci='git commit -a'
alias gp='git push -u origin master'
alias gps='git push -u origin source:source'
alias gitoneline='git log --pretty=oneline'
alias gdel='git update-index --assume-unchanged'
alias gd='git difftool'
alias gi='git add -i'
alias gl='git log --graph'
alias gr='git ls-files -d |xargs git checkout --'
alias gst='git status'
alias gu='git pull'
alias gw='git show'
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias glpb="git log --pretty=format:'%Cred%h%Creset %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %Cgreen(%cr)%Creset%n%w(80,8,8)%s' --graph"

alias charm='/opt/software/pycharm-3.0/bin/pycharm.sh'

# function cd()
# {
        # command cd "$1"
        # reload_ps1
# }


alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias la='ls -A --color=auto'
alias lh='ls -lAh --color=auto'
alias ll='ls -l --color=auto'
alias lx='ls -BX'                   # sort by extension
alias lz='ls -rS'                   # sort by size
alias lt='ls -rt'                   # sort by date

alias rm='~/yunio/software/script/totrash'
alias rmdir='~/yunio/software/script/totrash'

alias cp='cp -i'
alias mv='mv -i'

alias diff='colordiff'
alias mkdir='mkdir -p -v'
alias more='less'
alias pg='pgrep -l'
alias pp='ps -Af | grep'
alias ff='find ./* -type f |sort| xargs grep'
alias syn='synclient TouchpadOff=1'
alias music='smplayer ~/Documents/Music/* >/dev/null &'
alias htg='history | grep'
alias openports='netstat --all --numeric --programs --inet --inet6'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias killtty7="tty7=`ps -ef|grep tty7|awk -F\  '{print $2}'|head -n 1`"
#sudo kill $tty7"

#alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
#alias off='sudo poff'
#alias on='sudo pon dsl-provider'
#alias hb='sudo pm-hibernate'
#alias ht='sudo halt -p'
#alias sp='sudo pm-suspend'
#alias s='sha1sum'

laa()
{
        sudo /opt/lampp/lampp start
        sudo mkdir /run/mysqld
        sudo ln -sf /opt/lampp/var/mysql/mysql.sock /run/mysqld/mysqld.sock
}

alias loo='sudo /opt/lampp/lampp stop'



# http://samrowe.com/wordpress/2008/09/01/be-yourself-even-when-youre-root/
# function su () {
        # local SUUSER=root
        # local ORIGU=$USER
        # local ORIGG=`groups | awk '{print $1}'`
        # if [[ $# -gt 0 ]] ; then
                # local char=`echo $1 | cut -c 1`
                # if [[ "$char" == '-' ]]; then
                        # /bin/su $*
                        # return $?
                # else
                        # local SUUSER=$1
                # fi
        # fi
# }

TERM=xterm-256color

if [[ -n $DISPLAY ]]
then
        BROWSER=chromium
        have_xmodmap=$(xmodmap | grep "Caps_Lock (0x9)" | wc -l)
        if [[ $have_xmodmap == 0 ]]
        then
                xmodmap ~/.Xmodmap
        fi

        tmux_count=$(tmux ls | wc -l)
        if [[ "$tmux_count" == "0" ]]; then
                tmux -2
        else
                if [[ -z "$TMUX" ]]; then
                        if [[ "$tmux_count" == "1" ]]; then
                                session_id=1
                        else
                                session_id=`echo $tmux_count`
                        fi
                        tmux new-session -d -s $session_id
                        tmux attach-session -t $session_id
                fi
        fi
else
        startx
fi

# Extract Files
ex()
{
        if [ -f $1 ] ; then
                case $1 in
                        *.jar)                jar -xvf $1                ;;
                        *.tar.bz2)   tar xvjf $1    ;;
                        *.tar.gz)    tar xvzf $1    ;;
                        *.tar.xz)    tar xvJf $1    ;;
                        *.bz2)       bunzip2 $1     ;;
                        *.rar)       unrar x $1     ;;
                        *.gz)        gunzip $1      ;;
                        *.tar)       tar xvf $1     ;;
                        *.tbz2)      tar xvjf $1    ;;
                        *.tgz)       tar xvzf $1    ;;
                        # *.zip)       unzip $1       ;;
                        *.zip)                 7z x $1        ;;
                        *.Z)         uncompress $1  ;;
                        *.7z)        7z x $1        ;;
                        *.xz)        unxz $1        ;;
                        *.exe)       cabextract $1  ;;
                        *)           echo "'$1': unrecognized file compression" ;;
                esac
        else
                echo "\`$1' is not a valid file"
        fi
}

pbz()
{
        if [[ -f $1 ]]
        then
                tar -jcvf $1.tar.bz2 $1
        fi
}

rb()
{
        # ~/yunio/script/user_off
        sudo reboot
}

off()
{
        # ~/yunio/script/user_off
        sudo poweroff
}


# setterm -blength 0

# ts(){
        # curl -s \
                # "http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&smartresult=ugc&sessionFrom=dict.top" \
                # -d \
                # "type=AUTO& i=$1&doctype=json&xmlVersion=1.4&keyfrom=fanyi.web&ue=UTF-8&typoResult=true&flag=false" \
                # | sed -E -n 's/.*tgt":"([^"]+)".*/\1/p' ;
        # return 0;
# }

# export http_proxy='127.0.0.1:8087'
# alias x='startx'


# export HISTCONTROL=ignoreboth
# export HISTIGNORE='history*'
# export PROMPT_COMMAND='history -a;echo -en "\e]2;";history 1|sed "s/^[ \t]*[0-9]\{1,\}  //g";echo -en "\e\\";'
export LANG=zh_CN.UTF-8
export PYTHONDONTWRITEBYTECODE=x
