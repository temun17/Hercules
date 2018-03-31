#i/bin/bash
usage()
{
	echo "Usage ./gui.sh -f [Filetype] -n [Name] -d [Directory]"
	echo "C filetypes are exceptable as of now"
}
verify_intergrity()
{
	if [ "$NAME" == "" ]; then
		echo "Forgot name"
		exit 0
	elif [ "$DIRECTORY" == "" ]; then
		echo "Forgot Name/Directory"
		exit 0
	else
		build_file
		build_directories
	fi
}
clone_libft()
{
	read -p "Enter the project directory: " LIBFT
	cp -R ~/$LIBFT/ "$DIRECTORY/$NAME/libft"
}
create_directory()
{
	mkdir -p $DIRECTORY/$NAME
	read -p "Do you want to include your libft (YES/NO): " yn
	case $yn in
		[Yy]* ) clone_libft ;;
		[Nn]* ) break ;;
	esac
}
make_gitignore()
{
	touch $DIRECTORU/$NAME/.gitignore
	echo "._DS_STORE" >> $DIRECTORY/.gitignore
	echo "a.out" >> $DIRECTORY/.gitignore
	echo "._*" >> $DIRETORY/.gitignore
	echo ".Trashes" >> $DIRECTORY/.gitignore
	echo ".apdisk:" >> $DIRECTORY/.gitignore
}
build_directories()
{
	touch $DIRECTORY/$NAME/Makefile
	mkdir $DIRECTORY/$NAME/srcs
	mkdir $DIRECTORY/$NAME/includes
	mkidr $DIRECTORY/$NAME/author
	read -p "Do you want .gitignore? (YES/NO): " yn
	case $yn in
		[Yy]* ) make_gitignore ;;
		[Nn]* ) continue ;;
	esac
	read -p "Username for author file: " Author_Name
	echo "$AUTHOR_NAME" >> $DIRECTORY/$NAME/author
}
build_file()
{
	if [ -d "$DIRECTORY" ]; then
		mkdir $DIRECTORY/$NAME
		read -p "Do you want to include your libft? (YES/NO): " yn
		case $yn in
			[Yy]* ) clone_libft ;;
			[Nn]* ) break ;;
		esac
	else
		read -p "Do you want to create a directory? (YES/NO): " yn
		case $yn in
			[Yy]* ) create_diretory ;;
			[Nn]* ) echo "Please specify a valid directory" ;;
		esac
	fi
}
while getopts ":f:n:d:h" opt;
	do
		case $opt in
			f ) FILE=$OPTARG ;;
			n ) NAME=$OPTARG ;;
			d ) DIRECTORY=$OPTARG ;;
		esac
	done
if [[ $# -eq 0 ]]; then
	usage
	exit 0
fi
if [ "$FILE" != "C"]; then
	echo "Wrong Filetype!"
else
	verify_integrity
fi
		
