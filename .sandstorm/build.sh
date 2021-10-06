#!/bin/bash
set -euo pipefail

cd /opt/app

[ -d hedgedoc ] || {
	./scripts/checkout
	./scripts/apply-patches
}
cd hedgedoc
bin/setup
yarn install
yarn run build
cp ../config.json ./
