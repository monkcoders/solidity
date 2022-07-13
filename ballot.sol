//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Ballot{
    struct Voter{
        bool voted;
        uint weight;
        uint vote;
    }

    enum Stage{initialize, registeration, voting , done}
    Stage public stage = Stage.initialize;

    mapping (address=>Voter) public voter;

    uint[] public proposal ;
    
    address public chairperson;
    uint public startTime;
    

    constructor(uint _size){
        stage = Stage.registeration;
        chairperson = msg.sender; 
        voter[chairperson]= Voter(false,2,0);
        for(uint i=0; i<=_size; i++){
            proposal.push(0);
        }
        startTime = block.timestamp;
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
        require(stage == Stage.registeration, "Not registration stage");
        voter[voterAdd] = Voter( false, 1, 0);
        if((block.timestamp-startTime) >= 5 minutes){
            stage = Stage.voting;
        }

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
        require(stage == Stage.voting, "Not voting stage");
        Voter storage sender = voter[msg.sender];
        sender.voted = true;
        sender.vote = proposalP;
        proposal[proposalP] += sender.weight;
        if((block.timestamp-startTime)>=7 minutes){
            stage = Stage.done;
        }
    }


    modifier checkStage{
        require(stage == Stage.done, "Voting not complete yet");
        _;
    }

    function winningProposal() public view checkStage returns(uint proposalNo, uint proposalVote) {
        uint winner=0;
        for(uint i=1; i<proposal.length; i++){
            if(proposal[i]>proposal[winner]){
                winner=i;
            }
        }
        return (winner,proposal[winner]);
    }


}