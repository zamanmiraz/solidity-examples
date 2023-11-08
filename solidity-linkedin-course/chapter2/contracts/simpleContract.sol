// SPDX-License-Identifier: GPL-3.0

// import solidity
pragma solidity ^0.8.0;


// first contract
contract InheritanceContract {
    // State varaibles
    // An address payable variable that stores the address of the designated recipient who will receive funds in case the owner passes away.
    address payable public recipient;
    // An address variable that stores the address of the contract owner.
    address public owner;
    // A boolean variable that indicates whether the owner has been declared deceased.
    bool public isOwnerDecessed;
    // Constructor is executed only once during the deployment of contract. During the deployment the contract owner and initial values for are set.
    constructor(address payable _recipient){
        owner = msg.sender;
        recipient = _recipient;
        isOwnerDecessed = false;
    }
    //  Modifiere restricts access to function that are only accessible by the owner and recipient.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only Contract owner can access this function");
        _;
    }

    modifier onlyRecipient(){
        require(msg.sender == recipient, "Only designated recipient can access this function");
        _;
    }
    // Function is designed to call by the owener. If owner decessed and balance greater than zero, the contracts transfer the balance to the designated recipient.
    function declareDecessed() external onlyOwner{
        require(isOwnerDecessed, "Owner hash been declared deceased");
        require(address(this).balance > 0, "No funds availabe for withdrawl");
        recipient.transfer(address(this).balance);
    }

    // Fallback function to receive payments
    receive() external payable {}

}

