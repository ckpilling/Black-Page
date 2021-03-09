pragma solidity ^0.5.13; //NOTICE compiler version, this has changed in ^0.8.0 whcih uses safemath to prevent wraparound

contract WraparoundIntegers {
    
    uint8 public myUint8; //defaults to Zero when contract is deployed
    
    function incrementMyUint() public {
        myUint8++;
    }
    
    function decrementMyUint() public {
        myUint8--;
    }
    
}
