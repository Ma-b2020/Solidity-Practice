// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract calcContract{
    uint result;

    function addNumbers(uint a, uint b) public {
        result= a+b;
    }

    function subNumbers(uint a,uint b) public {
        result=a-b;
    }

    function mulNumbers(uint a,uint b) public {
        result= a*b;
    }

    function divNumbers(uint a,uint b) public {
        require(b>0,'Not divisible by Zero');
        result= a/b;
    }

    function getResult() public view returns (uint c){
        return result;
    }

}
