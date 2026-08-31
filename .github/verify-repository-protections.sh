#!/usr/bin/env bash

set -euo pipefail

repository_name="${1:?repository name is required}"
repository="$(gh api "repos/${repository_name}")"
for setting in secret_scanning secret_scanning_push_protection; do
  if [[ "$(jq -r ".security_and_analysis.${setting}.status" <<<"${repository}")" != "enabled" ]]; then
    echo "Required repository protection is disabled: ${setting}" >&2
    exit 1
  fi
done

if [[ "$(gh api "repos/${repository_name}/immutable-releases" --jq .enabled)" != "true" ]]; then
  echo "Release immutability is disabled" >&2
  exit 1
fi

protected_tags=false
while IFS= read -r ruleset_id; do
  ruleset="$(gh api "repos/${repository_name}/rulesets/${ruleset_id}")"
  if jq -e '
    .target == "tag" and .enforcement == "active" and
    (.conditions.ref_name.include | index("refs/tags/skill-v*")) != null and
    ([.rules[].type] | contains(["creation", "update", "deletion"]))' \
    <<<"${ruleset}" >/dev/null; then
    protected_tags=true
    break
  fi
done < <(gh api "repos/${repository_name}/rulesets?per_page=100" --jq '.[].id')

if [[ "${protected_tags}" != "true" ]]; then
  echo "Required Skill release tag ruleset is missing" >&2
  exit 1
fi
