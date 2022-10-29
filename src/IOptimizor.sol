// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// An interface for Optimizor for challenge operations
interface IOptimizor {
    function commit(bytes32 key) external;
    function challenge(uint256 id, address target, address recipient, uint salt) external;
}

IOptimizor constant OPTIMIZOR_MAINNET = IOptimizor(0x66DE7D67CcfDD92b4E5759Ed9dD2d7cE3C9154a9);
