#!/bin/bash

output_file="SpecList.txt"

find . -type f -name "*.spec" -exec basename {} \; > $output_file

echo "Названия всех spec файлов в текущей директории были записаны в $output_file."
#!/bin/bash

for rpm_file in *.rpm; do
    rpm2cpio $rpm_file | cpio -idmv '*.spec'
done

