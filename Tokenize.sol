// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
Latihan
Sedia
1. Balance
2. Address from (Sender) / msg.sender
3. Address to (Receiver)
4. Amount
5. Alat Penghitungan
*/

import "./IERC20.sol";

contract ERC20 is IERC20 {

    string public constant name = "BUSD Token";
    string public constant symbol = "BUSD";
    uint8 public constant decimals = 0;


    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_ = 1000 ether;


    constructor() {
        balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender]-numTokens;
        balances[receiver] = balances[receiver]+numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner]-numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender]-numTokens;
        balances[buyer] = balances[buyer]+numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }

    function burn(address from, uint256 numTokens) public returns (uint256) {
        require(numTokens <= balances[msg.sender]);
        return balances[from] = balances[from] - numTokens;
    }

    function mint(address receiver, uint256 numTokens) public returns (uint256) {
        require(numTokens > 0);
        return balances[receiver] = balances[receiver] + numTokens;
    }
}


