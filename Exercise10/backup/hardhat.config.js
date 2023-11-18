require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config()
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: process.env.RPC_GOERLI,
      accounts: [process.env.ACCOUNT],
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API,

  }
};
