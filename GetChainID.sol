// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Chain {
    function getChainID() external view returns(uint) {
        uint id;
        assembly {
            id := chainid()
        }
        return id;
    }
}