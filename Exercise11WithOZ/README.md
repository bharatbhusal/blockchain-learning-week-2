# BharatToken Smart Contract

## Overview

The BharatToken smart contract is an Ethereum token contract implemented in Solidity. It extends the functionalities of the OpenZeppelin ERC20, ERC20Capped, and ERC20Burnable contracts. BharatToken introduces additional features such as a capped supply, burning capabilities, and owner-specific minting functions.

## Contract Details

- **ERC20Capped**: Provides functionality for a capped (maximum) token supply.
- **ERC20Burnable**: Allows for the burning of tokens by token holders.
- **BharatToken**: Inherits from ERC20Capped and ERC20Burnable, implementing the BharatToken functionalities.

## Functionalities

### BharatToken Functions:

1. **Constructor**
   - **Responsibility:** Initializes the token with the name "BharatToken" and the symbol "BHT." It also sets a capped supply of 21,000,000 BHT and mints 7,000,000 BHT to the contract owner.

2. **mint(uint256 value)**
   - **Responsibility:** Allows the owner to mint additional tokens to their own wallet.
   - **Modifiers:** None

3. **mintTo(address account, uint256 value)**
   - **Responsibility:** Allows the owner to mint tokens directly to a specified user's wallet.
   - **Modifiers:** None

4. **_update(address from, address to, uint256 value) internal virtual override(ERC20, ERC20Capped)**
   - **Responsibility:** Internal function that overrides the _update function in ERC20Capped. It ensures that minting does not exceed the capped supply defined during deployment.
   - **Modifiers:** None

## Events

BharatToken contract does not introduce new events, but it inherits events from ERC20, ERC20Capped, and ERC20Burnable contracts. These events include standard ERC20 events such as Transfer and Approval, as well as events related to cap management and burning.

## Usage

1. **Token Deployment:**
   - Deploy the contract to the Ethereum network using a suitable deployment script or tool.
   - The contract will be initialized with a capped supply and an initial balance for the owner.

2. **Minting:**
   - The owner can mint additional tokens to their own wallet using the `mint` function.

3. **Minting to Specific User:**
   - The owner can mint tokens directly to a specified user's wallet using the `mintTo` function.

4. **Burning:**
   - Token holders can burn their own tokens using the burn functions inherited from ERC20Burnable.

## Error Handling

The contract includes checks to ensure that minting does not exceed the capped supply. If an attempt is made to mint beyond the cap, an error is triggered.

## Conclusion

The BharatToken smart contract is a versatile ERC-20 token with added features for capped supply and burning. It is suitable for various use cases, providing flexibility for token management and ownership-controlled minting. Users can interact with the contract through standard ERC-20 functions and additional minting capabilities.