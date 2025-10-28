#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Path to input file
FILE="${SCRIPT_DIR}/lspconfig.lua"

# Pattern setup schemas
LINE_MATCH_PATTERN="value change for turn_script.sh"

LINE_NUMBER_PATTERN="^\d+(?=:)" # numbers from start to colon but without colon

START_BETWEEN_VAL1="= "
STOP_BETWEEN_VAL1=","
BETWEEN_PATTERN_VAL1="${START_BETWEEN_VAL1}\K[^${STOP_BETWEEN_VAL1}]+"

START_BETWEEN_VAL2="\["
STOP_BETWEEN_VAL2="\]"
BETWEEN_PATTERN_VAL2="${START_BETWEEN_VAL2}\K[^${STOP_BETWEEN_VAL2}]+"

# Loop through lines
grep -n "${LINE_MATCH_PATTERN}" "${FILE}" | while IFS= read -r LINE; do

  # Grasp values
  VAL1=$(echo "${LINE}" | grep -oP "${BETWEEN_PATTERN_VAL1}")
  VAL2=$(echo "${LINE}" | grep -oP "${BETWEEN_PATTERN_VAL2}")
  LINE_NUMBER=$(echo "${LINE}" | grep -oP "${LINE_NUMBER_PATTERN}")

  # Replace values
  sed -i "${LINE_NUMBER}s/${START_BETWEEN_VAL1}${VAL1}${STOP_BETWEEN_VAL1}/${START_BETWEEN_VAL1}${VAL2}${STOP_BETWEEN_VAL1}/" "$FILE"
  sed -i "${LINE_NUMBER}s/${START_BETWEEN_VAL2}${VAL2}${STOP_BETWEEN_VAL2}/${START_BETWEEN_VAL2}${VAL1}${STOP_BETWEEN_VAL2}/" "$FILE"
done
