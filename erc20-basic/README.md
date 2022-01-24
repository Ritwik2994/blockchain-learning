# ERC20 Training

This is the simple ERC20 implementation in a project where we have placed 2 kinds of external contracts

- ERC20 --> help to implement the ERC20 standard token
- AccessControl --> help to control few function

mint function is controlled by the owner of the contract

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
