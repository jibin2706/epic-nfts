import { ethers } from "hardhat";

async function main() {
  const nftContractFactory = await ethers.getContractFactory("MyEpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed on:", nftContract.address);

  // call mint nft function
  let txn = await nftContract.makeAnEpicNFT();

  // wait for the completion of the transaction
  txn.wait();

  // calling once again
  txn = await nftContract.makeAnEpicNFT();

  // wait for the completion of the transaction
  txn.wait();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
