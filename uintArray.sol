// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract uintArrayContract{
    uint[] arr;

    function addElement(uint element) public {
        arr.push(element);
    }
    function updateElement(uint index, uint newVal) public {
        arr[index] = newVal;
    }
    function getLength() public view returns (uint) {
        return arr.length;
    }
}
