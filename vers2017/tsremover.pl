#!/usr/bin/perl
#remove <s> analyses

while(<>){
  chomp;
  if (/"s" L0 Y/) { next;} 
  print $_,"\n";
}
