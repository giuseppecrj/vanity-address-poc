// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {Counter} from "../src/Counter.sol";

interface ImmutableCreate2Factory {
    function safeCreate2(
        bytes32 salt,
        bytes calldata initCode
    ) external payable returns (address deploymentAddress);

    function findCreate2Address(
        bytes32 salt,
        bytes calldata initCode
    ) external view returns (address deploymentAddress);

    function findCreate2AddressViaHash(
        bytes32 salt,
        bytes32 initCodeHash
    ) external view returns (address deploymentAddress);
}

contract DeployCounter is Script {
    ImmutableCreate2Factory immutable factory =
        ImmutableCreate2Factory(0x0000000000FFe8B47B3e2130213B802212439497);
    bytes initCode = type(Counter).creationCode;
    bytes32 salt =
        0x0000000000000000000000000000000000000000686e746c6162732572010000;

    function run() public {
        vm.startBroadcast();

        address registryAddress = factory.safeCreate2(salt, initCode);
        Counter counter = Counter(registryAddress);
        console2.log(address(counter));

        vm.stopBroadcast();
    }
}
