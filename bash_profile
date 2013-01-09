is_apple=1;
is_linux=0;
#if [ $is_apple==1 ]; then
#fi

# Aliases:
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
 alias dir='ls -ba'
 alias dot='ls .[a-zA-Z0-9_]*'
 alias du='du -ks *'
 alias md='mkdir $1'

# Aliases -- common:
 alias top='top -o cpu'
 alias ls='ls -G'
 alias a='alias | more'  
 alias b='. /Users/arno/.bash_profile'
 alias cr='cp -R'
 alias d='cd $1'
 alias dk='cd /Users/arno/Desktop'
 alias dc='cd /Users/arno/Documents'
 alias dd='cd /Users/arno/Dropbox'
 alias dp='cd /Users/arno/Documents/Projects'
 alias ds='cd /Users/arno/Software'
 alias dm='cd /Users/arno/Documents/Projects/Mindboggle/mindboggle/mindboggle'
 alias g='grep'
 alias h='history'
 alias j="jobs"
 alias k='kill -9 $1'
 alias m='more'
 alias p='pwd'
 alias ps='ps -ef | more'
 alias ps='ps -aux | more'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-*'
 alias rrf='rm -rf'
 alias x='xhost +; su'

# Aliases -- applications:
 alias e='emacs &'
 alias eb='emacs /Users/arno/.bash_profile'
 alias f='/usr/local/fsl/bin/fslview.app/Contents/MacOS/fslview $1'
if [ $is_apple==1 ]; then
 alias mayavi='/Applications/Enthought/Mayavi.app/Contents/MacOS/Mayavi &'
 alias snap='/Applications/ITK-SNAP.app/Contents/MacOS/InsightSNAP $1'
fi
#if [ $is_linux==1 ]; then
# alias mayavi='/usr/local/Enthought/Mayavi.app/Contents/MacOS/Mayavi &'
# alias snap='/usr/local/ITK-SNAP.app/Contents/MacOS/InsightSNAP $1'
#fi

# Aliases -- rsync:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh <in> ."'
if [ $is_apple==1 ]; then
  alias rsyncbrains2home='cd /hd2/Lab; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh 192.168.23.219:/home/arno/Data/Brains .' 
  alias rsyncdocs2home='cd /hd2/Lab; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh 192.168.23.219:/home/arno/Documents .' 
  alias rsyncdhost2home='cd /Users/arno/Sites; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh binarybottle@binarybottle.com:/home/binarybottle/* .' 
  alias rsyncdhostbkp='rsync -e ssh -av A b498945@hanjin.dreamhost.com:~/B'
fi

# Aliases -- connections:
 alias sshd='ssh -x binarybottle@binarybottle.com' # binarybottle
 alias sshftpmindboggle='ssh ftpmindboggle@mindboggle.info' # binarybottle
 alias sshk='ssh -x kaklein@kaklein.com' # kaklein
 alias sshb='ssh -x arno@172.21.87.231' # boggle
 alias sshf='ssh -x arno@129.118.38.95' # forrest
 alias ssht='ssh -x arklein@hrothgar.hpcc.ttu.edu' # ttu
#hrothgar.hpcc.ttu.edu  (for general jobs)
#antaeus.hpcc.ttu.edu  (for OSG and HEP group)
#weland.hpcc.ttu.edu  (for PEGrid)
#HPCC user guides are accessible on our website at http://www.hpcc.ttu.edu/php/NewUser.php

# alias scpb='scp binarybottle@binarybottle.com:$1 .'
# alias scp2b='scp $1 binarybottle@binarybottle.com:$1'

# PATHS:
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
MINDBOGGLE=/projects/Mindboggle/mindboggle/mindboggle
MINDBOGGLE_TOOLS=/software/mindboggle_tools/bin
MINDBOGGLE_DATA=/drop/MB/data
export MINDBOGGLE MINDBOGGLE_TOOLS MINDBOGGLE_DATA
export PATH=$PATH:$MINDBOGGLE
export PATH=$PATH:$MINDBOGGLE_TOOLS
export PATH=$PATH:$MINDBOGGLE_DATA
export PYTHONPATH=$PYTHONPATH:$MINDBOGGLE

# FreeSurfer:
if [ $is_apple==1 ]; then
  FREESURFER_HOME=/Applications/freesurfer
  SUBJECTS_DIR=/Applications/freesurfer/subjects
  #SUBJECTS_DIR=/Users/arno/subjects
  #SUBJECTS_DIR=/hd2/Lab/Brains/Mindboggle101/subjects
fi
#if [ $is_linux==1 ]; then
#  FREESURFER_HOME=/usr/local/freesurfer
#  SUBJECTS_DIR=/usr/local/freesurfer/subjects
#  #SUBJECTS_DIR=/data/Brains/Mindboggle101/subjects
#fi
PATH=${FREESURFER_HOME}:${PATH}
FS_FREESURFERENV_NO_OUTPUT=1
export FREESURFER_HOME FS_FREESURFERENV_NO_OUTPUT SUBJECTS_DIR
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# ANTS:
ANTSPATH=/Users/arno/Software/ANTS_1.9/bin/
PATH=${ANTSPATH}:${PATH}
export ANTSPATH PATH

# AFNI:
AFNIHOME=/Users/arno/Software/AFNI
PATH=${AFNIHOME}:${PATH}
export AFNIHOME PATH

# Convert3d:
C3DDIR=/Users/arno/Software/c3D
PATH=${C3DDIR}/bin:${PATH}
export C3DDIR PATH

# Virtualenvwrapper:
#WORKON_HOME=/Users/arno/Envs
#export WORKON_HOME PATH

# Camino:
CAMINO=/Users/arno/Software/camino
PATH=${CAMINO}/bin:${PATH}
MANPATH=${CAMINO}/man:${MANPATH}
export CAMINO PATH MANPATH
export CAMINO_HEAP_SIZE=3000
export PATH="$CAMINO:$PATH"
#ITKsnap's convert3d tab completion script:
#source /Users/arno/Software/ITKsnap/bashcomp.sh

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

# VTK:
VTK=/Users/arno/Software/VTK-build
PATH=${VTK}:${PATH}
PATH=${VTK}/bin:${PATH}
export VTK PATH

#export PYTHONPATH="$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/7.1/bin"
#export PYTHONPATH

# EPD
PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
export PATH


MKL_NUM_THREADS=1
export MKL_NUM_THREADS
