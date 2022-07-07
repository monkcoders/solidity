//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract GlobalVariableExample
{
    
    function get() public view returns(uint block_no, uint timeStamp, address msgSender,uint difficulty,address blockcoinbasse,uint blockgaslimit,uint leftgas,bytes calldata data,bytes4 functioniddata,uint gasprice) 
    {
        return (block.number,block.timestamp, msg.sender, block.difficulty, block.coinbase,block.gaslimit, gasleft(),msg.data,msg.sig,tx.gasprice);
    }

    
}