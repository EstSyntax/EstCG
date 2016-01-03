#!/usr/bin/perl -w
#tõlgendused ühest reast eraldi ridadeks

while(<>){
#if (/\/\//) {
#if (/_Z_/) { next;}
if (/<s>/ or /<\/s>/ or /\/\//) {
s/    /\n    /g;
  #chomp;
  print;
  #print "\n";
}
else { print; } # kui see rida eemaldada, siis ignoreeri-osad kustutatakse ära
}  
