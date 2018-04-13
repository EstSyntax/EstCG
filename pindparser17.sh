#!/bin/sh
RADA=~/Programmid/gitparser/november17
RADAMRF=~/Programmid/vabamorf-master/apps/cmdline/project/unix
RADADCT=~/Programmid/vabamorf-master/dct/binary/

cat $1 | $RADA/rlausestaja.pl | $RADA/wr2json.pl | $RADAMRF/etana analyze -lex $RADADCT/et.dct -guess | sed -e "s/[\]n/\n/g"| $RADA/json2mrf.pl | $RADA/rtolkija.pl | $RADA/pron17.pl | $RADA/tcopyrem_kaili.pl | $RADA/tkms2cg3.pl | vislcg3 -g $RADA/preprocess.rul| vislcg3 -o -g $RADA/clo.rul | vislcg3 -o -g $RADA/morfyhe17.rul | vislcg3 -o -g $RADA/PhVerbs17.rul | vislcg3 -o -g $RADA/pindsyn17.rul > $1.pind.txt

