#!/bin/bash

# Format staged java files using google-java-format plugin
echo "Formatting staged files as per Google Java Style Guide"
set -e
# Retrieve staged files
STAGED_FILES_FILE=$(mktemp)
git diff --cached --name-only --diff-filter=d > "${STAGED_FILES_FILE}"
# Process the files
mvn -f pom.xml git-code-format:on-pre-commit -DstagedFilesFile=${STAGED_FILES_FILE}
# Add the files to staging again in case they were modified by the process
while read file; do
  git add "${file}"
done <${STAGED_FILES_FILE}

rm ${STAGED_FILES_FILE}

# Run Tests
echo "Running tests to ensure minimum required code coverage is met :)"
mvn clean verify


# Runninng Static Analysis on staged files
echo "Runninng Static Analysis on staged files"
set -e
# Retrieve staged files
STAGED_FILES_FILE=$(mktemp)
git diff --cached --name-only --diff-filter=d > "${STAGED_FILES_FILE}"
# Process the files
mvn -f pom.xml spotbugs:check -DstagedFilesFile=${STAGED_FILES_FILE}
# Add the files to staging again in case they were modified by the process
while read file; do
  git add "${file}"
done <${STAGED_FILES_FILE}

rm ${STAGED_FILES_FILE}