#!/bin/bash

# Путь к папке с src.rpm файлами
folder_path="~/Рабочий стол/пакеты"

# Создаем файл для записи зависимостей
output_file="build_requires.txt"
> $output_file

# Переходим в папку с src.rpm файлами
cd $folder_path

for file in *.src.rpm; do
    # Извлекаем содержимое .spec файла из src.rpm
    rpm2cpio $file | cpio -idmv '*.spec'

    spec_file=$(find . -name "*.spec" -type f)

    if [ -n "$spec_file" ]; then
        package_name=$(echo $file | cut -d'.' -f1)
        echo "Package: $package_name" >> $output_file
        echo "Dependencies:" >> $output_file

        while IFS= read -r line; do
            if [[ $line == BuildRequires:* ]]; then
                dependencies=$(echo $line | cut -d' ' -f2-)
                echo "- $dependencies" >> $output_file
            fi
        done < $spec_file

        echo "" >> $output_file
    fi

    rm -f *.spec
done
