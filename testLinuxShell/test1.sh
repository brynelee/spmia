#! /bin/bash
echo "undeploy all the spmia cluster apps and middlewares"

nLong=10
nshort=5
nvshort=2

inputP1=$1

function waitAndCheck(){

    for i in $(seq 1 $1)
    do
       echo $i;
    done

}

echo "execute function: waitAndCheck $inputP1"

waitAndCheck $inputP1

