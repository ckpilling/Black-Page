pragma solidity ^0.8.1;

contract Stuff1 {
    
     uint public balanceReceived; 
    
   //  address internal currAddr = address(this);
    
    address owner;
    bool public paused;
    
        constructor() public {
        owner = msg.sender;
    }
    
    uint public currBal = currAddr.balance;
    
    
       function getBalance() public view returns(uint) {
        return address(this).balance;
     }
    
    function sendMoneyTo() public payable {
      //  balanceReceived += msg.value;
        currBal += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return(currAddr.balance);
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not able to pause the contract");
        paused = _paused;
    }
    
    
    function withdrawMoney() public {
        address payable to = payable(address(msg.sender));
        to.transfer(currBal);
    }
    
    function WithdrawMoneyTo(address payable _to) public {
        _to.transfer(currBal);
    }
    
}
