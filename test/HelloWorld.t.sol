pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test{
    HelloWorld public hw;

    function setUp() public{
        hw = new HelloWorld();
    }

    function test_onlyOwner() public{
        // 设置下一条交易的 msg.sender 为 owner
        vm.prank(address(this)); 
        hw.changeMessage("SJTU");
    }
}