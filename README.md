1. - Установить пакетный менеджер brew (https://brew.sh/);
2. - Установить DosBox-X через brew (brew install dosbox-x);
3. - Распаковать архив программы SAPR-BAR;
4. - Перейти в директорию SAPR_F31/STUDENT/, сделать копию директории Ivanov_1 (или Ivanov_2) и переименовать скопированную директорию (длина названия должна быть не больше 8 символов);
5. - Перейти в скопированную директорию и запустить файл start.command (или через терминал запустить файл start.sh).

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
