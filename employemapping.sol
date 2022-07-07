//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

struct employee{
    string name;
    string post;
    uint salary;
}

contract EmployeeDetails
{

    mapping(uint=>employee) public empId;

    function setEmp(uint Id, string memory _name, string memory _post, uint _salary) public
    {
        empId[Id] = employee(_name,_post,_salary);
    } 

}