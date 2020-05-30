#!/bin/bash
set -e

echo "Installing for all Cura versions... "

srcdir="$(readlink -f "`dirname $0`/..")"
destdir=$HOME/.local/share/cura
VERSIONS="$(ls -d $destdir/*/)"

cd $srcdir
for version in $VERSIONS ; do
	echo "Installing via symbolic link to $version"

	for plugin in plugins/* ; do
		if ! [ -e "${version}${plugin}" ] ; then
			echo "Installing $plugin -> ${version}${plugin}"
			ln -s "${srcdir}/${plugin}" "${version}${plugin}"
		else
			echo "$plugin already installed."
		fi
	done
done
