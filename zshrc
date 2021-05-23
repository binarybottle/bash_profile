
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"
# arrow, norm

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###########
# Aliases #
###########
# git aliases
 alias ga='git add'
 alias gco='git checkout'
 alias gcom='git checkout master'
 alias gcop='git checkout gh-pages'
 alias gs='git status'
 alias gf='git fetch origin'
 alias gd='git diff'
 alias gdiff='git diff master origin/master'
 alias gpull='git pull'
 alias gc='git commit'
 alias gp='git push'
 alias gpom='git push origin master'
 alias gpop='git push origin gh-pages'
 alias gb='git branch'
 alias gh='git --help'
 alias glola='git log --graph --decorate --pretty=oneline --abbrev-commit --name-status'

# custom aliases
 alias pp='/home/arno/Software/arno_utils/prepend_filenames $1'
 alias ss='/home/arno/Software/arno_utils/substr_filenames'
 alias ss='/home/arno/Software/arno_utils/substr_filenames'
 alias zotero='/home/arno/Software/Zotero_linux-x86_64/zotero &'
 
# ssh aliases
 alias ssha='ssh -p 7822 root@68.66.205.123' # a2
 alias sshd='ssh -x binarybottle@ps611160.dreamhostps.com' # binarybottle
 alias sshp='ssh -x pupating@ps611160.dreamhostps.com' # pupating
 alias sshc='ssh -x chefsherri@ps611160.dreamhostps.com' # chefsherri

# cd aliases
 alias d='cd $1'
 alias da='cd /home/arno/Data'
 alias de='cd /home/arno/Desktop'
 alias do='cd /home/arno/Documents'
 alias dw='cd /home/arno/Downloads'
 alias ds='cd /home/arno/Software'
 alias dr='cd /home/arno/Drive'

# ls aliases
 alias t='ls $1'
 alias tr='ls -RFg $1'
 alias ta='ls -AFg $1'
 alias tm='ls -Fg $1 | more'
 alias tam='ls -AFg $1 | more'
 alias tt='ls -ltFg $1'
 alias ttr='ls -lrtFg $1'
 alias tta='ls -lAFg $1'
 alias ttm='ls -lFg $1 | more'
 alias ttam='ls -lAFg $1 | more'
 alias td='ls -bag'
 alias tdd='ls .[a-zA-Z0-9_]*'
 alias du='du -hs *'

# xtra aliases
 alias z="emacs ~/.zshrc"
 alias ohmyzsh="emacs ~/.oh-my-zsh"
 alias a='alias | more'  
 alias cr='cp -R'
 alias md='mkdir $1'
 alias h='history'
 alias m='more'
 alias p='pwd'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-* .directory'
 alias rrf='rm -rf'
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/home/arno/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias lunch='bundle exec jekyll serve'



source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Backup commands
# rclone copy gdrive: bb2:ArnoDrive --drive-alternate-export
# rclone copy kak_gdrive: bb2:GoogleDriveKarenKlein --drive-alternate-export
# rclone copy ekk_gdrive: bb2:GoogleDriveElloraKlein --exclude media/** --drive-alternate-export

