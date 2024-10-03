#!/bin/bash

# Функция для кодирования URL (для относительных ссылок)
url_encode() {
    local url="$1"
    local length="${#url}"
    for (( i = 0; i < length; i++ )); do
        local c="${url:i:1}"
        case "$c" in
            [a-zA-Z0-9._-]) printf "$c" ;;
            ' ') printf '%%20' ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
}

# Функция для рекурсивного обхода директорий и создания Markdown-дерева
generate_tree() {
    local current_dir="$1"
    local indent="$2"
    local prefix="$3"

    # Проходим по каждому элементу в директории
    for file in "$current_dir"/*; do
        # Получаем относительный путь для ссылки
        relative_path="${file#$root_dir/}"
        # Кодируем относительный путь для URL
        encoded_path=$(url_encode "$relative_path")

        # Проверяем, является ли элемент директорией
        if [ -d "$file" ]; then
            echo "${indent}* [$prefix$(basename "$file")]($encoded_path/)"
            # Рекурсивно обрабатываем подкаталоги
            generate_tree "$file" "$indent  " "$prefix"
        else
            echo "${indent}* [$prefix$(basename "$file")]($encoded_path)"
        fi
    done
}

# Устанавливаем начальную директорию
root_dir=$(pwd)

# Начинаем с заголовка
echo "# Project tree"
echo

# Запускаем генерацию дерева с начальной директории
generate_tree "$root_dir" "" ""

