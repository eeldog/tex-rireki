#! /bin/sh

pstops '2:0L@1(25.7cm,0)+1L@1(25.7cm,18.1cm)' $1 | \
 awk '/^%%DocumentPaperSizes:/{$2="B4"}; {print $0}'
