// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

uint256 constant RING_BITS = 5;
uint256 constant RING_SIZE = 32;

/// @author philogy <https://github.com/philogy>
library RingLib {
    function set(bytes32[RING_SIZE] storage ring, uint256 index, bytes32 hash) internal {
        assembly {
            let relIndex := and(index, sub(shl(RING_BITS, 1), 1))
            sstore(add(ring.slot, relIndex), hash)
        }
    }

    function get(bytes32[RING_SIZE] storage ring, uint256 index) internal view returns (bytes32 hash) {
        assembly {
            hash := sload(add(ring.slot, and(index, sub(shl(RING_BITS, 1), 1))))
        }
    }
}
