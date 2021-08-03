#!/bin/bash
echo "Cfn-guard is checking ruleset ..."
pathruleset=$1
pathcfn=$2

cfn-guard check -r "$pathruleset" -t "$pathcfn" -s >reports/cfn_guard.out.json && echo OK || echo FAILED
cfn_guard_output=$(cat reports/cfn_guard.out.json)

if [ "$cfn_guard_output" != "" ]; then
    echo please check in reports/cfn_guard.out.json
    exit
fi
