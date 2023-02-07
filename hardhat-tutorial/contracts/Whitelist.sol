// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // max number of addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;

    // keep track of number of addresses whitelisted till now
    uint8 public numAddressesWhitelisted;

    // map which keeps track whether the current address is whitelisted or not
    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhitelistedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhitelist() public {
        // msg.sender is the address of the user who called this function
        // it checks whether the current sender is false if not it returns the error
        require(
            !whitelistedAddresses[msg.sender],
            "Sender already in the whitelist"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Max limit reached"
        );

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
