#!/usr/bin/bash
echo -e "\n\033[1;32mPrune v1.0\nReady and watching . for changes.\033[0m"
while inotifywait -r -qq -e modify .; do
    clear
    g++ $(find . -regex '.+/.+\.cpp')
    if [[ $? -eq 0 ]]; then
        echo -e "\n"
        ./a.out
        if [[ $? -eq 0 ]]; then
            echo -e "\n\033[1;32mExecuted: exited with ${?}.\033[0m"
        else
            echo -e "\n\033[1;33mExecuted: exited with ${?}.\033[0m"
        fi
    else
        echo -e "\n\033[1;31mEncountered errors: compiler exited with ${?}.\nBinary will not be executed.\033[0m"

    fi
done
