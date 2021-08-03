#!/bin/bash
#shellcheck disable=SC2002
echo "Cfn nag scan and output report..."
pathcfn=$1
enforce=$2
cfn_nag_scan --fail-on-warnings --input-path "$pathcfn" -o json >reports/cfn_nag.out.json && echo OK || echo FAILED

if [[ $enforce == 1 ]]; then 
    count_fail=$(cat reports/cfn_nag.out.json | jq -r .[].file_results.failure_count)

    if [[ $count_fail -gt 0 ]]; then
        echo "$count_fail" are failed!! please check in reports/cfn_nag.out.json
        exit;
    fi
fi