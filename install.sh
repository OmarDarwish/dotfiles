#/!/usr/bin/env bash
#Figure out directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

read -r -p "This will overwrite existing files. Continue? Y/N " response
case $response in
    [yY][eE][sS]|[yY]) 
	#Find all dotfiles in script's path
	filelist=(`find $DIR -name ".*" -not -path "./.git*" -type f -a -not -name "*.swp"`)
	ln -sf "${filelist[@]}" ~
	echo ${#filelist[@]} dotfiles installed in ~
        ;;
    *)
	echo Exiting...
	exit 1
        ;;
esac
