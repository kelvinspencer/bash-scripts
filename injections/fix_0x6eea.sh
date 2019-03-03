#!/bin/bash
# 				
#|**********************************************************************;
#* Project           : Clean _0x6eea infected files.
#*
#* Program name      : fix_0x6eea.sh
#*
#* Author            : Kelvin Spencer
#*
#* Date created      : 20190303
#*
#* Purpose           : This script was created to quickly clean files that
#                      are infected with a lin of code that starts with
#                      var _0x6eea. This line of code typically appears in
#                      js/javascript files and cause a redirect to a random
#                      domain. This script makes a backup of the infected
#                      file and cleans it based on the single directory
#                      provided.
#*
#* Revision History  :
#*
#* Date        Author         Ref    Revision (Date in YYYYMMDD format) 
#* 20190303    kelvinspencer  1      Initial Push. 
#*
#|**********************************************************************;

# How To Execute: (Must be root user on server)
# chmod +x fix_0x6eea.sh
# ./fix_0x6eea.sh <directory> 
# #only files in that directoy non-recursive.
#
#
# $1 is the directory and is required, failing to do so may result in unintended results.
for file in $1
do
    if [ -f "$file" ]; then   
     	echo $file 
	cp -rp $file $file".bak"
	#sed -i 's/bx29)}());/\n\n\/*deleted _0x6eea hackinjection*\/\n\n/' $file
	sed -i 's/bx29)}());/\n\n\n\n/' $file
	sed -i '/_0x6eea/d' $file
    fi
done
