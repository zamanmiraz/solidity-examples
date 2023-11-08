// SPDX-License-Identifier: GPL-3.0

// import solidity
pragma solidity ^0.8.0;


// first contract
contract InheritanceContract {
    address payable public recipient;
    address public owner;
    bool public isOwnerDecessed;

    constructor(address payable _recipient){
        owner = msg.sender;
        recipient = _recipient;
        isOwnerDecessed = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Contract owner can access this function");
        _;
    }

    modifier onlyRecipient(){
        require(msg.sender == recipient, "Only designated recipient can access this function");
        _;
    }

    function declareDecessed() external onlyOwner{
        require(isOwnerDecessed, "Owner hash been declared deceased");
        require(address(this).balance > 0, "No funds availabe for withdrawl");
        recipient.transfer(address(this).balance);
    }

    // Fallback function to receive payments
    receive() external payable {}

}

