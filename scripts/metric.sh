#!/bin/bash
# This script verifies the code with sonar-scanner
# to ensure that the code quality is as expected.
#
# https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner
#
# The script can be called locally and in the pipeline.
#
# USAGE
#
#    bash scripts/pipeline/metrics.sh
set -eo pipefail
echo SONAR_TOKEN is "${SONAR_TOKEN}"

echo "Verify code metrics..."
sonar-scanner -Dsonar.host.url=https://sonar.dev.mbanq.cloud -Dsonar.login=688680b3376217a389039b5c68be0e8ab1ac9d9e
