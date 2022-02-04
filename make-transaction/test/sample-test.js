const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Transactions", () => {
  let TransactionsFactory, transactionContract;
  beforeEach(async () => {
    TransactionsFactory = await hre.ethers.getContractFactory("Transactions");
    transactionContract = await TransactionsFactory.deploy();
    await transactionContract.deployed();
  });

  describe("get transaction ", () => {
    it("transaction count", async () => {
      const transactionCount = await transactionContract.getTransactionCount();
      console.log("initial transaction count: ", transactionCount);
      expect(transactionCount).to.equal("0");
    });
  });
});
