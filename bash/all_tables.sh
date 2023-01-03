#!/bin/bash

TABLE='../html/tables.html'
STRUCT='../html/struct.html'

cat $STRUCT | sed -n '/{CONTENT}/q;p' > $TABLE

# echo "<h3>Espagnol - batiburrillo</h3>" >> $TABLE
# echo "<div class='box'>" >> $TABLE
# cat "../html/content/batiburrillo-table.html" >> $TABLE
# echo "</div>" >> $TABLE

# echo "<h3>Chinois - 大杂烩</h3>" >> $TABLE
# echo "<div class='box'>" >> $TABLE
# cat "../html/content/dazahui-table.html" >> $TABLE
# echo "</div>" >> $TABLE

echo "<h3>Français - Méli-mélo</h3>" >> $TABLE
echo "<div class='box'>" >> $TABLE
cat "../html/content/méli-mélo-table.html" >> $TABLE
echo "</div>" >> $TABLE

tail -r $STRUCT | sed -n '/{CONTENT}/q;p' | tail -r >> $TABLE
