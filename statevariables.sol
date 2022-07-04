// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract State
{
    //save on contract storage
    uint public age=2;
    constructor() 
    {
        age = age+1;
    }
    function setAge() public
    {
        age = age+1;
    }
    
}