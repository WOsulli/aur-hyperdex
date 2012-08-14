#!/bin/sh

printf "<table>\n<tr> <td>Package</td> <td>Url</td> <td>Version</td></tr>\n"

for d in `find . -maxdepth 1  -type d -a -not -name '.*' -printf '%f '`; do
    eval `cat $d/PKGBUILD | awk '/^pkgver=.*/; /^pkgrel=.*/; /^url=.*/;'`
    printf '  <tr> <td>%s</td> <td>%s</td> <td>%s</td> </tr>\n' "$d" "$url" "$pkgver-$pkgrel"
done | sort

printf "</table>\n"
