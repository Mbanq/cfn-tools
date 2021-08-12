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

echo "Verify code metrics..."
sonar-scanner -Dsonar.host.url=https://sonar.dev.mbanq.cloud -Dsonar.login=${{ secrets.SONAR_TOKEN }}
