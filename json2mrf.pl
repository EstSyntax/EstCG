#!/usr/bin/perl

my $s = 0;
my $word = "";
my $read = "";
my $reads = "";
my $ending = "";
my $form = "";
my $pos = "";
my $lemma = "";
while(<>){
  chomp;
  if (/^\t\t\t\t{/){ # sentence
    $s = 1;
    print "<s>\n";
  }
  if (/^\t\t\t\t}/){ # sentence
    $s = 0;
    print "</s>\n";
  }
  if ($s == 1) { 
    if (/^\t\t\t\t\t\t\t"text":/) { # 7 "text": "Kes"
      s/^\t\t\t\t\t\t\t"text": "(.*)"$/$1/g;
      $word = $_;
      if ($reads eq "") { 
        if ($word eq '\"' or $word eq '\\"' or $word eq '\\' or $word eq '\\\\"') {
          print "\"\n    \"\"\" //_Z_ //\n"; 
        }
        else {
          print $word."\n    ".$word." //_Z_ //\n";
        }
      }
      else {
        print $word."\n".$reads; # word and readings
      }
      $word = "";
      $reads = "";
      next;
    }
    if (/^\t\t\t\t\t\t\t\t{/) { # 8 { reading starts
      $gi = "";
      $ending = "";
      $form = "";
      $pos = "";
      $lemma = "";
      next;
    }
    if (/^\t\t\t\t\t\t\t\t}/) { # 8 { reading ends
      if ($pos eq "Z") { 
        $read = "    ".$lemma." //_".$pos."_ //\n";
      }
      else { 
        $read = "    ".$lemma."+".$ending.$gi." //_".$pos."_ ".$form." //\n";
      }
      $reads = $reads.$read;
      next;
    }
    if (/^\t\t\t\t\t\t\t\t\t"clitic":/) { # 9 "clitic": "",
      s/^\t\t\t\t\t\t\t\t\t"clitic": "(.*)",/$1/g;
      $gi = $_;
      next;
    }
    if (/^\t\t\t\t\t\t\t\t\t"ending":/) { # 9 "ending": "",
      s/^\t\t\t\t\t\t\t\t\t"ending": "(.*)",/$1/g;
      $ending = $_;
      next;
    }
    if (/^\t\t\t\t\t\t\t\t\t"form":/) { # 9 "form": "",
      s/^\t\t\t\t\t\t\t\t\t"form": "(.*)",/$1/g;
      $form = $_;
      next;
    }
    if (/^\t\t\t\t\t\t\t\t\t\"partofspeech\":/) { # 9 "partofspeech": "",
      s/^\t\t\t\t\t\t\t\t\t\"partofspeech\": "(.*)",/$1/g;
      $pos = $_;
      next;
    }
    if (/^\t\t\t\t\t\t\t\t\t"root":/) { # 9 "root": "",
      s/^\t\t\t\t\t\t\t\t\t"root": "(.*)"/$1/g;
      $lemma = $_;
    }
  } 
} 

