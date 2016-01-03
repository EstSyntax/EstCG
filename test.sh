#!/bin/sh
RADA=./
RADAMRF=~/vabamorf/apps/cmdline/project/unix
RADADCT=~/vabamorf/dct

cat $1 | $RADA/rlausestaja.pl | $RADA/wr2json.pl | $RADAMRF/etana analyze -lex $RADADCT/et.dct -guess | $RADA/json2mrf.pl | $RADA/rtolkija.pl | $RADA/tpron.pl | $RADA/tcopyremover.pl |awk -f $RADA/TTRELLID.AWK | $RADA/tagger09 $RADA/abileksikon06utf.lx stdin stdout | $RADA/tcopyremover.pl | $RADA/tkms2cg3.pl | vislcg3 -o -g $RADA/clo.rul | vislcg3 -o -g $RADA/morfyhe.rul | vislcg3 -o -g $RADA/PhVerbs.rul  | vislcg3 -o -g $RADA/pindsyn.rul |vislcg3 -o -g $RADA/strukt.rul | $RADA/1reaks.pl | $RADA/inforemover.pl > $1.cg3
