#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_grammars/ tests/

black democritus_grammars/ tests/

mypy democritus_grammars/ tests/

pylint --fail-under 9 democritus_grammars/*.py

flake8 democritus_grammars/ tests/

bandit -r democritus_grammars/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_grammars/ tests/
