#!/bin/bash
set -euo pipefail

cd /opt/app

[ -d hedgedoc ] || {
	./scripts/checkout
	(
		cd hedgedoc
		# Set these, or git-am will complain:
		git config user.email vagrant-spk@localhost
		git config user.name 'Vagrant SPK User'
	)
	./scripts/apply-patches
}
cd hedgedoc
bin/setup
yarn install
yarn run build
cp ../config.json ./
