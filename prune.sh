#!/usr/bin/bash

# Prune v1.0

# Define constants
    
readonly RED="\033[1;31m"
readonly GREEN="\033[1;32m"
readonly YELLOW="\033[1;33m"
    
readonly STOP="\033[0m"

# Logging function
# Params: level (int), message (str) 

function log() {

    if [[ $1 -eq 1 ]]; then
        echo -e "${RED}${2}${STOP}"
    elif [[ $1 -eq 2 ]]; then
        echo -e "${YELLOW}${2}${STOP}" 
    else
        echo -e "${GREEN}${2}${STOP}"
    fi
}

# Start message

log 3 "\nPrune v1.0\nReady and watching . for changes."

# When a change is detected in .

while inotifywait -r -qq -e modify .; do

    clear

    # Compile
    # TODO: add support for make

    g++ $(find . -regex '.+/.+\.cpp')

    # Log info about compilation and run binary

    if [[ $? -eq 0 ]]; then
        echo -e "\n"

        ./a.out

        if [[ $? -eq 0 ]]; then
            log 3 "\nExecuted: exited with ${?}."
        else
            log 2 "\nExecuted: exited with ${?}."
        fi

    else
        log 1 "\nEncountered errors: compiler exited with ${?}.\nBinary will not be executed."

    fi

done
