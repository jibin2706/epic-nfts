// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721 ("MyEpicNFT", "MYNFT") {
    console.log("This is my NFT contract");
  }

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();

    // minting the nft to the senders address
    _safeMint(msg.sender, newItemId);

    // setting nft data
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/XSW7");
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // incrementing the tokenIds counter
    _tokenIds.increment();

  }
}