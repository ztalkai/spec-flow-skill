# SpecFlow Skill

This repository is the public release projection of the canonical private
`ztalkai/spec-flow` source. Send Skill changes to the source repository; do not edit
the projection directly.

Release: `skill-v0.1.4`

Compatible CLI: `@ztalkai/spec-flow-cli@0.1.0`

## Install for Codex

With GitHub CLI 2.98.0:

```bash
gh skill install ztalkai/spec-flow-skill specflow --pin skill-v0.1.4 --agent codex --scope user
```

With the pinned Agent Skills CLI:

```bash
npx --yes skills@1.5.23 add 'ztalkai/spec-flow-skill#skill-v0.1.4@specflow' --global --agent codex --copy --yes
```

## Install for Claude Code

With GitHub CLI 2.98.0:

```bash
gh skill install ztalkai/spec-flow-skill specflow --pin skill-v0.1.4 --agent claude-code --scope user
```

With the pinned Agent Skills CLI:

```bash
npx --yes skills@1.5.23 add 'ztalkai/spec-flow-skill#skill-v0.1.4@specflow' --global --agent claude-code --copy --yes
```

All four commands select the Agent host, user-level scope, and immutable Skill tag
explicitly. Installing the Skill does not install credentials or start Device
Authorization. The Skill installs its pinned CLI only when the executable is absent,
never changes a different installed CLI version, and never updates itself.

Source: `ztalkai/spec-flow@91f899fa1450acece8b3c525d9385ed7314172df`

`skill-v0.1.0`, `skill-v0.1.1`, `skill-v0.1.2`, and `skill-v0.1.3` are
inapplicable because they did not pass the full distribution contract. Published tags
and Releases are never moved, replaced, or deleted; recovery uses this higher patch release.
