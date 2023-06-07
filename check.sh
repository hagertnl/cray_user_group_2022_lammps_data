#!/bin/bash

for potential in ./*; do
    if [ -d $potential ]; then
        for d in $potential/*; do
            not_found=0
            for machine in summit spock crusher miller; do
                if [ ! -f ${d}/log.$machine.replicate.1.run.1 ]; then
                    not_found=$(expr $not_found + 1)
                    echo "Did not find $machine!"
                fi
            done
            if [ ! "$not_found" == "0" ]; then
                echo "$d is not complete!"
            fi
        done
    fi
done
