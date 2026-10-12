# Инструкция по запуску на MacOS:
1. Установить пакетный менеджер brew (https://brew.sh/);
2. Установить DosBox-X через brew (brew install dosbox-x);
3. Распаковать архив программы SAPR-BAR для Linux;
4. Перейти в директорию SAPR_F31/STUDENT/, сделать копию директории Ivanov_1 (или Ivanov_2) и переименовать скопированную директорию (длина названия должна быть не больше 8 символов);
5. Перейти в скопированную директорию и запустить файл start.command (или в терминале выполнить ./start.sh).

## В случае ошибки при запуске:
1. start.command - разрешить запуск файла в настройках (как это делается можно узнать в интернете) и повторно запустить файл;
2. start.sh - нужно в терминале (находясь в директории, где лежит файл) выполнить команду chmod +x start.sh и повторно выполнить ./start.sh.

# Команда запуска на MacOS:
```shell
#!/bin/sh

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$CURRENT_DIR/../.." && pwd)"

if [ -f "/opt/homebrew/bin/dosbox-x" ]; then
    DOSBOX_BIN="/opt/homebrew/bin/dosbox-x"
else
    DOSBOX_BIN="/usr/local/bin/dosbox-x"
fi

if [ -f "$CURRENT_DIR/dosbox.conf" ]; then
    CONF_ARG="-conf $CURRENT_DIR/dosbox.conf"
else
    CONF_ARG=""
fi

"$DOSBOX_BIN" $CONF_ARG \
    -c "mount c \"$ROOT_DIR\"" \
    -c "c:" \
    -c "\EXE\SAPR_B31\FILES\SAPR_B31.EXE" \
    -c "exit"

```
