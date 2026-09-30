#!/bin/bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <logfile>" >&2
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File does not exist: $1" >&2
    exit 2
fi

echo "Total Failed password events:"
grep -c "Failed password" "$1"

echo "Top attacker:"
grep "Failed password" "$1" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -1

echo "Top 3 attackers:"
./top3.sh "$1"

echo "Top 3 targeted usernames:"
grep "Failed password" "$1" | awk '{print $(NF-5)}' | sort | uniq -c | sort -nr | head -3


