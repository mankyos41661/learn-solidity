// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

    /*
    withdraw ETH without msg.value:
        syntax:
        addressContract.withdraw(amount);
        example:
        IWETH(WETH).withdraw(amountETH);

    deposit ETH without msg.value:
        syntax:
        addressContract.deposit {value: amount}();
        example:
        IWETH(WETH).deposit{value: amount}();
    
    call contract ETH without msg.value:
        syntax:
        addressContract.call{value: amount}();
    */

contract SendEther {
    constructor() payable {}
    receive() external payable {}
    function sendViaTransfer(address payable to, uint256 amount) public payable {
        to.transfer(amount);
    }
    function sendViaSend(address payable to, uint256 amount) public payable {
        bool sent = to.send(amount);
        require(sent, "Failed to send Ether");
    }
    function sendViaCall(address payable to, uint256 amount) public payable {
        (bool sent, bytes memory data) = to.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}

contract EthReceiver {
    event Log (uint256 amount, uint gas);
    receive() external payable {
        emit Log (msg.value, gasleft());
    }
}

contract EthFallback {
    event Log (uint gas);
    fallback() external payable {
        emit Log (gasleft());
    }
}