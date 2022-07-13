//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Ballot{
    struct Voter{
        bool voted;
        uint weight;
        uint vote;
    }

    mapping (address=>Voter) public voter;

    uint[] public proposal ;
    
    address public chairperson;

    

    constructor(uint _size){
        chairperson = msg.sender; 
        voter[chairperson]= Voter(false,2,0);
        for(uint i=0; i<=_size; i++){
            proposal.push(0);
        }
    }

    modifier checkChairperson{
        require(msg.sender == chairperson, "Only chairperson can register a voter");
        _;
    }
    modifier checkAlreadyRegistered(address voterAdd){
        require(voter[voterAdd].weight==0,"Already registered");
        _;
    }

    function register(address voterAdd) public checkChairperson checkAlreadyRegistered(voterAdd){
        voter[voterAdd] = Voter( false, 1, 0);
    }

    modifier checkRegistered(address sender){
        require(voter[sender].weight !=0, "Has noo right to vote");
        _;
    }
    modifier checkAlreadyVoted(address sender){
        require(voter[sender].voted==false, "Already voted.");
        _;
    }

    function voteP(uint proposalP) external checkRegistered(msg.sender) checkAlreadyVoted(msg.sender){
        Voter storage sender = voter[msg.sender];
        sender.voted = true;
        sender.vote = proposalP;

        // If `proposal` is out of the range of the array,
        // this will throw automatically and revert all
        // changes.
        proposal[proposalP] += sender.weight;
    }

    function winningProposal() public view returns(uint proposalNo, uint proposalVote) {
        uint winner=0;
        for(uint i=1; i<proposal.length; i++){
            if(proposal[i]>proposal[winner]){
                winner=i;
            }
        }
        return (winner,proposal[winner]);
    }

   
    
    


}