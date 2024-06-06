#!/bin/bash

FILE="/workspaces/studio/.datasette-secrets-key"

pip install datasette-studio datasette-codespaces

if [ ! -f "$FILE" ]; then
  datasette secrets generate-encryption-key > "$FILE"
fi

datasette-studio data.db secrets.db --create -c datasette.yml
