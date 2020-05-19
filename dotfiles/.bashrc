#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:$HOME/.local/bin/

#a bash script used for shallow-backup
# Usage: backup-dots [COMMIT MESSAGE]
backup-dots () {
    echo "Backing up..."
    crontab -l > ~/.config/crontab
    (
        shallow-backup -no-splash -backup-dots -separate-dotfiles-repo
        cd "$HOME/shallow-backup/dotfiles/" || exit
        git add .
        commit_msg="$1"
        if [ -z "$commit_msg"  ]
        then
                git commit --verbose
        else
                git commit -m "$commit_msg"
        fi
        git pull
        if [ "$?" -ne 0  ]
        then
                echo "Merge conflict detected. Fix manually in subshell and Ctrl-D when done."
                git status 
                $SHELL
        fi
        git push
    )
}
################################################################################

