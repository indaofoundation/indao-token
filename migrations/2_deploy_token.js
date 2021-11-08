const SportInvestingToken = artifacts.require("IndaoToken");

module.exports = function(deployer) {
    deployer.deploy(IndaoToken);
};