#!/usr/bin/perl
# kustutab est-cg formaadis tekstist est-cg spetsiifilist lisainformatsiooni:
# 	- pealauses sisalduvate kõrvalosalausete piirid: "<{>" ja "<}>" (kui ilma tõlgenduseta)
# 	- kõik lisainfo nurksulgudes ning lisaalgvorm tuletatud sõnede (nt partitsiibid) korral
# eeldused: korralik est-cg formaadis sisend  
# kasutus nt: 
#	/usr/bin/perl inforemover.pl <[sisend] >[vahevaljund]
# pärast perli skripti rakendamist on vajalik käivitada lisaks:
#	vislcg3 -g par.rle <[vahevaljund] >[valjund]

while(<>){
  chomp;

  if ((/^"<{>"/ and not /"{"/) or (/^"<}>"/ and not /"}"/)) { next; }
  s/^    /\t/g; 
  s/^\t /\t/g; 

  s/(.*)" ([LZT]{1}.*) CLBC (.*)/$1" $2 $3/g; 
  s/(.*)" L([^"<]*) ["<]{1}(.*) (@.*)/$1" L$2 $4/g; 

  s/    /\n    /g;
  s/\11/\n\11/g;
  s/CLB CLB/CLB/g;
  chomp;
  print $_,"\n";
}


