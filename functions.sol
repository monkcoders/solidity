// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract functionExample
{
    uint public age=10;

    function getter() public view returns(uint)
    {
        return age;
    } 

    function setter() public
    {
        age = age +1;
    }
    function setNewAge(uint newAge) public
    {
        age  = newAge;
    }
    function roll() public pure returns(uint)
    {
        uint rollno = 12;
        return rollno; 
    }
}