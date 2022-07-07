//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

enum eligibile{yes,no}

struct person{
    string name;
    uint age;
    eligibile eligibility;
}


contract voter
{
    person public p1;

    constructor(string memory temp_name, uint temp_age){
        p1.name = temp_name;
        p1.age  = temp_age;
        if(p1.age<18){
            p1.eligibility =eligibile.no;
        }
        else{
            p1.eligibility = eligibile.yes;
        }
    }

    
    
}
