#!/bin/bash
# Ephemeral git identity for non-interactive cms-merge-topic during image build.
# These are not credentials; git requires author/committer metadata for merges.
export GIT_AUTHOR_NAME="CMS Docker Build"
export GIT_AUTHOR_EMAIL="build@local"
export GIT_COMMITTER_NAME="CMS Docker Build"
export GIT_COMMITTER_EMAIL="build@local"
export GIT_CONFIG_COUNT=1
export GIT_CONFIG_KEY_0="user.github"
export GIT_CONFIG_VALUE_0="cms"

exec "$@"
