# amax-snap-contract

amax snap evm contract


## contract address

https://goerli.etherscan.io/address/0xfadd993d019abef320d69269ee447f2bf9966d3e


## contract deploy

```
% yarn deploy-amaxsnap-goerli

yarn run v1.22.19
warning ../package.json: No license field
warning ../../package.json: No license field
$ npx hardhat --network goerli run ./scripts/deploy-amaxsnap.ts
Compiled 1 Solidity file successfully
Deploying AmaxSnapContract...
Deploying Proxy deployed address 0xFaDd993D019aBeF320D69269eE447F2bF9966d3E
✨  Done in 66.97s.


% yarn hardhat verify --network goerli 0xFaDd993D019aBeF320D69269eE447F2bF9966d3E

yarn run v1.22.19
warning ../package.json: No license field
warning ../../package.json: No license field
$ .bin/hardhat verify --network goerli 0xFaDd993D019aBeF320D69269eE447F2bF9966d3E
Verifying implementation: 0xD6B02b578ff473Eb00C427e3efD7519E0C29Ffe8
Successfully submitted source code for contract
contracts/AmaxSnapCotract.sol:AmaxSnapContract at 0xD6B02b578ff473Eb00C427e3efD7519E0C29Ffe8
for verification on the block explorer. Waiting for verification result...

Successfully verified contract AmaxSnapContract on the block explorer.
https://goerli.etherscan.io/address/0xD6B02b578ff473Eb00C427e3efD7519E0C29Ffe8#code
Verifying proxy: 0xFaDd993D019aBeF320D69269eE447F2bF9966d3E
Contract at 0xFaDd993D019aBeF320D69269eE447F2bF9966d3E already verified.
Linking proxy 0xFaDd993D019aBeF320D69269eE447F2bF9966d3E with implementation
Successfully linked proxy to implementation.

Proxy fully verified.
✨  Done in 15.95s.

```

## amax test key

```
Private key: 5JkTAZrxwa2qqNf1277MaXRWirm8XLhpj37wa8SM97zuaTBRaVd
Public key: AM5CB8Wdb3ZJZunyxqwB4nJReWMaCKs1ev14hjisynkchf5gwmjS

Private key: 5HuPf22Q17iQqyYzHh1XTXaAWWW327ta91hXuqsZmsJnD13aXNY
Public key: AM8JYM9qgybS3x9jGUijWjzYyQm6sCnn5y1WqjmPUfKGpYQuhcgr

Private key: 5Jmqeg3evx1Z874AtJvV97czL4N7JcNeEPw7oAmE4CLAPbeWfiS
Public key: AM7hRbn3NY4pGJtv43VmpBcVdFm6k4F6NqNbiMd1nW4EWXqJUX5z
```
