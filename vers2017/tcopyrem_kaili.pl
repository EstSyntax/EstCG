#!/usr/bin/perl -w
#remove copies
#eemaldab identsed morfoloogiolise tõlgenduse read

my @puhver=();

LOE:while(<>){
  chomp;
  if (/^[^ ]/) { 
	print $_, "\n";          #trüki sõnavormi rida
	@puhver=(); 		 #nulli puhver
	next;
  }
  foreach my $p (@puhver){      #kontrolli, kas selline morf tõlgendus on juba olnud
    if ($_ eq $p) {
      next LOE;			#jäta korduv vahele ja loe uus rida sisendist
    }
  }  
  push(@puhver,$_); 		#pane morftõlgendus puhvrisse
  print $_,"\n";
}
