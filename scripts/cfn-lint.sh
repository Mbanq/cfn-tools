#!/bin/bash
echo "Cfn linter checks..."
cfn_list=$(ls ./*.yml)

for cfn in $cfn_list; do
    cfn-lint "$cfn" --ignore-checks W >reports/"${cfn}"_lint.out.json && echo OK || echo FAILED
    cfn_lint_output=$(cat reports/"${cfn}"_lint.out.json)

    if [ "$cfn_lint_output" != "" ]; then
        echo please check in "${cfn}"_lint.out.json
        exit
    fi
done
