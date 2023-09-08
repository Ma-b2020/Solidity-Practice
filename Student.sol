// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract studentContract{
    uint studentCount=1;
    Student[] public students;

    struct Student{
        uint usn;
        string name;
        uint age;
        string email;
    }

    function addStudent(uint usn,string memory name,uint age,string memory email) public {
        students.push(Student(usn,name,age,email));
        studentCount+=1;
    }

    function getStudentCount() public view returns (uint){
        return students.length;
    }

    function getStudent(uint index) public view returns (uint,string memory,uint,string memory){
        Student memory student=students[index];
        return (student.usn,student.name,student.age,student.email);
    }
}
