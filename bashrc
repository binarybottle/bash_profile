# This file assumes the following symbolic links to directories
# within /homedir in Linux (/home/arno) or macOS (/Users/arno):
# sudo ln -s /[home,Users]/arno /homedir
# sudo ln -s /homedir/Data /data            # /homedir/Data
# sudo ln -s /homedir/Desktop /desk         # /homedir/Desktop
# sudo ln -s /homedir/Documents /docs       # /homedir/Documents
# sudo ln -s /homedir/Downloads /downloads  # /homedir/Downloads
# sudo ln -s /homedir/Drive /drive          # /homedir/Drive
# sudo ln -s /homedir/Software /software    # /homedir/Software

###########
# Aliases #
###########
# Aliases -- local paths:
 alias b='. /homedir/bash_profile/bash_profile'
 alias eb='emacs /homedir/bash_profile/bash_profile'
 alias d='cd $1'
 alias da='cd /data'
 alias dk='cd /desk'
 alias dc='cd /docs'
 alias do='cd /downloads'
 alias dv='cd /drive'
 alias ds='cd /software'
 alias pp='/software/arno_utils/prepend_filenames $1'
 alias ss='/software/arno_utils/substr_filenames'
 alias mogrify='/opt/ImageMagick/bin/mogrify'
 alias dmote='sudo /software/droidmote-server-linux-x64-v3.0.2/droidmote 2302 mutedroid'

# Aliases -- remote:
 alias sshd='ssh -x binarybottle@binarybottle.com' # binarybottle
 alias sshn='ssh arno@ned.childmind.org'
 alias sshp='ssh -x pupating@pupating.org' # pupating
 alias sshb='ssh -p 22 arno@boggler4' # boggler4
 alias sshm='ssh -p 22 arno@mindboggler' # mindboggler
 alias sshftpmindboggle='ssh ftpmindboggle@binarybottle.com' # binarybottle
 alias sshaws='ssh -i "/homedir/.aws/binarybottle-aws-ssh-key.pem" ubuntu@ec2-54-146-136-218.compute-1.amazonaws.com'

# Aliases -- rsync to home:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias rsyncecho2='echo "rsync -avz --delete --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'

# Aliases -- Git:
 alias ga='git add'
 alias gco='git checkout'
 alias gcom='git checkout master'
 alias gcop='git checkout gh-pages'
 alias gc='git commit'
 alias gp='git push'
 alias gpom='git push origin master'
 alias gpop='git push origin gh-pages'
 alias gpull='git pull'
 alias gb='git branch'
 alias gh='git --help'
 alias gs='git status'
 alias gd='git diff'
 alias glola='git log --graph --decorate --pretty=oneline --abbrev-commit --name-status'

# Aliases -- list:
 alias t='ls $1'
 alias ta='ls -A $1'
 alias tm='ls $1 | more'
 alias tam='ls -A $1 | more'
 alias tt='ls -lart $1'
 alias tta='ls -lA $1'
 alias ttm='ls -l $1 | more'
 alias ttam='ls -lA $1 | more'
 alias td='ls -ba'
 alias tdd='ls .[a-zA-Z0-9_]*'
 alias du='du -hs *'

# Aliases -- common:
 alias a='alias | more'  
 alias cr='cp -R'
 alias md='mkdir $1'
 alias h='history'
 alias m='more'
 alias p='pwd'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-* .directory'
 alias rrf='rm -rf'

#########
# PATHS #
#########

# added by Anaconda3 3.5 installer
export PATH="/anaconda/bin:$PATH"

# Mindboggle
#export vtk_cpp_tools=/software/install/mindboggle/vtk_cpp_tools/bin
#export PATH=/software/install/mindboggle/vtk_cpp_tools/bin:$PATH
