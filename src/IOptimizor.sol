/// An interface for Optimizor for challenge operations
interface IOptimizor {
    function commit(bytes32 key) external;
    function challenge(uint256 id, address target, address recipient, uint salt) external;
}

