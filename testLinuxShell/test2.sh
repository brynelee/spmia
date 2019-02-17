#!/bin/bash

for i in {1..10}
do
echo $(expr $i \* 3 + 1);
done

for i in {1..10}
do
  echo $i;
done
