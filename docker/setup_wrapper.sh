#!/bin/bash
# Placeholder git identity for non-interactive cms-git-tools during image build.
# Not credentials — cms-init requires name/email/github metadata for merges.
git config --global user.name "CMS Docker Build"
git config --global user.email "build@local"
git config --global user.github "cms"

exec "$@"
