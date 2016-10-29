#!/bin/bash
set -e

#dir=~/dotfiles
olddir=~/dotfiles_old

# create dotfiles_old in homedir		
echo "Creating $olddir for backup of any existing dotfiles in ~"		
mkdir -p $olddir		
echo "...done"		

dir=`pwd`
files=`ls $dir`
for file in $files; do		    
  hidden=".$file" 
  if [ -f ~/$hidden ];
  then
    echo "Moving existing $hidden ~ to $olddir"		    
    mv ~/$hidden $olddir
  fi
  echo "Creating symlink to $hidden in home directory."		    
  ln -s $dir/$file ~/$hidden
done		

#source ~/.bashrc		
#source ~/.vimrc
