//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Boolean
{
    function evenCheck(uint number) public pure returns(bool)
    {
        bool even=false;
        if(number%2 == 0){
            even=true;
        }
        else {
            even = false;
        }
        return even;
    }
}