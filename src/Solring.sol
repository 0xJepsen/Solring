// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


// Ring Buffer in solidity for story blockIDs
contract SolringControl {
    // Size of buffer is 10 
    uint256[10] public arr;

    // Set blockID at index blockID % 10
    // Since blocks increase in a linear fassion 
    // we can use the modulus operator to always set the index
    // this will overwrite the oldest blockID in the buffer if buffer is full
    function setNumber(uint256 blockID) payable public {
        arr[(blockID % arr.length)] = blockID;
    }

    // Gets the blockID at index blockID % 10
    // Will return a valid blockID even for overwritten blocks
    function getNumber(uint256 blockID) public view returns (uint256) {
        return arr[(blockID % arr.length)];
    }
}


// Ring Buffer in solidity for story blockIDs
contract Solring {
    // Size of buffer is 10 
    uint256[10] public arr;

    // Set blockID at index blockID % 10
    // Since blocks increase in a linear fassion 
    // we can use the modulus operator to always set the index
    // this will overwrite the oldest blockID in the buffer if buffer is full
    function setNumber(uint256 blockID) payable public {
        arr[(blockID % arr.length)] = blockID;
    }

    // Gets the blockID at index blockID % 10
    // Will return a valid blockID even for overwritten blocks
    function getNumber(uint256 blockID) public view returns (uint256) {
        return arr[(blockID % arr.length)];
    }
}
