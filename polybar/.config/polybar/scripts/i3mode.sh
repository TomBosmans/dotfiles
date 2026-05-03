#!/bin/bash

# Show current mode initially
mode=$(i3-msg -t get_binding_state | jq -r '.name')
[ "$mode" != "default" ] && echo "$mode"

# Listen for mode changes
i3-msg -t subscribe '[ "mode" ]' | while read -r _; do
  mode=$(i3-msg -t get_binding_state | jq -r '.name')
  if [ "$mode" != "default" ]; then
    echo "$mode"
  else
    echo ""  # empty output hides the module
  fi
done

