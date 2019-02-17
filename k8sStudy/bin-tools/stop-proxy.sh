#!/bin/bash

while read var; do unset $var; done < <(env | grep -i proxy | awk -F= '{print $1}')

