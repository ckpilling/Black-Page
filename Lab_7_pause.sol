pragma solidity ^0.5.13;

contract StartStopPause {
    
    // this is a comment
    
    /// this is a comment
    
    address owner;
    bool public paused;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function sendMoney() public payable {
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not able to pause the contract");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You are not the owner and can't make this call");
        require(!paused, "Contract is paused!!!");
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "you are not the one who can nuke!!!");
        selfdestruct(msg.sender);
    }
    
}
