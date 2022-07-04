//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract arrayExample
{
    uint[6] public arr= [1,2,3,4,5];

    function length() public view returns(uint)
    {
        return arr.length;
    }
    function setter(uint idx, uint val) public 
    {
        arr[idx] = val;
    }


}