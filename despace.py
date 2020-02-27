#!/usr/bin/python
#-*- coding: utf-8 -*-

# agrell@havi.de, 2014

######################################################
# Das vorliegende Skript wandelt bei Kopiervorgängen #
# störenden Whitespace in Unterstriche um.           #
######################################################

from glob import glob
from sys import argv
from os import rename

lst = glob("*." + argv[1])

for l in lst:
    name = l.replace(" ", "_")
    rename(l, name)

