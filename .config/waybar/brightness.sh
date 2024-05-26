echo $(brightnessctl -l | awk '/Device '\''acpi_video0'\''/{getline; gsub(/[()]/,"",$NF); print $NF}')
