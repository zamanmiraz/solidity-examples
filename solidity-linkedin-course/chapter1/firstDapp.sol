// import solidity
pragma soldity >=0.8.2 <0.9.0;

//import 
// import "filename"; 
// import * as symbolname as "filename2";
// import {symbol1 as alias, symbol2} from "filename3";

// first contract
contract SimpleContract {
    //state variable
    uint storeData;

    //modifier is a conditional
    modifier onlyData(){
        require(
            storeData >= 0);
            _;
    }

    // function
    function set(uint x) public{
        storeData = x;
    }

    // event
    event Sent(address from, address to, uint storeData);
}

