#!/bin/bash
PATH='../html/tables.html'

echo '<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello Bulma!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
  <body>' > $PATH

# TABLE_ES=`cat "../html/batiburrillo-table.html"`
# TABLE_CN=$(cat "../html/dazahui-table.html")
TABLE_FR=$(<../html/méli-mélo-table.html)
echo $TABLE_FR >> $PATH

echo '</body>
</html>' >> $PATH