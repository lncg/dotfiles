# # command cowsay $(fortune)
# command ponysay $(fortune)


# command fortune -a | fmt -80 -s | cowsay -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    # debian_chroot=$(cat /etc/debian_chroot)
# fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
    . /usr/share/bash-completion/bash_completion
fi


# screen and xterm's dynamic title
case $TERM in
	xterm*)
		# Set xterm's title
		TITLEBAR='\[\e]0;\u@\h:\w\a\]'
		PS1="${TITLEBAR}${PS1}"
		;;
	screen*)
		# Use path as title
		PATHTITLE='\[\ek\W\e\\\]'
		# Use program name as title
		PROGRAMTITLE='\[\ek\e\\\]'
		PS1="${PROGRAMTITLE}${PATHTITLE}${PS1}"
		;;
	*)
		;;
esac


_show_installed()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( _comp_dpkg_installed_packages $cur ) )
	return 0
}

_show_all()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( apt-cache pkgnames $cur 2> /dev/null ) )
	echo $COMPREPLY
	return 0
}

# complete -F _show_all $default ai aw
# complete -F _show_installed $default ap

source ~/.shell.sh
