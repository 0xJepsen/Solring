// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";
import "../src/Solring.sol";

contract SolringTest is Test, Solring {

    Solring solring;

    function setUp() public {
        solring = new Solring();
    }

    function testSetNumber() public {
        Solring.setNumber(1);
        assertEq(Solring.arr[1], 1);
    }

    function testGetNumber() public {
        Solring.setNumber(1);
        assertEq(Solring.getNumber(1), 1);
    }
}
