# voting_example
Voting contract example follows a simple approach by creating one contract per ballot. Each proposal is identified by a short name.

The contract creator assumes the role of the chairperson and has the authority to grant voting rights to each address individually. Participants can decide to cast their votes directly or delegate their voting power to a trusted individual.

Upon the conclusion of the voting period, the function winningProposal() determines the proposal with the highest number of votes, establishing the winner of the ballot.

## Truffle Initiazation
Command `truffle init` create a project structure in the current directory.
The project structure file include: 

- contracts/: Directory for Solidity contracts
- migrations/: Directory for scriptable deployment files
- test/: Directory for test files for testing your application and contracts
- truffle-config.js: Truffle configuration file

## Contract Creation
The voting contract placed in the contract folder of the current directory i.e., `contracts/voting.sol`.

## Migration Script
In the migration directory, a migration script titled 2_deploy_contracts.js is present.
```
const voting_contract = artifacts.require("Ballot");

module.exports = function (deployer) {
  deployer.deploy(voting_contract, ["0x666f6f0000000000000000000000000000000000000000000000000000000000","0x6261720000000000000000000000000000000000000000000000000000000000"]);
};
```
The naming convention for migration scripts can be found [here](https://trufflesuite.com/docs/truffle/how-to/contracts/run-migrations/#migration-files)..
In the script, the `artifacts.require()` method is utilized to instantiate a contract (named ballot in this case) from its file.
The migration script exports a function through the `module.exports` syntax, which takes a deployer object as a parameter.
The deployer is responsible for deploying a specific contract (Ballot), as specified by the contract object (voting_contract).
The constructor argument (proposalNames) must also be provided in the deployment, like so: "0x666f6f0000000000000000000000000000000000000000000000000000000000","0x6261720000000000000000000000000000000000000000000000000000000000".
