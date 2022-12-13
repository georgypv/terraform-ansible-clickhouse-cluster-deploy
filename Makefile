all: up

up: cloud_up
	./scripts/install.sh

cloud_up: acquire_tokens
	./scripts/cloud_up.sh

acquire_tokens:
	./scripts/acquire_tokens.sh

down:
	./scripts/cloud_down.sh
