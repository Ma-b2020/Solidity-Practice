// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        string description;
        uint256 voteCount;
    }

    address public chairperson;
    mapping(address => uint256) public voters;
    Proposal[] public proposals;

    constructor(string[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson] = 1;

        for (uint256 i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                description: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    function giveRightToVote(address voter) public {
        require(msg.sender == chairperson, "Only chairperson can give right to vote.");
        require(voters[voter] == 0, "The voter already has the right to vote.");
        voters[voter] = 1;
    }

    function vote(uint256 proposal) public {
        uint256 voterWeight = voters[msg.sender];
        require(voterWeight != 0, "Has no right to vote.");
        require(voterWeight == 1, "Already voted.");
        voters[msg.sender] = 2;
        proposals[proposal].voteCount += voterWeight;
    }

    function winningProposal() public view returns (uint256 winningProposal_) {
        uint256 winningVoteCount = 0;
        for (uint256 p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    function winnerName() public view returns (string memory winnerName_) {
        winnerName_ = proposals[winningProposal()].description;
    }
}
