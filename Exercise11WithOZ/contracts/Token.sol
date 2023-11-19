// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract BharatToken is ERC20Capped, ERC20Burnable {
    address payable public owner;

    constructor()
        ERC20("BharatToken", "BHT")
        ERC20Capped(21000000 * (10 ** decimals()))
    {
        owner = payable(msg.sender);
        _mint(owner, 7000000 * (10 ** decimals()));
    }

    function mint(uint256 value) public {
        if (owner == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(address(0), owner, value);
    }

    function mintTo(address account, uint256 value) public {
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(address(0), account, value);
    }

    function _update(
        address from,
        address to,
        uint256 value
    ) internal virtual override(ERC20, ERC20Capped) {
        super._update(from, to, value);

        if (from == address(0) && to == owner) {
            uint256 maxSupply = cap();
            uint256 supply = totalSupply();
            if (supply > maxSupply) {
                revert ERC20ExceededCap(supply, maxSupply);
            }
        }
    }
}
