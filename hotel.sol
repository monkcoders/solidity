//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Hotel
{

    enum status{
        vacant,
        occupied
        }
    
    status public currentStatus ;

    address payable public owner;

    event occupy( address occupant, uint paidAmount);

    constructor(){
        // executer of the smart contract is the owner of hotel 
        owner = payable(msg.sender);
        //initially the room is vacant
        currentStatus = status.vacant;
    } 

    modifier checkAmount(uint _amount) {
        require(msg.value >= _amount, "Failure insufficient balance ");
        _;
    }

    modifier checkStatus{
        require(currentStatus==status.vacant, "Failure hotel already occupied");
        _;
    }

    function book() payable public checkAmount(2 ether) checkStatus{
        
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent, "Failure not sufficient amount /n hotel not booked /n transaction reverted");
        currentStatus = status.occupied;
        emit occupy(msg.sender, msg.value);
    } 
}