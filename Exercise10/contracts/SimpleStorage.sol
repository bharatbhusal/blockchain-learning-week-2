// Exercise 10: Basic Smart Contract
//   - Write a smart contract named **`SimpleStorage`** that stores a number and allows functions to get and set that number.
//   - Deploy the contract using the Remix Ethereum IDE.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 balance;

    constructor() {
        balance = 0;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function setBalance(uint256 num) public {
        balance = num;
    }
}
