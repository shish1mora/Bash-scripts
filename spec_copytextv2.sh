#!/bin/bash

output_file="SpecList.txt"

find . -type f -name "*.spec" -exec basename {} \; > temp_file

echo -n "#!/bin/bash " > $output_file
cat temp_file | tr '\n' ' ' >> $output_file

rm temp_file

echo "Названия всех spec файлов в текущей директории были записаны в $output_file."
