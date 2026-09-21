#!/usr/bin/env bash
# Interactive menu to SSH into hosts listed in a sidecar config file.
# Default config: same directory as this script, file name ssh-targets.conf
# Override with: SSH_TARGETS_FILE=/path/to/file ./ssh-menu.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SSH_TARGETS_FILE:-${SCRIPT_DIR}/ssh-targets.conf}"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Config file not found: ${CONFIG_FILE}"
  exit 1
fi

TARGETS=()
while IFS= read -r line || [[ -n "${line}" ]]; do
  # Strip leading/trailing whitespace
  line="${line#"${line%%[![:space:]]*}"}"
  line="${line%"${line##*[![:space:]]}"}"

  # Skip blank lines and comments
  [[ -z "${line}" || "${line}" == \#* ]] && continue

  if [[ "${line}" != *"|"* ]]; then
    echo "Skipping invalid line (missing '|'): ${line}"
    continue
  fi

  TARGETS+=("${line}")
done < "${CONFIG_FILE}"

if [[ ${#TARGETS[@]} -eq 0 ]]; then
  echo "No targets found in ${CONFIG_FILE}"
  exit 1
fi

echo "========================================"
echo "  SSH target menu"
echo "  Config: ${CONFIG_FILE}"
echo "========================================"
echo

i=1
for item in "${TARGETS[@]}"; do
  name="${item%%|*}"
  dest="${item##*|}"
  printf "  %d) %-16s  %s\n" "$i" "$name" "$dest"
  i=$((i + 1))
done
echo "  0) Quit"
echo

read -r -p "Choose a target [0-$((i - 1))]: " choice

if [[ -z "${choice}" ]]; then
  echo "No selection. Exiting."
  exit 1
fi

if ! [[ "${choice}" =~ ^[0-9]+$ ]]; then
  echo "Invalid input: ${choice}"
  exit 1
fi

if [[ "${choice}" -eq 0 ]]; then
  echo "Bye."
  exit 0
fi

if [[ "${choice}" -lt 1 || "${choice}" -ge "${i}" ]]; then
  echo "Choice out of range: ${choice}"
  exit 1
fi

selected="${TARGETS[$((choice - 1))]}"
name="${selected%%|*}"
dest="${selected##*|}"

echo
echo "Connecting to ${name} (${dest}) ..."
echo "Tip: exit the remote session with 'exit' or Ctrl-D."
echo

exec ssh "${dest}"
