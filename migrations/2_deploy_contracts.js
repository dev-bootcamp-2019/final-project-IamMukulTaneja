var AwardDegree = artifacts.require('./AwardDegree.sol')

module.exports = function (deployer) {
  deployer.deploy(AwardDegree);
}
