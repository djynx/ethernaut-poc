// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./attacks/11_ElevatorAttack.sol";
import {Script} from "forge-std/Script.sol";

contract ElevatorScript is Script {
    function run() external {
        address instance_addr = address(0x31cd976016E5A3257C5C7461c8aA1cA541Df5E43);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        ElevatorAttack elevatorAttack = new ElevatorAttack(payable(instance_addr));
        elevatorAttack.pwn();
        vm.stopBroadcast();
    }
}
