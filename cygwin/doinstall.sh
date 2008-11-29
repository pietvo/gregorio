#!/bin/sh
#Script to install the gregorio cygwin distribution.

PREFIX="/usr"
BINDIR="$PREFIX/bin"
LIBDIR="$PREFIX/lib"
GRELIBDIR="$LIBDIR/gregorio"
MANDIR="$PREFIX/man/man1"

INSTALL="/usr/bin/install"

mkdir -p $BINDIR
mkdir -p $LIBDIR
mkdir -p $MANDIR
mkdir -p $GRELIBDIR

cp gregorio.1 $MANDIR
cp gprocess $BINDIR

cd fonts
python install.py
cd ..

./libtool --mode=install $INSTALL -c lib/libgregorio.la $LIBDIR/libgregorio.la
./libtool --mode=finish $LIBDIR
./libtool --mode=install $INSTALL -c plugins/dump/dump.la $GRELIBDIR/dump.la
./libtool --mode=install $INSTALL -c plugins/gabc/gabc.la $GRELIBDIR/gabc.la
./libtool --mode=install $INSTALL -c plugins/gregoriotex/gregoriotex.la $GRELIBDIR/gregoriotex.la
./libtool --mode=install $INSTALL -c plugins/opustex/opustex.la $GRELIBDIR/opustex.la
./libtool --mode=install $INSTALL -c plugins/xml/xml.la $GRELIBDIR/xml.la
./libtool --mode=finish $GRELIBDIR
$INSTALL -c bin/.libs/gregorio.exe $BINDIR/gregorio