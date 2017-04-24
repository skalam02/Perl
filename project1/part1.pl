#!/usr/bin/perl
#use warnings;

#1
$filename = 'solar.txt';
open($FILE, '<:encoding(UTF-8)',$filename)
	or die "Couldnt open file";
while ($row =<$FILE>) {
	$p1=$p1.$row if $row=~/(\w*) (\w*) (\w*) (\d*) (-?\d*\.?\d*|\?) (-?\d*\.?\d*|\?) (-?\d*\.?\d*|\?) (.) (\d*)/;	
}
close $file;

#2
open($FILE, '<:encoding(UTF-8)',$filename)
	or die "Couldnt open file";
while ($row =<$FILE>) {
	$p2=$p2.$row if $row=~ s/ ([A-Z]*|-) / /;
}
close $FILE;

#3
open($FILE, '<:encoding(UTF-8)',$filename)
	or die "Couldnt open file";
while (<$FILE>) {
	$p3=$p3.$_ if $_=~ /\w* \w* \d* -{1}/
}
close $FILE;

#4
open($FILE, '<:encoding(UTF-8)',$filename)
	or die "Couldnt open file";
while (<$FILE>) {
	$p4=$p4.$_ if $_=~ /Voyager2/
}
close $FILE;

#5
open($FILE, '<:encoding(UTF-8)', $filename)
	or die "couldn't open file";
while (<$FILE>) {
	@words = split / /,$_ ;
	if ($words[4]=~ /\d*\.?\d+/){
		$words[4]=$words[4]*86400;
	}
	$p5=join(" ",@words);
	$px=$px.$p5;
}
close $FILE;

open($OUT,'>'."part1.txt");
print $OUT $p1;
print $OUT "\n$p2";
print $OUT "\n$p3";
print $OUT "\n$p4";
print $OUT "\n$px";
close $OUT;
