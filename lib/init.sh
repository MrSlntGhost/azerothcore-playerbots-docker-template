#!/bin/bash

# Determine project root directory
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Load .env file if present
if [ -f "$ROOT_DIR/.env" ]; then
  source "$ROOT_DIR/.env"
fi

# Resolve project structure variables from .env, defaulting to standard layout if not set
: "${LIB_DIR:=$ROOT_DIR/${ACORE_LIB_DIR:-lib}}"
: "${ACORE_DIR:=$ROOT_DIR/${ACORE_CORE_DIR:-azerothcore-wotlk}}"
: "${MODULES_DIR:=$ROOT_DIR/${ACORE_MODULES_DIR:-azerothcore-wotlk/modules}}"
: "${CUSTOM_SQL_DIR:=$ROOT_DIR/${ACORE_CUSTOM_SQL_DIR:-data/sql/custom}}"
: "${BACKUP_SQL_DIR:=$ROOT_DIR/${ACORE_BACKUP_SQL_DIR:-data/backup}}"

# Set UI line styles from .env or use defaults
: "${LINE_LONG:=${ACORE_LINE_LONG:------------------------------------------------------}}"
: "${LINE_SHORT:=${ACORE_LINE_SHORT:----}}"

source "$LIB_DIR/utils.sh"