// import solidity
pragma soldity >=0.8.2 <0.9.0;


// first contract
contract SimpleContract {
    //function
    function calcs(uint _a, uint _b) public pure
    returns (uint o_sum, uint o_product){
        o_sum = _a + _b
        o_product = _a * _b
    }
    // Arithmetic operator + - * % += --
    uint a = 2;
    uint b = 3;
    uint c = a + b;

    // Logical operator 
    // ! not equal
    // &&  and
    // || or 
    // != not equal
    bool hasMoney = !false;

    // Bitwise operators
    // & | ^ ~ >> <<
    bytes1 contractValue = 0x02 | 0x01;

}

