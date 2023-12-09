// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// TokenBharat contract to represent a simple ERC-20 token
contract TokenBharat {
    // Public state variables
    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint8 decimal;
    address public owner;

    // Mapping to track balances of addresses
    mapping(address => uint256) public balances;

    // Constructor to initialize the token with initial parameters
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimal,
        uint256 initialSupply
    ) {
        // Set token details
        name = _name;
        symbol = _symbol;
        decimal = _decimal;

        // Set total supply of the token
        totalSupply = initialSupply;

        // Owner of the contract initially owns all the tokens
        balances[msg.sender] = totalSupply;

        // Set the owner of the contract to the caller of the constructor
        owner = msg.sender;
    }

    // Function to mint new tokens
    function mint(uint256 amount) public {
        // Only the owner can mint new tokens
        require(msg.sender == owner, "Only owner can mint");
        // Add the minted tokens to the owner's balance and increase total supply
        balances[msg.sender] += amount;
        totalSupply += amount;
    }

    // Function to burn tokens
    function burn(uint256 amount) public {
        // Only the owner can burn tokens, and the owner should have enough tokens
        require(msg.sender == owner, "Only owner can burn");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        // Subtract the burned tokens from the owner's balance and decrease total supply
        balances[msg.sender] -= amount;
        totalSupply -= amount;
    }

    // Function to transfer tokens from one wallet to another
    function transfer(uint256 amount, address to) public {
        // Sender should have enough balance, and the receiver address should be valid
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(to != address(0), "Invalid address");
        // Subtract the tokens from the sender and add to the receiver
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
