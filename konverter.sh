#!/bin/sh
RADA=~/Programmid/gitparser/november17
RADAMRF=~/Programmid/vabamorf-master/apps/cmdline/project/unix
RADADCT=~/Programmid/vabamorf-master/dct/binary/

#kustuta ise ara lausestajast kuni json2mrf, kui tahad kasutada teisel kujul morfanalusaatorit

cat $1 | $RADA/rlausestaja.pl | $RADA/wr2json.pl | $RADAMRF/etana analyze -lex $RADADCT/et.dct -guess | sed -e "s/[\]n/\n/g"| $RADA/json2mrf.pl  | $RADA/rtolkija.pl | $RADA/pron17.pl | $RADA/tcopyrem_kaili.pl | $RADA/tkms2cg3.pl | vislcg3 -g $RADA/preprocess.rul > $1.cg3

