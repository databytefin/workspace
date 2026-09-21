#!/usr/bin/env bash

watch -n 5 '
echo "Index, GPU, VRAM (GB), GPU Usage (%)"
nvidia-smi \
  --query-gpu=index,name,memory.used,memory.total,utilization.gpu \
  --format=csv,noheader,nounits |
awk -F", " '\''{
    printf "%s, %s, %.2f/%.2f, %s\n",
           $1, $2, $3/1024, $4/1024, $5
}'\''

echo
echo "--- Active Processes & Users ---"
printf "%-12s %-7s %s\n" "USER" "PID" "COMMAND"

nvidia-smi \
  --query-compute-apps=pid \
  --format=csv,noheader |
while read -r pid; do
    ps -p "$pid" -o user=,pid=,cmd=
done
'