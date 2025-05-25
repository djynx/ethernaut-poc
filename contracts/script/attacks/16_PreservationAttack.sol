contract PoopyLibrary {
    address public dead;
    address public beef;
    address public owner;

    function setTime(uint256 _time) public {
        owner = address(uint160(_time));
    }
}
