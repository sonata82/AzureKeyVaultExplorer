#!/usr/bin/env bash
# Bash/Cygwin equivalent of tag_and_push.ps1:
# tags HEAD with its commit date in UTC (vYYYY.MMDD.HHmm.ss) and pushes the tag,
# which triggers the Release workflow.
set -euo pipefail

tag=$(TZ=UTC git log -1 --date=format-local:'v%Y.%m%d.%H%M.%S' --format=%cd)
git tag "$tag"
git push origin "$tag"
echo "Pushed $tag"
