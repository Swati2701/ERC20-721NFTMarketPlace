/**
 * @type import('hardhat/config').HardhatUserConfig
 */

/* eslint-disable */
 require('@nomiclabs/hardhat-ethers')

 //const ALCHEMY_API_KEY = "BciGa1dW0D_QBiEZEV7f8kUYaFYW2Jp";

 const ROPSTEN_PRIVATE_KEY = "a91dc609634962d2316d3b6f01ce4ebcc6a0fe19b36c8ba5ce76f34bec7c8ac5";

module.exports = {
  solidity: "0.8.0",
  networks: {
    ropsten: {
      url: `https://eth-ropsten.alchemyapi.io/v2/-BciGa1dW0D_QBiEZEV7f8kUYaFYW2Jp`,
      accounts: [`0x${ROPSTEN_PRIVATE_KEY}`],
    },
  },
};

