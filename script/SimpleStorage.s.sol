pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";


contract SimpleStorageScript is Script{ 
    SimpleStorage public s;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        s = new SimpleStorage(666);

        vm.stopBroadcast();
    }
}