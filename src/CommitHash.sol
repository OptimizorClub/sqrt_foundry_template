// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

function computeKey(address sender, bytes32 codehash, uint256 salt) pure returns (bytes32) {
    return keccak256(abi.encode(sender, codehash, salt));
}
