pragma solidity ^0.8.1;

contract WorkingWithStrings {
    
    string public MyString = 'hello solidity!';
    string public MyString2 = 'hello solidity2!';
    
    function setMyString(string memory _myString) public {
        MyString = _myString;
    }
    
    
    // Solidity is not made for working with Strings, there is no basic way to compare strings
    
    function setMyString2(string memory _myString2) public {
        MyString2 = _myString2;
    }
    
    // function matchStrings(string memory MyString, string memory MyString2) public view returns (bool) {
    //     return keccak256(abi.encodePacked(MyString)) == keccak256(abi.encodePacked(MyString2));
    // }
    
      function matchStrings() public view returns (bool) {
        return keccak256(abi.encodePacked(MyString)) == keccak256(abi.encodePacked(MyString2));
    }
    
    
}
