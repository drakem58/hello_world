#!/usr/bin/perl

# purpose of this perl script is to remove a line with <a> in a file
# you can do perl -n -e 'unless (/<a>) {print, "\n"}' input_filename

use warnings;
use strict;

opendir /var/openv/log, "replace this with the location of folder containing your input files";
while($f = readdir(/var/openv/log))
{
if($f = /.*\.txt/)#replace txt with other file extensions
{
open IN, "location of dir/$f";
open OUT, "location of output dir/$f";
while(<IN>)
{
chomp;
if($_ = /^(\<a\>)/)#if starting with <a> otherwise remove ^
{
next;
}
else
{
print OUT "$_\n";
# you can also add more parsing code here
}
}
close IN;
close OUT;
}
else
{
next;
}
}
closedir DIR;