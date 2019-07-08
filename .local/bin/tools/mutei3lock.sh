# !/bin/bash
isMuted="$(pacmd list-sinks | awk '/muted/ { print $2 }')"
if [ "$isMuted" = "no" ]; then
	pactl set-sink-mute 0 toggle
fi
