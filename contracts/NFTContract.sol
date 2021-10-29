// SPDX-License-Idetifier: MIT
//SPDX-License-Identifier: GPL-2.0
//SPDX-License-Identifier: GPL-2.0+

pragma solidity ^0.8.0;

import "./ERC20Creation.sol";
import "./TokenCreation.sol";

contract NFTContract is TokenCreation {
     address admin;
    mapping(uint256 => uint256) currentPrice;
    ERC20Creation public erc20Address;

    
    constructor (ERC20Creation _erc20Address) {
        erc20Address = _erc20Address;
    }

    function getTokenOwner(uint256 _tokenId) public view returns(address){
        address _tokenOwner = ownerOf(_tokenId);
        return _tokenOwner;
    }


    function checkTokenExists(uint256 _tokenId) public view returns(bool) {
        bool tokenExists = _exists(_tokenId);
        return tokenExists;
    } 

    function getCurrentPrice(uint256 _tokenId) public view returns(uint256) {
        require(_exists(_tokenId));
        return currentPrice[_tokenId];
    }

    function changeTokenPrice(uint256 _tokenId, uint256 _amount) public{
        require(msg.sender != address(0)); 
        require(_exists(_tokenId));

        address tokenOwner = ownerOf(tokenId);
        require( tokenOwner == msg.sender );
        require(_amount > 0);
        currentPrice[_tokenId] = _amount;
    }

    function createNftToken(uint256 _tokenId, uint256 _amount) public{
        require(msg.sender != address(0));
        require(_amount > 0);
        require(!_exists(tokenId));
        mint(msg.sender);
        changeTokenPrice(_tokenId, _amount);
    }


    function buyToken(uint256 _tokenId, uint256 _amount) public {
        require(msg.sender != address(0));
        require(_exists(_tokenId));
        require(_amount > currentPrice[_tokenId]);
        require(_amount >= erc20Address.balanceOf(msg.sender));

        address tokenOwner = ownerOf(_tokenId);
        require(tokenOwner != address(0) && tokenOwner != msg.sender);
        

        _transfer(tokenOwner, msg.sender, _tokenId);
        erc20Address.transfer(msg.sender, _amount);
    }
}
