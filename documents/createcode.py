#!/usr/bin/python
import sys
#Create a file with the code executed on the latex that can be imported to a python
#session

fin=open(sys.argv[1])
fout=open('codigopy.py','wt')

for line in fin:
    if line == '=>PYTHONTEX:SETTINGS#\n':
        break
    fout.write(line.replace('=>','#'))


fin.close()
fout.close()
