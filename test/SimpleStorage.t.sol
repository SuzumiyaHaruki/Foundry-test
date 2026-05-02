// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public s;
    address public owner;

    function setUp() public {
        owner = address(this);  // 部署者作为 owner
        s = new SimpleStorage(10);
    }

    function testInitialValue() public view{
        // assertEq 用于断言
        assertEq(s.x(), 10);
    }

    function testSetX(uint _x) public {
        s.setX(_x);
        assertEq(s.x(), _x);
    }

    function testSetMessageRevert(string memory m) public {
        address attacker = address(0x123);
        vm.prank(attacker);
        // expectRevert 用于测试 revert
        vm.expectRevert("Only owner can set!");
        s.setMessage(m);
    }
}