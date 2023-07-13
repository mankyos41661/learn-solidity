// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IERC20 {
    function transfer(address, uint) external;
}

contract ABIEncodeDecode {
    struct MyStruct {
        string name;
        uint[2] nums;
    }
    function encode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
    ) external pure returns (bytes memory data) {
        return abi.encode(x, addr, arr, myStruct);
    }
    function decode(bytes calldata data) external pure returns (uint x, address addr, uint[] memory arr, MyStruct memory myStruct) {
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
    } 
}

contract EncodeCallData {
    // For Testing
    function decode(address _contract, bytes calldata data) external returns (address to, uint amount){
        (bool success,) = _contract.call(data);
        require(success, "Failed to decode calldata");
        (to, amount) = abi.decode(data, (address, uint));
    }


    function encodeWithSignature(address to, uint amount) external pure returns (bytes memory data){
        // Typo is not checked - "transfer(address, uint)"
        return abi.encodeWithSignature("transfer(address, uint)", to, amount);
    }
    function encodeWithSelector(address to, uint amount) external pure returns (bytes memory data){
        // Type is not checked - (IERC20.transfer.selector, true, amount)
        return abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
    }
    function encodeCall(address to, uint amount) external pure returns (bytes memory data){
        // Typo and type errors will not compile
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }
}