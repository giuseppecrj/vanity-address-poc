-include .env

deploy-anvil :;
	@forge build
	@forge script script/${contract}.s.sol:${contract} --rpc-url http://localhost:8545 --private-key ${PK} --broadcast
