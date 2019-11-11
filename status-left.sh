#!/bin/bash
PATH=$PATH:/usr/local/bin
# Check if yabai exists
if ! [ -x "$(command -v yabai)" ]; then
  echo "{\"error\":\"yabai binary not found\"}"
  exit 1
fi

DESKTOP_ACTIVE=$(yabai -m query --spaces --space | jq '.index')
DESKTOP_START=$(yabai -m query --spaces --display | jq '.[0].index')
DESKTOP_END=$(yabai -m query --spaces --display | jq '.[-1].index')

echo $(cat <<-EOF
{
	"desktop": {
		"active": $DESKTOP_ACTIVE,
		"start": $DESKTOP_START,
		"end": $DESKTOP_END
	}
}
EOF
)
