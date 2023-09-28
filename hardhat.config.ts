import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@openzeppelin/hardhat-upgrades";
import "hardhat-contract-sizer";
import "hardhat-abi-exporter";
import { node_url, accounts } from "./utils/network";

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    goerli: {
      url: node_url("goerli"),
      accounts: accounts("goerli"),
      chainId: 5,
    },
    ethmain: {
      url: node_url("ethmain"),
      accounts: accounts("ethmain"),
      chainId: 1,
    },
  },
  contractSizer: {
    alphaSort: true,
    disambiguatePaths: false,
    runOnCompile: true,
    strict: true,
    only: ["AmaxSnapContract"],
  },
  abiExporter: {
    path: "./abi",
    runOnCompile: true,
    clear: true,
    flat: true,
    only: ["AmaxSnapContract"],
    spacing: 2,
    pretty: false,
    format: "json",
  },
  etherscan: {
    apiKey: "***"
  }
};

export default config;
