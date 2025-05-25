import {Script, console} from "forge-std/Script.sol";

contract MagicNumberScript is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // runtimeCode = hex"602a60005260206000f3";
        bytes memory creationCode = hex"69602a60005260206000f3600052600a6016f3";
        address magicNumber = 0xb0ad7Db009aCD840ea0a1CB665724Db03E2f151A;
        address deployed;

        assembly {
            deployed := create(0, add(creationCode, 0x20), mload(creationCode))
        }

        (bool success,) = magicNumber.call(abi.encodeWithSignature("setSolver(address)", deployed));
        require(success, "Call failed");

        vm.stopBroadcast();
    }
}
