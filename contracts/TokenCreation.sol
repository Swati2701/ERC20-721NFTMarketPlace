//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TokenCreation is ERC721{
   
   uint256 tokenId = 1;
   constructor() ERC721("NFTToken", "NFT") {}
     
   function mint(address to) public {
       
       _mint(to, tokenId); 
       tokenId++;
   }
}

//0xa6056E7732E10d3F721c34260E00818C59a06dB3
