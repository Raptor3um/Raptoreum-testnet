#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

RAPTOREUMD=${RAPTOREUMD:-$SRCDIR/raptoreumd}
RAPTOREUMCLI=${RAPTOREUMCLI:-$SRCDIR/raptoreum-cli}
RAPTOREUMTX=${RAPTOREUMTX:-$SRCDIR/raptoreum-tx}
RAPTOREUMQT=${RAPTOREUMQT:-$SRCDIR/qt/raptoreum-qt}

[ ! -x $RAPTOREUMD ] && echo "$RAPTOREUMD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
RTMVER=($($RAPTOREUMCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for raptoreumd if --version-string is not set,
# but has different outcomes for raptoreum-qt and raptoreum-cli.
echo "[COPYRIGHT]" > footer.h2m
$RAPTOREUMD --version | sed -n '1!p' >> footer.h2m

for cmd in $RAPTOREUMD $RAPTOREUMCLI $RAPTOREUMTX $RAPTOREUMQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${RTMVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${RTMVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
