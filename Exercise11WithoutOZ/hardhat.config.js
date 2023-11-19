require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    goerli: {
      url: process.env.GOERLI_RPC,
      accounts: [process.env.ACCOUNT]
    },
  },
  etherscan: {
    apiKey: process.env.API_KEY,
  },
};
