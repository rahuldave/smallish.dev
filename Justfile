default:
    @just --list

# Serve the buildless site on this computer.
serve port="8766":
    python3 -m http.server {{port}} --bind 127.0.0.1

fmt:
    npx --yes prettier@3.6.2 --write "**/*.html" "*.css" "**/*.md"

format-check:
    npx --yes prettier@3.6.2 --check "**/*.html" "*.css" "**/*.md"

diff-check:
    git diff --check

verify: format-check diff-check

# Push the verified source to main before requesting a new Pages build.
deploy: verify
    gh api --method POST repos/rahuldave/smallish.dev/pages/builds --jq .status
