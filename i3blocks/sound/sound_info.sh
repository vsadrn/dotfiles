#!/bin/sh


VOLUME_MUTE="🔇"
VOLUME_LOW="🔈"
VOLUME_MID="🔉"
VOLUME_HIGH="🔊"
SOUND_LEVEL=$(amixer -M get Master | awk -F"[][]" '/%/ { print $2 }' | awk -F"%" 'BEGIN{tot=0; i=0} {i++; tot+=$1} END{printf("%s\n", tot/i) }')
MUTED=$(amixer get Master | awk ' /%/{print ($NF=="[off]" ? 1 : 0); exit;}')

ICON=$VOLUME_MUTE
if [ "$MUTED" = "1" ]
then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -lt 34 ]
    then
        ICON="$VOLUME_LOW"
        COLOR="#ffffff"
    elif [ "$SOUND_LEVEL" -lt 67 ]
    then
        ICON="$VOLUME_MID"
        COLOR="#bada55"
    else
        ICON="$VOLUME_HIGH"
        COLOR="#ff4a55"
    fi
fi

#echo $ICON
#echo $SOUND_LEVEL
#echo $COLOR
echo "$ICON" "$SOUND_LEVEL" "$COLOR" | awk '{ printf(" %s:%3s%% \n %s \n", $1, $2, $3) }'
