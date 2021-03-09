pragma solidity ^0.8.1;

contract MappingStructExample {
    
    address payable owner;
    address ownerAddress;
    
    
    struct Payment {
        uint amount;
        uint timestamps;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    
    constructor() public {
       ownerAddress = msg.sender;
       owner = ownerAddress;
    }
    
    
    mapping(address => Balance) public balanceReceived;
    
    function getBalance() public view returns(uint) {
        return address(this).balance ;
        
    }
    
    function receiveMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;
        
        Payment memory payment = Payment(msg.value, block.timestamp);
        
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender].totalBalance >= _amount, "Not enough funds");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);

    }
    
    function withdrawAllMoney(address payable _to) public {
        
    //    require(balanceReceived[msg.sender] < balanceReceived.totalBalance, "not enough dough bro!!!!");
    //    assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - balanceReceived);
        
        // require(balanceReceived[msg.sender].totalBalance >= balanceReceived[msg.sender].totalBalance, "you are trying to withdraw more than you have put in!!!!!!");
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    } 
    
    // fallback() external payable {
    //     sendMoney();
    // }
    
    fallback() external payable {
        receiveMoney();
    }
    
    receive() external payable {
        
    }
    
        function destroySC() public {
        require(msg.sender == ownerAddress, "you are not the owner");
        selfdestruct(owner);
    }
}

