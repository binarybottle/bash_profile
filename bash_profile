# Assumes the following symbolic links:
# /homedir (ex: /home/arno or /Users/arno)
# /appsdir (ex: /usr/local or /Applications)
# /data (ex: /home/arno/Data or /Users/arno/Data)
# /software (ex: /home/arno/Software or /Users/arno/Software)

# Only certain paths need to be set for Linux vs. Apple:
is_apple=1;
is_linux=0;
#if [ $is_apple==1 ]; then
#fi
#if [ $is_linuxe==1 ]; then
#fi

###########
# Aliases #
###########
# Aliases -- local paths:
 alias b='. /homedir/.bash_profile'
 alias eb='emacs /homedir/.bash_profile'
 alias d='cd $1'
 alias dk='cd /homedir/Desktop'
 alias dc='cd /homedir/Documents'
 alias db='cd /homedir/Dropbox'
 alias dp='cd /homedir/Documents/Projects'
 alias ds='cd /software'
 alias dm='cd /homedir/Documents/Projects/Mindboggle/mindboggle/mindboggle'

# Aliases -- remote:
 alias sshd='ssh -x binarybottle@binarybottle.com' # binarybottle
 alias sshm='ssh -p 130 arno@130.245.159.201' # mindboggler
 alias sshftpmindboggle='ssh ftpmindboggle@mindboggle.info' # binarybottle
 alias sshk='ssh -x kaklein@kaklein.com' # kaklein
 alias sshb='ssh -x arno@172.21.95.241' # boggle
 alias sshf='ssh -x arno@129.118.38.95' # forrest
 alias ssht='ssh -x arklein@hrothgar.hpcc.ttu.edu' # ttu
 #hrothgar.hpcc.ttu.edu  (for general jobs)
 #antaeus.hpcc.ttu.edu  (for OSG and HEP group)
 #weland.hpcc.ttu.edu  (for PEGrid)
 #HPCC user guides are accessible on our website at http://www.hpcc.ttu.edu/php/NewUser.php
 # alias scpb='scp binarybottle@binarybottle.com:$1 .'
 # alias scp2b='scp $1 binarybottle@binarybottle.com:$1'

# Aliases -- rsync to home:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias rsyncbrains2home='cd /hd2/Lab; rsync -avz --delete --numeric-ids --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh 172.21.95.241:/data/Brains .' 
 alias rsyncdocs2home='cd /hd2/Lab; rsync -avz --delete --numeric-ids --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh 172.21.95.241:/homedir/Documents .'
 alias rsyncdhost2home='cd /homedir/Sites; rsync -avz --delete --numeric-ids --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh binarybottle@binarybottle.com:/home/binarybottle/* .'
 alias rsyncdhostbkp='rsync -e ssh -av A b498945@hanjin.dreamhost.com:~/B'

# Aliases -- Git:
 alias ga='git add'
 alias gc='git commit'
 alias gp='git push origin master'
 alias gpull='git pull'
 alias gb='git branch'
 alias gh='git --help'
 alias go='git checkout'
 alias gs='git status -s'
 alias gd='git diff'

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
 alias du='du -ks *'

# Aliases -- common:
 alias a='alias | more'  
 alias top='top -o cpu'
 alias cr='cp -R'
 alias md='mkdir $1'
 alias g='grep'
 alias h='history'
 alias j="jobs"
 alias k='kill -9 $1'
 alias m='more'
 alias p='pwd'
 alias ps='ps -aux | more'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-*'
 alias rrf='rm -rf'
 alias x='xhost +; su'

# Aliases -- applications:
 alias e='emacs &'
 alias f='/usr/local/fsl/bin/fslview.app/Contents/MacOS/fslview $1'
if [ $is_apple==1 ]; then
 alias mayavi='/Applications/Enthought/Mayavi.app/Contents/MacOS/Mayavi &'
 alias snap='/Applications/ITK-SNAP.app/Contents/MacOS/InsightSNAP $1'
fi
#if [ $is_linux==1 ]; then
# alias mayavi='/usr/local/Enthought/Mayavi.app/Contents/MacOS/Mayavi &'
# alias snap='/usr/local/ITK-SNAP.app/Contents/MacOS/InsightSNAP $1'
#fi

#########
# PATHS #
#########
test -r /sw/bin/init.sh && . /sw/bin/init.sh

export EDITOR=/usr/bin/emacs
export LSCOLORS="ExgxfxfxCxDxDxCxCxaCaC"

# grin (grep + find): http://pypi.python.org/pypi/grin/
export GRIN_ARGS="-C 2 --no-skip-dirs"

# Git:
GITDIR=/usr/local/git
PATH=${GITDIR}/bin:${PATH}
export GITDIR PATH

# Mindboggle
MINDBOGGLE_TOOLS=/software/mindboggle_tools/bin
export MINDBOGGLE_TOOLS
export PATH=$PATH:$MINDBOGGLE_TOOLS

MINDBOGGLE_DATA=/drop/MB/data
export MINDBOGGLE_DATA
export PATH=$PATH:$MINDBOGGLE_DATA

# FreeSurfer:
FREESURFER_HOME=/appsdir/freesurfer
SUBJECTS_DIR=/appsdir/freesurfer/subjects
#SUBJECTS_DIR=/data/Brains/Mindboggle101/subjects
PATH=${FREESURFER_HOME}:${PATH}
FSL_DIR=/usr/local/fsl
export FREESURFER_HOME SUBJECTS_DIR FSL_DIR NO_FSFAST
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# ANTS:
ANTSPATH=/software/antsbin/bin
PATH=${ANTSPATH}:${PATH}
export ANTSPATH PATH

# AFNI:
#AFNIHOME=/software/AFNI
#PATH=${AFNIHOME}:${PATH}
#export AFNIHOME PATH

# Convert3d:
C3DDIR=/software/c3D
PATH=${C3DDIR}/bin:${PATH}
export C3DDIR PATH

# Virtualenvwrapper:
#WORKON_HOME=/homedir/Envs
#export WORKON_HOME PATH

# Camino:
CAMINO=/software/camino
PATH=${CAMINO}/bin:${PATH}
MANPATH=${CAMINO}/man:${MANPATH}
export CAMINO PATH MANPATH
export CAMINO_HEAP_SIZE=3000
export PATH="$CAMINO:$PATH"

# ImageMagick:
#IMAGEDIR=/Software/ImageMagick-6.6.9/bin
#PATH=${IMAGEDIR}:${PATH}
#export IMAGEDIR PATH

# FSL:
FSLDIR=/usr/local/fsl
if [ $is_bijli==1 ]; then
  FSLDIR=/usr/local/fsl
fi
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# added by Anaconda 1.6.1 installer
export PATH="/software/anaconda/bin:$PATH"
