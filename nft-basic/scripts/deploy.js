async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account: ", deployer.address);

  const Token = await ethers.getContractFactory("YourDate");
  const token = await Token.deploy();

  console.log("Token address: ", token.address);
  console.log("Token name: ", await token.name());
  console.log("Token symbol: ", await token.symbol());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
