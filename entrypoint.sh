#!/bin/bash

: ${CLOUDSDK_CORE_PROJECT:=project}

DATA_DIR=

for metadata in $(find /workspace/exports -name '*.overall_export_metadata'); do
  echo "found ${metadata}"
  if [[ -z "${DATA_DIR}" ]]; then
    DATA_DIR="$(dirname ${metadata})"
  fi
done

if [[ -z "${DATA_DIR}" ]]; then
  echo "No export data found"
  exit 1
fi

echo "Load data from ${DATA_DIR}"

exec firebase emulators:start --project "${CLOUDSDK_CORE_PROJECT}" --only firestore --import "${DATA_DIR}"
