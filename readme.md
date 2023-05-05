### Deploying using CREATE2 and IMMUTABLE_CREATE2_FACTORY

This is a POC on how to create a vanity address across multiple chains using Foundry scripts and [OpenSea](https://github.com/ProjectOpenSea/seaport/blob/main/docs/Deployment.md) IMMUTABLE_CREATE2_FACTORY

### Steps to run on anvil:

1. open terminal and run `forge install`
2. open a separate terminal and run `anvil`
3. back to previous terminal, run `./deploy.sh`
4. run `make deploy-anvil contract=DeployCounter`

### More info

- https://0xfoobar.substack.com/p/vanity-addresses
- https://docs.openzeppelin.com/cli/2.8/deploying-with-create2
