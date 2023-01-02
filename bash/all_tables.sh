#!/bin/bash

TABLE='../html/tables.html'

echo '<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello Bulma!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
  <body>' > $TABLE

echo "<h3>Espagnol - batiburrillo</h3>" >> $TABLE
echo "<div class='box'>" >> $TABLE
cat "../html/batiburrillo-table.html" >> $TABLE
echo "</div>" >> $TABLE

echo "<h3>Chinois - 大杂烩</h3>" >> $TABLE
echo "<div class='box'>" >> $TABLE
cat "../html/dazahui-table.html" >> $TABLE
echo "</div>" >> $TABLE

echo "<h3>Français - Méli-mélo</h3>" >> $TABLE
echo "<div class='box'>" >> $TABLE
cat "../html/méli-mélo-table.html" >> $TABLE
echo "</div>" >> $TABLE

echo '</body>
</html>' >> $TABLE
