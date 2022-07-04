//SPDX-Licence-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Identity
{
    string name;
    uint age;

    constructor() public
    {
        name = "Abhishek";
        age=20;
    }

    function getAge() view public returns(uint)
    {
        return age;
    }
    function getName() view public returns(string memory)
    {
        return name;
    }

    function setAge() public
    {
        age = age+1;
    }
}