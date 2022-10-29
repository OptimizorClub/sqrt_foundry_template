// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Test.sol";

import {ISqrt, SqrtChallenge, INPUT_SIZE} from "src/SqrtChallenge.sol";
import {Fixed18} from "src/Fixed18.sol";
import {MySolution} from "src/MySolution.sol";

contract MySolutionTest is Test {
    SqrtChallenge public challenge;
    MySolution public sqrt;

    // Change accordingly.
    uint constant SEED = 0;
    // Change accordingly.
    uint constant currentLeaderGas = 1000000;

    function setUp() public {
        sqrt = new MySolution();
        challenge = new SqrtChallenge();
    }

    function testSpecificSeed() public {
        testWithSeed(SEED);
    }

    function testFuzzSeed(uint seed) public {
        testWithSeed(seed);
    }

    function testWithSeed(uint seed) internal {
        Fixed18[INPUT_SIZE] memory input;
        for (uint i = 0; i < INPUT_SIZE; ++i) {
            input[i] = Fixed18.wrap(i);
        }

        uint gasSpent = challenge.run(address(sqrt), seed);
        assertTrue(gasSpent < currentLeaderGas);
    }
}
