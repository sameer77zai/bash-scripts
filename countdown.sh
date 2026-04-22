#!/bin/bash

echo "Countdown Starting..."
echo ""

COUNT=5
while [ $COUNT -gt 0 ]; do
    echo "  $COUNT ..."
    COUNT=$((COUNT - 1))
    sleep 1
done

echo ""
echo "  🚀 Liftoff!"
