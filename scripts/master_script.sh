#!/bin/bash

# master script

echo "._______ .______  ._______  ._____.___ .____________._.___.__  ._______.____     .________ "
echo ": ____  |: __   \ : .___  \ :         |: .____/\__ _:|:   |  \ : .____/|    |___ |    ___/ "
echo "|    :  ||  \____|| :   |  ||   \  /  || : _/\   |  :||   :   || : _/\ |    |   ||___    \ "
echo "|   |___||   :  \ |     :  ||   |\/   ||   /  \  |   ||   .   ||   /  \|    :   ||       / "
echo "|___|    |   |___\ \_. ___/ |___| |   ||_.: __/  |   ||___|   ||_.: __/|        ||__:___/ " 
echo "         |___|       :/           |___|   :/     |___|    |___|   :/   |. _____/    :   "  
echo "                     :                                                  :/       "         
echo "                                                                        :     "            

scripts=("scripts/venv.sh" "scripts/verify.sh")
exists=0
notValid=0
satisfied=0
isInList()
{
    for i in "${scripts[@]}";
    do
        if [ "$1" = "$i" ];
        then
            echo "Running config...."
            exists=1
            break
        fi
    done
    if [ "$exists" = 1 ];
    then
        return
    fi
    echo "config not found :("
    exists=0
}

configOptions()
{
    echo "Configuration Options:"
    echo
    for i in "${scripts[@]}";
    do  
        chmod +x $i
        echo "  $i" 
    done
    echo

    while [ $exists != 1 ]
    do
        echo "What would you like to configure?"
        echo
        read config
        echo
        isInList $config
    done
    source $config
    exists=0
}
while [ $notValid != 1 ]
    do
        configOptions
        echo "All finished with configurations? [y/n]"
        read conf
        if [ "$conf" = 'y' ]
        then
            echo "Ok! Good luck with the rest of the image!"
            notValid=1
            exit
        fi
        if [ "$conf" = 'n' ]
        then
            configOptions
        fi
    done

# make end script option + check if user still wants to do more configs