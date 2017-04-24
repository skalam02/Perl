#!/usr/bin/perl
use warnings;


$filename="electricity.txt";
open($file, '<:encoding(UTF-8)',$filename)
	or die "couldnt open file";
$string="";
while(<$file>) {
	$string = $string." ".$_ if $_ =~ s/(\-|:|\/|~|"|\.|,|\(|\)|\[|\])/ /g;
}

@wordarray= split /\s+/,$string;
$wordcount = @wordarray;

$icap="";
$acap="";
#sorts by alphabetical order ignoring caps
@ignorecaps= sort{ lc $a cmp lc $b } @wordarray;

#Sorts aplhabetically with Caps first
@alphsorted= sort{uc $a cmp uc $b || $a cmp $b} @wordarray;


#prints sorted ignoring caps
foreach (@ignorecaps){
	$icap=$icap."$_\n" if ($_ ne '\n');
}

#prints sorted caps first
foreach(@alphsorted) {
	$acap=$acap."$_\n" if ($_ ne '\n');
}

close $file;
sub normalize {
  $in = $_[0];
  $in =~tr/'//d;
return lc($in);
}


foreach (@wordarray) {
	$frequency{lc$_}++ if $_ !~/""/;
}

sub hashValueAscendingNum {
   $frequency{$a} <=> $frequency{$b};
}

sub hashValueDescendingNum {
   $frequency{$b} <=> $frequency{$a};
}
$freq="";
foreach $key (sort {hashValueDescendingNum}(keys(%frequency))) {
   $freq=$freq."\t$frequency{$key} \t\t $key\n";
}
$freq2="";
foreach $word (sort {hashValueDescendingNum || $a cmp $b} keys %frequency) {
	$freq2=$freq2."\t$frequency{$word} \t\t $word\n";			
}

open($OUT,'>',"part2.txt");
print $OUT "There are $wordcount words in the document\n";
print $OUT "Alphebatized ignoring case\n";
print $OUT $icap;
print $OUT "\n\n\n\n";
print $OUT "Alphebetized with caps first\n";
print $OUT $acap;
print $OUT "\n\n\n\n";
print $OUT "Frequency decending order\n";
print $OUT "\tFREQUENCY \t WORD\n";
print $OUT $freq;
print $OUT "\n\n\n\n";
print $OUT "Frequency alphebatized\n";
print $OUT "\tFREQUENCY \t WORD\n";
print $OUT $freq2;
print $OUT "\n\n\n\n";
close($OUT);
