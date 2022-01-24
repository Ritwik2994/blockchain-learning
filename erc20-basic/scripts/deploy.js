async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account: ", deployer.address);

  const weiAmount = (await deployer.getBalance()).toString();
  const Token = await ethers.getContractFactory("MyERCToken");
  const token = await Token.deploy();

  console.log("Account balance: ", await ethers.utils.formatEther(weiAmount));
  console.log("Token address: ", token.address);
  console.log("Token name: ", await token.name());
  console.log("Token symbol: ", await token.symbol());
  console.log("Token total supply: ", await token.totalSupply());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
