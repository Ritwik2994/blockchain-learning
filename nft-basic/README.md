# ERC729 Training

This is the simple ERC721 implementation in a project where we have placed 2 kinds of external contracts

- ERC721 --> help to implement the ERC721 standard token
- Ownable --> implementing ownership in the contracts.

## About

This is a NFT project where a user can claim a token having a Title and Date. This date is once claimed will never be claimed againg by any other user.

For claim user have to do atransaction of 1000 WEI or 0.000000000000001 ETH

## Deployment

To install the dependencies

```bash
  npm install
```

To compile the contract

```bash
  npx hardhat complie
```

To run the script for deployment

```bash
  npx hardhat run scripts/deploy.js
```
