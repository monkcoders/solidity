//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract byteArray
{
    bytes public b='abc';

    function getElement(uint i) public view returns(bytes1)
    {
        return b[i];
    } 

    function pushElement() public 
    {
        b.push('b');
    }

    function getLength() public view returns(uint){
        return b.length;
    }

}