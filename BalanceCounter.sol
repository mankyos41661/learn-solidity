// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalanceCounter {
    // Init
    event Mint(address indexed from, address indexed to, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Burn(address indexed from, address indexed to, uint256 amount);

    // Address
    address private dis = address(this);
    address private go = msg.sender;

    // Mapping
    mapping(address => uint) balance;

    // Function
    function transfer(address account, uint256 amount) public {
        require(amount <= balance[dis], "Message: Unsufficient Balance!");
        balance[dis] -= amount * (1 ether);
        balance[account] += amount * (1 ether);
        emit Transfer(dis, account, (amount * (1 ether)));
    }

    function mint(uint amount) public {
        balance[go] += amount * (1 ether);
        emit Mint(dis, go, (amount * (1 ether)));
    }

    function burn(uint amount) public {
        require(amount <= balance[go], "Message: Over Amount!");
        balance[go] -= amount * (1 ether);
        emit Burn(dis, go, (amount * (1 ether)));
    }

    function balanceContractor() public view returns (uint256) {
        return balance[dis];
    }

    function getBalance() public view returns (uint256) {
        return balance[go];
    }
}