//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract loop
{
    uint[3] public arr;
    uint public count;

    function forLoop() public 
    {
        for(uint i=0; i<arr.length; i++){
            arr[i]=i;
        }
        
    }

    function whileLoop() public 
    {
        count = 0;
        while(count<arr.length){
            arr[count]=count;
            count++;
        }
        
    }

    function doWhileLoop() public 
    {
        count = 0;
        do{
            arr[count]=count;
            count++;
        }while(count<arr.length);
        
    }
    
}