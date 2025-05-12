#!/usr/bin/bash
Continue()
{
    echo "Continue? (y to continue):"
    read response
    if [[ "y" != $response ]]
    then
        echo "Exiting"
        exit 0
    fi
}

Divider()
{
    echo "============================"
    echo $1
    echo ""
}

Divider "Example 1: A Single Long-Running Job"
./mlfq.py -n 3 -q 10 -l 0,200,0 -c
Continue

Divider "Example 2: Along Came a Short Job"
./mlfq.py -n 3 -q 10 -l 0,200,0:100,20,0 -c
Continue

Divider "Example 3: What About I/O?"
./mlfq.py -n 3 -q 10 -l 0,200,0:50,25,1 -S -c
Continue

Divider "Attempt #2: The Priority Boost Without Boost"
./mlfq.py -n 3 -q 10 -l 0,200,0:100,50,5:100,50,5 -S -c
Continue

Divider "Attempt #2: The Priority Boost With Boost"
./mlfq.py -n 3 -q 10 -l 0,200,0:100,50,5:100,50,5 -S -B 100 -c
Continue

Divider "Attempt #3: Better Accounting Without Gaming Tolerance"
./mlfq.py -n 3 -q 10 -l 0,200,0:100,200,9 -S -i 1 -c
Continue

Divider "Attempt #3: Better Accounting With Gaming Tolerance"
./mlfq.py -n 3 -q 10 -l 0,200,0:100,200,9 -i 1 -c
Continue

Divider "Lower Priority, Longer Quanta"
./mlfq.py -n 3 -q 10 -l 0,400,0:0,400,0 -Q 10,20,50 -c