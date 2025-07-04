// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import OpenZeppelin ERC721
import "https://cdn.jsdelivr.net/npm/@openzeppelin/contracts@4.9.3/token/ERC721/ERC721.sol";
import "https://cdn.jsdelivr.net/npm/@openzeppelin/contracts@4.9.3/access/Ownable.sol";
import "https://cdn.jsdelivr.net/npm/@openzeppelin/contracts@4.9.3/utils/Counters.sol";

contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyNFT", "MNFT") {}

    /// @notice Mint a new NFT to `to`
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
