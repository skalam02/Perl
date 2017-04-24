#!/usr/bin/perl

$filename=$ARGV[0];

open($FILE, $ARGV[0])
	or die "Couldnt open file";
%nums= (1,"one",
        2,"two",
        3,"three",
        4,"four",
        5,"five",
        6,"six",
        7,"seven",
        8,"eight",
        9,"nine",
        0,"zero");
$str="";
$copy="";
while (<$FILE>) {
	$copy=$copy.$_;
	$str = $str.$_ if $_!~ /[\d]/;
	$str = $str.$_ if $_=~ s/(\d)/$nums{$1}/g;	
}

$p3="part3.txt";
open($EX,'>'.$p3) or die "dead";
print $EX "Before\n";
print $EX $copy;
print $EX "\nAfter\n";
print $EX $str;

