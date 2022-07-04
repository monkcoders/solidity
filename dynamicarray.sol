//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract DynamicArray
{
    uint[] public arr;

    function length() public view returns(uint)
    {
        return arr.length;
    }

    function pushElement(uint val) public
    {
        arr.push(val);
    }

    function popElement() public
    {
        arr.pop();
    }
}