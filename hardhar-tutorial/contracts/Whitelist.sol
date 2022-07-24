//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist{
    uint8 public maxWhitelistAddresses;

    mapping(address=>bool) public WhitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public{
        require(!WhitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        require(numAddressesWhitelisted < maxWhitelistAddresses, "More addresses can't be added, limit reached");
        WhitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted +=1;
    }
}