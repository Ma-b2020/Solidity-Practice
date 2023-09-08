// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract peopleContract{
    uint peopleCount=1;
    Person[] public people;

    struct Person{
        uint id;
        string name;
        uint age;
    }

    function addPerson(uint id,string memory name,uint age) public {
        people.push(Person(id,name,age));
        peopleCount+=1;
    }

    function getPeopleCount() public view returns (uint){
        return people.length;
    }

    function getPeople(uint index) public view returns (uint,string memory,uint){
        Person memory person=people[index];
        return (person.id,person.name,person.age);
    }
}
