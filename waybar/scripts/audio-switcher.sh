#!/bin/bash

TYPE=$1

if [ "$TYPE" = "sink" ]; then
    # Obtiene las salidas de audio
    ITEMS=($(pactl list short sinks | awk '{print $2}'))
    CURRENT=$(pactl get-default-sink)
    NOTIFY_TITLE="Salida de Audio"
elif [ "$TYPE" = "source" ]; then
    # Obtiene las entradas (micrófonos), ignorando los "monitors" (que son el audio del sistema)
    ITEMS=($(pactl list short sources | grep -v "\.monitor" | awk '{print $2}'))
    CURRENT=$(pactl get-default-source)
    NOTIFY_TITLE="Entrada de Audio"
else
    echo "Uso: $0 [sink|source]"
    exit 1
fi

# Busca el índice del dispositivo actual
INDEX=0
for i in "${!ITEMS[@]}"; do
    if [ "${ITEMS[$i]}" = "$CURRENT" ]; then
        INDEX=$i
        break
    fi
done

# Calcula el índice del siguiente dispositivo en la lista
NEXT_INDEX=$(( (INDEX + 1) % ${#ITEMS[@]} ))
NEXT_ITEM=${ITEMS[$NEXT_INDEX]}

# Cambia al nuevo dispositivo y mueve los flujos de audio activos
if [ "$TYPE" = "sink" ]; then
    pactl set-default-sink "$NEXT_ITEM"
    for input in $(pactl list short sink-inputs | awk '{print $1}'); do
        pactl move-sink-input "$input" "$NEXT_ITEM" 2>/dev/null
    done
else
    pactl set-default-source "$NEXT_ITEM"
    for output in $(pactl list short source-outputs | awk '{print $1}'); do
        pactl move-source-output "$output" "$NEXT_ITEM" 2>/dev/null
    done
fi

# Notificación opcional (requiere libnotify)
# notify-send -t 2000 "$NOTIFY_TITLE" "Cambiado a:\n$NEXT_ITEM"
