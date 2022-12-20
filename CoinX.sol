// SPDX-License-Identifier: MIT	
pragma solidity ^0.8.8;

contract CoinX {
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    function mine(uint256 _amountToMine)public{
        totalSupply += _amountToMine;
        balances[msg.sender] += _amountToMine;
    }

    function transfer(address _recipientAddress, uint256 _amountToTransfer) public {
        require(balances[msg.sender] >= _amountToTransfer, "INSUFFICIENT FUNDS");
        balances[msg.sender] -= _amountToTransfer;
        balances[_recipientAddress] += _amountToTransfer;
    }

    function balanceOf(address _userAddress) public view returns (uint256){
        return balances[_userAddress];
    }
}
