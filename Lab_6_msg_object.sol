pragma solidity ^0.8.1;

contract SendMoneyExample {
    
    uint public balanceReceived;
    
        
    // a function to receive Money
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }
    
    // a function to get the balance of the Smart Contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    // this function sends the balance of the Smart Contract to the account making the call 
     function withdrawMoney() public {
        address payable to = payable(address(msg.sender));
        to.transfer(this.getBalance());
    }
    
    /* this function sends the balance of the Smart Contract to the address passed as the argument to the function call
       if you want all the balance to go to the address in the function argument you have to call the function from another address and that address will pay the gas
       i.e. if you want all the balance to go to address1 you have to pass address1 as the argument and make the function call from address2 */
    
    function WithdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
    
}
