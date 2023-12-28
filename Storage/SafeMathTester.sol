// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathTester {
    uint8 public bigNumber = 255;

    function add() public {
        // bigNumber++;              // this will revert back as it exceeds the limit
        unchecked { bigNumber++ ; }  // if unchecked is used then it will not revvert back but will assign bigNumber as 0 and so on
    }
}