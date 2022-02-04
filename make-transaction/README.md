# Make Tranasction

This is the simple contract where we can do a transaction from one account to another

## Functions

makeTransaction() ---> this function takes 3 arguement to make a transaction. It takes reciever_account_address, amount, and message

getAllTransactions() ---> this function get the transaction list

getTransactionCount() ---> this function prints the number of transactions

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
