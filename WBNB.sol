// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ERC20.sol";

contract WBNB is ERC20 {
    event Deposit(address indexed account, uint amount);
    event Withdraw(address indexed account, uint amount);

    uint _value = msg.value;

    constructor() ERC20("Wrapped BNB", "WBNB") payable {}
    fallback() external payable {
        deposit();
    }
    function deposit() public payable {
        emit Deposit(owner, _value);
    }
    function withdraw(uint _amount) external {
        emit Withdraw(owner, _amount);
    }
    function balance() public view returns (uint) {
        return address(this).balance;
    }
    }
}
