// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {RingLib, RING_SIZE, RING_BITS} from "src/RingLib.sol";

/// @author philogy <https://github.com/philogy>
contract RingLibTest is Test {
    using RingLib for bytes32[RING_SIZE];

    bytes32[128] internal paddingBefore;
    bytes32[RING_SIZE] internal ring;
    bytes32[128] internal paddingAfter;

    function setUp() public {
        for (uint256 i; i < paddingBefore.length; i++) {
            paddingBefore[i] = keccak256(abi.encode("before", i));
        }

        for (uint256 i; i < paddingAfter.length; i++) {
            paddingAfter[i] = keccak256(abi.encode("after", i));
        }
    }

    function testConstants() public {
        assertEq(RING_SIZE, 2 ** RING_BITS);
    }

    function testDefault(uint256 index) public {
        assertEq(ring.get(index), bytes32(0));
    }

    function testSet(uint256 index, bytes32 hash) public {
        ring.set(index, hash);
        assertEq(ring.get(index), hash);
    }

    function testSetConsec(uint256 startIndex, uint256 n, bytes32 seed) public {
        n = bound(n, 0, RING_SIZE - 1);

        bytes32[] memory values = new bytes32[](n);

        unchecked {
            for (uint256 i = 0; i < n; i++) {
                seed = keccak256(abi.encode(seed));
                values[i] = seed;
                ring.set(startIndex + i, values[i]);
            }

            for (uint256 i = 0; i < n; i++) {
                assertEq(ring.get(startIndex + i), values[i]);
            }
        }
    }
}
