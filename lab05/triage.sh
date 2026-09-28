#!/bin/bash

CASE_DIR="case/evidence"
REPORT="triage-report-auto.txt"

read -p "Enter analyst name: " ANALYST
read -p "Enter case reference: " CASE_REF

PYTHON=$(find "$CASE_DIR" -name "*.py" | wc -l)
SHELL=$(find "$CASE_DIR" -name "*.sh" | wc -l)

echo "Triage Report" > "$REPORT"
echo "Analyst: $ANALYST" >> "$REPORT"
echo "Case Reference: $CASE_REF" >> "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo "" >> "$REPORT"

echo "Total Files: $(find "$CASE_DIR" -type f | wc -l)" >> "$REPORT"
echo "Total Directories: $(find "$CASE_DIR" -type d | wc -l)" >> "$REPORT"
echo "Python Files: $PYTHON" >> "$REPORT"
echo "Shell Scripts: $SHELL" >> "$REPORT"
echo "Log Files: $(find "$CASE_DIR" -name "*.log" | wc -l)" >> "$REPORT"
echo "Configuration Files: $(find "$CASE_DIR" -name "*.conf" | wc -l)" >> "$REPORT"
echo "Empty Files: $(find "$CASE_DIR" -type f -empty | wc -l)" >> "$REPORT"
echo "Archives: $(find "$CASE_DIR" -name "*.zip" | wc -l)" >> "$REPORT"

echo "" >> "$REPORT"
echo "Files containing admin:" >> "$REPORT"
grep -rl "admin" "$CASE_DIR" >> "$REPORT"

echo "" >> "$REPORT"
echo "Detected file types:" >> "$REPORT"
file "$CASE_DIR"/* >> "$REPORT"

echo "" >> "$REPORT"
echo "Scripts (Python + shell): $((PYTHON + SHELL))" >> "$REPORT"

