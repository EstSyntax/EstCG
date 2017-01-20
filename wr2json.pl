#!/usr/bin/perl
#remove <s> analyses
use open qw(:std :utf8);

print "{\n\t\"paragraphs\": [\n\t\t{\n\t\t\t\"sentences\": [";
my $s = 2;
my $o = "";
while(<>){
  chomp;
  
  if (/[\"]+/) { $o="'"; }
  else { $o = '"'; }
  if (/<s>/) { 
    if ($s < 2) {
      print ",";
    }
    print "\n\t\t\t\t{\n\t\t\t\t\t\"words\": [";
    $s = 1;
  } 
  else {
    if (/<\/s>/) { 
      print "\n\t\t\t\t\t]\n\t\t\t\t}";
    }
    else {  
      if ($s == 0) {
        print ",";
      }
      print "\n\t\t\t\t\t\t{\n\t\t\t\t\t\t\t\"text\": $o";
      print $_, "$o\n\t\t\t\t\t\t}";
      $s = 0;
    }
  }
}

print "\n\t\t\t]\n\t\t}\n\t]\n}\n";

