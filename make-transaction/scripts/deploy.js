async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account: ", deployer.address);

  const TransactionsFactory = await hre.ethers.getContractFactory(
    "Transactions"
  );
  const transactionContract = await TransactionsFactory.deploy();
  await transactionContract.deployed();

  console.log("Contract address: ", transactionContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
