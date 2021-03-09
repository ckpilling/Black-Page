pragma solidity ^0.8.1;

contract WorkingWithAddressAndBalance {

address public myAddress;

function setAddress(address _myAddress) public {
    myAddress = _myAddress;
}

function getBalanceOfAddress() public view returns(uint) {
    return myAddress.balance;
}

}
