//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract ContructorExample
{
    uint public count ;
    constructor(uint new_age) 
    {
        count = new_age;
    }
}