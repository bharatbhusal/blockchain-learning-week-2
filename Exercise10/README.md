# SimpleStorage Smart Contract

## Overview

The `SimpleStorage` smart contract is a basic Solidity contract that stores a single unsigned integer value. It provides functions to retrieve the stored value (`getBalance`) and update it (`setBalance`). This contract serves as a fundamental example of state storage and basic functionalities in a smart contract.

## Contract Details

- **SimpleStorage**: Implements a simple storage contract with a single unsigned integer variable.

## Functionalities

1. **Constructor**
   - **Responsibility:** Initializes the contract with an initial balance value provided during deployment.

2. **getBalance() public view returns (uint256)**
   - **Responsibility:** Retrieves the current stored balance.
   - **Access:** Public
   - **Return Type:** Unsigned integer (`uint256`)

3. **setBalance(uint256 num) public**
   - **Responsibility:** Updates the stored balance with the specified value.
   - **Access:** Public

## Deployment

To deploy the `SimpleStorage` contract:

1. Use the Remix Ethereum IDE or another suitable development environment.
2. Compile the contract with the desired compiler version.
3. Deploy the contract, providing an initial balance value.

## Usage

1. **Get Balance:**
   - Call the `getBalance` function to retrieve the current stored balance.

2. **Set Balance:**
   - Call the `setBalance` function, providing a new value to update the stored balance.

## Example Deployment and Interaction (Using Remix)

1. Deploy the contract with an initial balance (e.g., 100).

2. Call the `getBalance` function to check the initial balance.

3. Call the `setBalance` function with a new value (e.g., 200).

4. Call the `getBalance` function again to confirm the updated balance.

## Conclusion

The `SimpleStorage` smart contract serves as a basic example of a stateful smart contract. It highlights the fundamental concepts of state variables, constructor initialization, and basic functions for retrieving and updating data. The contract can be deployed and interacted with using Ethereum development tools like Remix.