#!/bin/bash

# (2 points)
# For the first subtask, you'll have to run the src/proc1.py
# file three times (after each time sleep for 1 second) in a 
# for loop and wait for them to be finished.
# Do this 2 times (nested for loops) and wait for 10 seconds after
# each 3 runs.

########## Your Code Here ##########
for i in {1..2}; do
    for i in {1..3}; do
        echo $i
        python src/proc1.py
        sleep 1
    done
    sleep 10
done
####################################

# (3 points)
# In this part, you'll first run the src/proc2.py file in the background.
# then you'll send Ctrl+C, Ctrl+Z, and SIGTERM signal to the process
# sleep 5 seconds after starting the process
# sleep 3 seconds after sending the signal
########## Your Code Here ##########
python src/proc2.py &
sleep 5
pidof python
pkill -SIGINT python 
sleep 3
pkill -SIGTSTP python
sleep 3
pkill -SIGTERM python
sleep 3
####################################