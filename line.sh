#!/bin/bash

input_file="input.txt"
output_file="output.txt"

# Проверяем, существует ли входной файл
if [ ! -f $input_file ]; then
    echo "Ошибка: Входной файл не найден."
    exit 1
fi

# Читаем содержимое файла и объединяем его в одну строку
content=$(<"$input_file")
content=$(echo $content | tr -d '\n')

# Записываем объединенное содержимое в выходной файл
echo $content > $output_file

echo "Содержимое файла $input_file было объединено в строку и записано в файл $output_file."
