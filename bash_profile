is_linux=0

# Assumes the following symbolic links:
# /homedir (ex: /home/arno or /Users/arno)
# /desk (ex: /home/arno/Desktop or /Users/arno/Desktop)
# /drive (ex: /home/arno/Drive or /Users/arno/Drive)
# /software (ex: /home/arno/Software or /Users/arno/Software)
# /appsdir (ex: /usr/local or /Applications)
#
# Linux:
# sudo ln -s /home/arno /homedir
# sudo ln -s /usr/local /appsdir

# Apple:
# sudo ln -s /Users/arno /homedir
# sudo ln -s /Applications /appsdir
# Linux or Apple:
# sudo ln -s /homedir/Drive /drive
# sudo ln -s /homedir/software /software

###########
# Aliases #
###########
# Aliases -- local paths:
 alias b='. /homedir/bash_profile/bash_profile'
 alias eb='emacs /homedir/bash_profile/bash_profile'
 alias d='cd $1'
 alias da='cd /appsdir'
 alias dk='cd /desk'
 alias dv='cd /drive'
 alias ds='cd /software'
 alias vv='/software/install/mindboggle/mindboggle/thirdparty/vtkviewer.py $1'
 alias pp='/software/prepend_filenames $1'
 alias ss='/software/substr_filenames'
 alias mogrify='/opt/ImageMagick/bin/mogrify'

# Aliases -- remote:
 alias sshd='ssh -x binarybottle@binarybottle.com' # binarybottle
 alias sshp='ssh -x pupating@pupating.org' # pupating
 alias sshb='ssh -p 22 arno@boggler4' # boggler4
 alias sshm='ssh -p 22 arno@mindboggler' # mindboggler
 alias sshftpmindboggle='ssh ftpmindboggle@binarybottle.com' # binarybottle
 alias sshdoo='ssh root@disordersordered.org -p 7822'

# Aliases -- rsync to home:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias rsyncecho2='echo "rsync -avz --delete --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'
 #alias rsyncdhostbkp='rsync -e ssh -av A b498945@hanjin.dreamhost.com:~/B'

# Aliases -- Git:
 alias ga='git add'
 alias go='git checkout'
 alias gom='git checkout master'
 alias gop='git checkout gh-pages'
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
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-*'
 alias rrf='rm -rf'

# Aliases -- applications:
#alias cmake='/software/install/miniconda3/bin/cmake'
#if [ $is_linux==1 ]; then
#  alias c3d='/software/c3d/bin/c3d'
#  alias s='/software/itksnap/bin/itksnap $1'
#fi
#if [ $is_linux==0 ]; then
#  alias s='/appsdir/ITK-SNAP.app/Contents/MacOS/ITK-SNAP $1'
#  #alias f='/usr/local/fsl/bin/fslview.app/Contents/MacOS/fslview $1'
#  alias f='freeview $1'
#fi

#########
# PATHS #
#########

# nipype:
#export NIPYPEPATH=/software/install/nipype/bin
#export PATH=$NIPYPEPATH:$PATH

# FreeSurfer:
#FREESURFER_HOME=/appsdir/freesurfer
#SUBJECTS_DIR=/appsdir/freesurfer/subjects
#PATH=${FREESURFER_HOME}:${PATH}
#export FREESURFER_HOME SUBJECTS_DIR
#source $FREESURFER_HOME/SetUpFreeSurfer.sh

# ants
#export ANTSPATH=/software/ants/bin
#export PATH=$ANTSPATH:$PATH

# FSL:
#FSLDIR=/appsdir/fsl
#. ${FSLDIR}/etc/fslconf/fsl.sh
#PATH=${FSLDIR}/bin:${PATH}
#export FSLDIR PATH

# added by Anaconda3 2.5.0 installer
#export PATH="/Users/arno/anaconda/bin:$PATH"
# Conda
#export PATH=/software/install/miniconda3/bin:$PATH

# Mindboggle
#export vtk_cpp_tools=/software/install/mindboggle/vtk_cpp_tools/bin
#export PATH=/software/install/mindboggle/vtk_cpp_tools/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
#if [ -f /Users/arno/google-cloud-sdk/path.bash.inc ]; then
#  source '/Users/arno/google-cloud-sdk/path.bash.inc'
#fi

# The next line enables shell command completion for gcloud.
#if [ -f /Users/arno/google-cloud-sdk/completion.bash.inc ]; then
#  source '/Users/arno/google-cloud-sdk/completion.bash.inc'
#fi
# alias gcloudarango='gcloud compute --project "mhdb-146422" ssh --zone "us-east1-b" "arangodb-test-23631-1"'

