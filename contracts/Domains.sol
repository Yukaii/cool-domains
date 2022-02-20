// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
  mapping(string => address) public domains;
  
  // Checkout our new mapping! This will store values
  mapping(string => string) public records;

  constructor() {
      console.log("Yo yo, I am a contract and I am smart");
  }

  function register(string calldata name) public {
      // Check that the name is unregistered (explained in notes)
      require(domains[name] == address(0));
      domains[name] = msg.sender;
      console.log("%s has registered a domain!", msg.sender);
  }

  function getAddress(string calldata name) public view returns (address) {
      // Check that the owner is the transaction sender
      return domains[name];
  }

  function setRecord(string calldata name, string calldata record) public {
      // Check that the owner is the transaction sender
      require(domains[name] == msg.sender);
      records[name] = record;
  }

  function getRecord(string calldata name) public view returns(string memory) {
      return records[name];
  }
}