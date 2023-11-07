// import solidity
pragma soldity >=0.8.2 <0.9.0;


// first contract
contract SimpleContract {
    // block
    block.number;
    block.difficulty;
    block.coinbase;

    /* Comment can be written like this  */

    //message
    msg.sender;
    msg.data;
    msg.value;

    //transaction
    tx.origin;
    tx.gas;
}

