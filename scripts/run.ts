import { ethers } from "hardhat";

async function main() {
  const nftContractFactory = await ethers.getContractFactory("MyEpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed on:", nftContract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
