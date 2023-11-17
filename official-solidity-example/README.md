# voting_example
Voting contract example follows a simple approach by creating one contract per ballot. Each proposal is identified by a short name.

The contract creator assumes the role of the chairperson and has the authority to grant voting rights to each address individually. Participants can decide to cast their votes directly or delegate their voting power to a trusted individual.

Upon the conclusion of the voting period, the function `winningProposal()` determines the proposal with the highest number of votes, establishing the winner of the ballot.

## Initializing Truffle & Ganache
Command `truffle init` create a project structure in the current directory.
The project structure file include: 

- contracts/: Directory for Solidity contracts
- migrations/: Directory for scriptable deployment files
- test/: Directory for test files for testing your application and contracts
- truffle-config.js: Truffle configuration file

Following the installation of `ganache`, executing the `ganache` command in a separate terminal will generate a personal test blockchain.

## Contract Creation
The voting contract placed in the contract folder of the current directory i.e., `contracts/voting.sol`.
`truffle compile` command in the directory compile the contract.

## Deploy using Migration Script
In the migration directory `migrations/`, a migration script titled `2_deploy_contracts.js` is present.
```
const voting_contract = artifacts.require("Ballot");

module.exports = function (deployer) {
  deployer.deploy(voting_contract, ["0x666f6f0000000000000000000000000000000000000000000000000000000000","0x6261720000000000000000000000000000000000000000000000000000000000"]);
};
```
The naming convention for migration scripts can be found [here](https://trufflesuite.com/docs/truffle/how-to/contracts/run-migrations/#migration-files).
In the script, the `artifacts.require()` method is utilized to instantiate a contract (named ballot in this case) from its file.
The migration script exports a function through the `module.exports` syntax, which takes a deployer object as a parameter.
The deployer is responsible for deploying a specific contract (Ballot), as specified by the contract object (voting_contract).
The constructor argument (proposalNames) must also be provided in the deployment, like so: "0x666f6f0000000000000000000000000000000000000000000000000000000000","0x6261720000000000000000000000000000000000000000000000000000000000".
`truffle migrate` command deploy the contract to local `ganache` blockchain which is listening in `127.0.0.1:8545`.

## Interact with Contract
- All the account address manage in the current node can be found with this command `let accounts = await web3.eth.getAccounts().then(console.log);`
- Creating an instance of deployed `let ballotinstance = await Ballot.deployed();`
- `chairperson` address can found `let chairs = ballotinstance.chairperson();`
- Select a voter and give right to vote to the voter:
  ```
  let voter1 = accounts[1];
  await ballotinstance.giveRightToVote(voter1, {from:chairs});
  ```
- Vote by the voter `await ballotinstance.vote(0, {from:voter1});`
- Delegate vote to another voter
  ```
  let voter3 = accounts[4];
  let voter4 = accounts[5];
  await ballotinstance.giveRightToVote(voter3, {from:chairs});
  await ballotinstance.giveRightToVote(voter4, {from:chairs});
  await ballotinstance.delegate(voter4, {from: voter3});
  ```
- See a particular voter information `await ballotinstance.voters(voter1);` 
  
