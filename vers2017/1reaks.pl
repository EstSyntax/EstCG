#!/usr/bin/perl -w
#tõlgendused eraldi ridadest üheks reaks

while(<>){
chomp;
print;
while(<>){
if (!(/^[ \11]/)) {
  print "\n";
  }
  chomp;
  print;
}
exit;
}  
