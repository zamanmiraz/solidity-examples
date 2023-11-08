const MyContract = artifacts.require("InheritanceContract");

module.exports = function (deployer) {
  deployer.deploy(MyContract, "0xa24Db8420C42522c3539158EA155feE42b81Cd7B");
};