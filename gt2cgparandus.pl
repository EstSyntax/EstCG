#!/usr/bin/perl -w


while(<>){
  $line=$_; 
  chomp($line); 
  #$line =~ s/(<.*>)/"$1"/g;
  $line =~ s/\t\t/\t/g;
  if ($line =~ m/^"<p\s*"heading/) {print; next;} #lõiguga ära tee midagi
  $line =~  s/(\S+) "/$1 \n\t"/g; #sissejäänud morf mitmesused  
  
  
  #partiklid ja muu pudi
  $line =~ s/_B_/B/g;
  $line =~ s/_G_/G/g;
  $line =~ s/_I_/I/g;

  #kvm
  $line =~ s/L Z Coma/Z Com/g;
  
  
  #verbid
  #$line=~ s/_V_ PERS PRT IMPRT/V main pers partic/g;
  $line=~ s/ _V_ PERS PRT PRC/ V main partic past ps/g;
  $line=~ s/ _V_ PERS PRS PRC/ A pos partic <v>/g;  
  $line=~ s/ mod / main /g;
  
  #kaassõnad
  $line=~ s/K pre/K/g;
  $line=~ s/K post/K/g;
  
  #sidesõnad
  $line=~ s/J sub crd/J/g;
  
  print $line, "\n";
}


