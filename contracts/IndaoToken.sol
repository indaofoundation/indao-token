// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
//import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract IndaoToken is ERC20, ERC20Burnable {

    address owner;
    uint initialSupply = 100000000*10**decimals();
    uint maxSupply = 100000000*10**decimals();
    constructor () ERC20("Indao", "INDAO")
    {
        owner = msg.sender;
        _mint(
            msg.sender, initialSupply
        );
    }
    modifier _onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    function mint(address to, uint amount) external _onlyOwner {
        require(initialSupply+amount <= maxSupply);
        _mint(to, amount);
    }
}