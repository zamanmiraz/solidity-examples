// import solidity
pragma soldity >=0.8.2 <0.9.0;

//import 
// import "filename"; 
// import * as symbolname as "filename2";
// import {symbol1 as alias, symbol2} from "filename3";

// first contract
contract SimpleContract {
    //string
    string name = "manny";

    //integers
    uint storeData = 34;

    // boolean
    bool aTrueOrFalseValue = false;

    // address
    address walletAddress = 0x772;

    // arrays
    string[] names;

    // Struct to define
    struct User {
        string firstName;
        string lastName;
        uint age;
    }

    // enums
    enum userType {buyer, seller};

    // mappings
    mapping (address => uint) public balances;
    
}

