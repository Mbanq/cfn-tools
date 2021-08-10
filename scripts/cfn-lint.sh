#!/bin/bash
#shellcheck disable=SC2012
echo "Cfn linter checks..."
​
path=$1
isarray=$2
​
if [[ $isarray == 1 ]]; then 
    cfn_list=$(ls "$path")
​
    for cfn_report_path in $cfn_list; do
        echo "cfn path is ${cfn_report_path}"
        cfn_file=$(ls "$cfn_report_path" | tr '\n' '\0' | xargs -0 -n 1 basename)
        echo cfn is "${cfn_file}"
        cfn-lint "$cfn_report_path" --ignore-checks W > reports/"${cfn_file}"_lint.out.json && echo OK || echo FAILED
        cfn_lint_output=$(cat reports/"${cfn_file}"_lint.out.json)
​
        if [ "$cfn_lint_output" != "" ]; then
            echo please check in "reports/${cfn_file}"_lint.out.json
            exit
        fi
    done
else
    cfn-lint "$path" --ignore-checks W >reports/cfn_lint.out.json && echo OK || echo FAILED
    cfn_lint_output=$(cat reports/cfn_lint.out.json)
​
    if [ "$cfn_lint_output" != "" ]; then
        echo please check in reports/cfn_lint.out.json
        exit
    fi
fi