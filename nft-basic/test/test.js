const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("YourDate", () => {
  let dateToken, DateTokenInstance;
  beforeEach(async () => {
    DateTokenInstance = await ethers.getContractFactory("YourDate");
    dateToken = await DateTokenInstance.deploy();
    await dateToken.deployed();
  });

  describe("deployment", () => {
    it("has a name of YourDate", async () => {
      const name = await dateToken.name();
      expect(name).to.equal("YourDate");
    });

    it("has a symbol", async () => {
      const symbol = await dateToken.symbol();
      expect(symbol).to.equal("DATE");
    });
  });
});
