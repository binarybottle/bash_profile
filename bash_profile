is_bijli=1;
is_litchi=0;
is_mango=0;

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
 alias dr='cd /Users/arno/Sites/roygbiv'
 alias ds='cd /Users/arno/Software'
 alias g='grep'
 alias h='history'
 alias j="jobs"
 alias k='kill -9 $1'
 alias m='more'
 alias p='pwd'
 alias ps='ps -ef | more'
 alias ps='ps -aux | more'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store'
 alias rrf='rm -rf'
 alias x='xhost +; su'

# Aliases -- applications:
 alias e='emacs &'
 alias eb='emacs /Users/arno/.bash_profile'
 alias f='/Applications/fsl/bin/fslview.app/Contents/MacOS/fslview $1'
 alias pre='/Applications/Preview.app/Contents/MacOS/Preview $1'
 alias sage='/Applications/sage/sage'
 alias slicer='/Users/arno/Software/Slicer3-3.4.1-2009-10-08-darwin-x86/Slicer3'
 alias snap='/Applications/ITK-SNAP.app/Contents/MacOS/InsightSNAP $1'
 alias updateants='cd /Users/arno; svn update https://advants.svn.sourceforge.net/svnroot/advants'

# Aliases -- rsync:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh <in> ."'
 alias rsyncArchive2home='cd /hd2/data; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh 192.168.23.80:/hd2/data/Archive .' 
 alias rsyncAtlases2home='cd /Users/arno/Lab; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh 192.168.23.80:/hd2/data/Atlases .' 
 alias rsyncDocuments2home='cd /Users/arno/Lab; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh 192.168.23.80:/Users/arno/Documents .' 
 alias rsyncdhost2home='cd /Users/arno/Sites/dreamhost_backup; rsync -avz --delete --numeric-ids --sparse --exclude-from=/Users/arno/.rsync-exclude -e /usr/bin/ssh binarybottle@binarybottle.com:/home/binarybottle/* .' 

# Aliases -- connections:
 alias sshb='ssh binarybottle@binarybottle.com'
 alias sshk='ssh kaklein@kaklein.com'
 alias sshp='ssh kleina@arnoldkleingallery.com'   # 'ssh -l arno `cat .ip`'
 alias sshc='ssh arno@192.168.23.80'
# alias ssht='ssh arno@teckla.idyll.org'   # 'ssh -l arno `cat .ip`'
# alias sshg='ssh arno@gate.nmr.mgh.harvard.edu'
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

# ANTS:
if [ $is_bijli==1 ]; then
  ANTSPATH=/Users/arno/Software/ANTS-build/
  ANTSPATH2=/Users/arno/Software/ANTS/Scripts/
  export ANTSPATH ANTSPATH2 PATH
fi
if [ $is_litchi==1 ]; then
  ANTSPATH=/Users/arno/Software/Darwini386ANTS1pt5/
  ANTSPATH2=/Users/arno/Software/Darwini386ANTS1pt5/Scripts/
  export ANTSPATH ANTSPATH2 PATH
fi
if [ $is_mango==1 ]; then
  ANTSPATH=/data/BI/Toolbox/software/ants_maci_svn606/bin/
  PATH=${ANTSPATH}:${PATH}
  export ANTSPATH PATH
fi

# AFNI:
AFNIHOME=/Users/arno/Software/AFNI
PATH=${AFNIHOME}:${PATH}
export AFNIHOME PATH

# Convert3d:
C3DDIR=/Users/arno/Software/c3D
PATH=${C3DDIR}/bin:${PATH}
export C3DDIR PATH

# Virtualenvwrapper:
WORKON_HOME=/Users/arno/Envs
export WORKON_HOME PATH

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
IMAGEDIR=/Software/ImageMagick/bin
PATH=${IMAGEDIR}:${PATH}
export IMAGEDIR PATH

# Caret:
CARETDIR=/Applications/caret/bin_macosx
PATH=${CARETDIR}:${PATH}
export CARETDIR PATH

# FSL:
if [ $is_litchi==1 ]; then
  FSLDIR=/Applications/fsl
fi
if [ $is_mango==1 ]; then
  FSLDIR=/usr/local/fsl
fi
if [ $is_bijli==1 ]; then
  FSLDIR=/usr/local/fsl
fi
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH

# FreeSurfer:
FREESURFER_HOME=/Applications/freesurfer
PATH=${FREESURFER_HOME}:${PATH}
FS_FREESURFERENV_NO_OUTPUT=1
FSL_DIR=${FSLDIR}
SUBJECTS_DIR=/Applications/freesurfer/subjects
#SUBJECTS_DIR=/Applications/freesurfer/subjects
#SUBJECTS_DIR=/Users/arno/Documents/Projects/extract_brain_2010/subjects
#SUBJECTS_DIR=/hd2/data/freesurfer_subjects_templates
export FREESURFER_HOME FS_FREESURFERENV_NO_OUTPUT SUBJECTS_DIR
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# VTK:
VTK=/Users/arno/Software/VTK-build
PATH=${VTK}:${PATH}
PATH=${VTK}/bin:${PATH}
export VTK PATH



# Homology-related:
export PYTHONPATH="$PYTHONPATH:/Users/arno/Software/Dionysus/build/bindings/python"
#
BOOST_ROOT=/Users/arno/Software/boost_1_43_0
PATH=${BOOST_ROOT}:${PATH}
export BOOST_ROOT PATH

#export JAVA_HOME=/Library/Java/Home
##/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
#export JAVA_OPTS="-Xmx1000M -DentityExpansionLimit=1000000"

#STAPLE=/Users/arno/crkit_build/install
#PATH=${STAPLE}/bin:${PATH}
#export DYLD_LIBRARY_PATH=${STAPLE}/vtk/lib/vtk-5.2:${STAPLE}/itk/lib/InsightToolkit:$DYLD_LIBRARY_PATH

#STAPLE=/Users/arno/crkit_build/install #bingcc/apps/staple/code
#BUNDLE="`echo "$0" | sed -e 's/\/Contents\/MacOS\/CRKit//'`"
#RESOURCES="$BUNDLE/Contents/Resources"

export PATH

. /usr/local/bin/virtualenvwrapper.sh
workon env1
