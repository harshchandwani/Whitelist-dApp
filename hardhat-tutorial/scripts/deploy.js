const { ethers } = require("hardhat");

async function main() {
  // 1. tell the script what we want to deploy (our contract)
  const whitelistContract = await ethers.getContractFactory("Whitelist");
  // 2. deploy it
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 2.1 wait for deployment to finish
  await deployedWhitelistContract.deployed();
  // 3. print the address of the whitelisted contact
  console.log(
    `Whitelist Contract Address: ${deployedWhitelistContract.address}`
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
