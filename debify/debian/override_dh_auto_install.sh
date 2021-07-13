#!/bin/bash

source debian/vars.sh

set -x

rm -rf $DEB_INSTALL_ROOT
# install module
mkdir -p $DEB_INSTALL_ROOT$_httpd_moddir

install -m0755 .libs/$module_name.so $DEB_INSTALL_ROOT$_httpd_moddir/
# install docs
#echo "Installing docs"
#mkdir -p $DEB_INSTALL_ROOT$_defaultdocdir
#install $SOURCE1 $DEB_INSTALL_ROOT$_docdir
#install README CHANGES $DEB_INSTALL_ROOT$_docdir
# install apache config
mkdir -p $DEB_INSTALL_ROOT$_httpd_modconfdir
echo "LoadModule $module_name_module modules/$module_name.so" > $DEB_INSTALL_ROOT$_httpd_modconfdir/900-$module_name.conf

mkdir -p debian/tmp/usr/share/doc/$full_package_name

cp CHANGES debian/tmp/usr/share/doc/$full_package_name
cp LICENSE-2.0.txt debian/tmp/usr/share/doc/$full_package_name
cp README debian/tmp/usr/share/doc/$full_package_name

echo "FILELIST"
find . -type f -print | sort

