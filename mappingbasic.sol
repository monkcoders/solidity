//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Class
{
    mapping(uint=>string) public rollNo;
    function setClass(uint roll, string memory name) public{
        rollNo[roll]= name;
    }
}