// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Ring Buffer in solidity for story blockIDs
contract Solring {
    // Size of buffer is 10
    bytes32[10] public arr;

    // Set blockId at index blockId % 10
    // Since blocks increase in a linear fassion
    // we can use the modulus operator to always set the index
    // this will overwrite the oldest blockId in the buffer if buffer is full
    function setHash(uint256 blockId, bytes32 blockHash) public payable {
        arr[(blockId % arr.length)] = blockHash;
    }

    // Gets the blockId at index blockID % 10
    // Will return a valid blockId even for overwritten blocks
    function getHash(uint256 blockId) public view returns (bytes32) {
        return arr[(blockId % arr.length)];
    }
}
