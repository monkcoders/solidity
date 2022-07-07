//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract StorageExample
{
    string[] public student=['Amit','Sanket','Sahil'];

    function mem() public view
    {
        string[] memory s1 = student;
        s1[0]='Manish';
    }

    function sto() public 
    {
        string[] storage s1=student;
        s1[0]='manish';
    }     
}