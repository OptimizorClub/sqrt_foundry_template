// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";

import {MySolution} from "src/MySolution.sol";
import {IOptimizor, OPTIMIZOR_MAINNET} from "src/IOptimizor.sol";
import {computeKey} from "src/CommitHash.sol";

uint constant SQRT_ID = 1;
// Change accordingly.
address constant MY_ADDRESS = address(0);
// Change accordingly.
uint constant SALT = 0;
// Deploy solution contract.
address constant DEPLOYED_SOLUTION = address(0);

contract MySolutionDeployAndCommit is Script {
    function run() public {
        vm.startBroadcast();

        // Deploy solution contract.
        MySolution sqrt = new MySolution();

        // Commit solution key.
        OPTIMIZOR_MAINNET.commit(computeKey(MY_ADDRESS, address(sqrt).codehash, SALT));

        vm.stopBroadcast();
    }
}

contract MySolutionChallenge is Script {
    function run() public {
        vm.startBroadcast();

        // Make the challenge.
        OPTIMIZOR_MAINNET.challenge(SQRT_ID, address(DEPLOYED_SOLUTION), MY_ADDRESS, SALT);

        vm.stopBroadcast();
    }
}
