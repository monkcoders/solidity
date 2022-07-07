//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract paymentSmartContractExample
{
    address payable user = payable(0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678);
    function payMe() public payable{

    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function sendEtherAccount() public 
    {
        user.transfer(1 ether);
    }
}