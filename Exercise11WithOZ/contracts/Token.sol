// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Import OpenZeppelin contracts for ERC20, ERC20Capped, and ERC20Burnable
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// BharatToken contract inheriting from ERC20Capped and ERC20Burnable
contract BharatToken is ERC20Capped, ERC20Burnable {
    // Address of the owner (payable)
    address payable public owner;

    // Constructor to initialize the token with specific parameters
    constructor()
        ERC20("BharatToken", "BHT") // Set token name and symbol
        ERC20Capped(21000000 * (10 ** decimals())) // Set the cap for total token supply
    {
        // Set the owner to the deployer of the contract
        owner = payable(msg.sender);

        // Mint an initial supply and assign it to the owner
        _mint(owner, 7000000 * (10 ** decimals()));
    }

    // Function to mint tokens (can only be called by the owner)
    function mint(uint256 value) public {
        // Check if the owner is a valid address
        if (owner == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }

        // Call the _update function to mint tokens to the owner
        _update(address(0), owner, value);
    }

    // Function to mint tokens to a specific account (can only be called by the owner)
    function mintTo(address account, uint256 value) public {
        // Check if the specified account is a valid address
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }

        // Call the _update function to mint tokens to the specified account
        _update(address(0), account, value);
    }

    // Internal function to update token balances and handle capped supply
    function _update(
        address from,
        address to,
        uint256 value
    ) internal virtual override(ERC20, ERC20Capped) {
        // Call the _update functions from ERC20 and ERC20Capped
        super._update(from, to, value);

        // Check if the tokens are minted to the owner (from address(0) to owner)
        if (from == address(0) && to == owner) {
            // Check if the total supply exceeds the maximum cap
            uint256 maxSupply = cap();
            uint256 supply = totalSupply();
            if (supply > maxSupply) {
                revert ERC20ExceededCap(supply, maxSupply);
            }
        }
    }
}
