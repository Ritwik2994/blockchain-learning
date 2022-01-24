// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyERCToken is ERC20, AccessControl {
    uint constant _initial_supply = 10 * (10**18);
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() ERC20("MyERCToken", "MTK") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _mint(msg.sender, _initial_supply); //fixed initial supply 
    }

    // owner can add address and give/mint tokens and increase the total supply
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    // this will reward minter 10 tokens and increase the total supply by 10
    // function mintMinerReward() public {
    //     _mint(block.coinbase, 10);
    // }

    function _mintMinerReward() internal {
        _mint(block.coinbase, 1000);
    }

    // this function will be called by the minter before they mint and it will call internally _mintMinerReward and add increase the total supply by 1000
    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        if (!(from == address(0) && to == block.coinbase)) {
          _mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);
    }
}