import {Script, console} from "forge-std/Script.sol";
import "./attacks/14_GatekeeperTwoAttack.sol";

contract GatekeeperTwoScript is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        address gatekeeperTwo = 0x22bD2a51151BeACB3a735ff582c3d13D1D3a12C5;
        new GatekeeperTwoAttack(gatekeeperTwo);

        vm.stopBroadcast();
    }
}
