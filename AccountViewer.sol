// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Account {
    /*
    mapping (address => uint) balance;
    address payable contractor = payable(address(this));

    constructor() payable {}
    receive() external payable {}
    fallback() external payable {}
    uint public _amount;

    function getAmount() public view returns (uint){return _amount;}
    function encodeWithSignature(uint amount) external pure returns (bytes memory data){
        return abi.encodeWithSignature("getAmount(uint) external payable {}", (amount * 1 ether));
    }
    function mint(bytes calldata data) public payable returns (uint amount){
        (bool succes, ) = address(this).call(data);
        require(succes == true, "Cannot call address");
        amount = abi.decode(data, (uint));
        balance[payable(contractor)] += amount;
    }
    function getBalance(uint amount) external payable {}
    function getViewBalance() public view returns (uint){
        return balance[payable(address(this))];
    }
    function withdraw() external payable returns (uint amount) {
        payable(msg.sender).call("value = 1 ether");
    }
    */

    function data() public view returns (bytes memory _data){
        return _data = "address(this)";
    }
}