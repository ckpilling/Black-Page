pragma solidity ^0.8.1;

contract AssemblyInline {
    
    function AddTwoNumbers (uint x, uint y) public view returns(uint) {
        
        //compare gas usage with this function compared to what Solidity charges
        
        assembly {
            
            let result := add(x, y)
            mstore(0x0, result)
            return(0x0, 32)
        }
    }
}
