// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script, console} from "forge-std/Script.sol";
import {SafeMints} from "../src/SafeMints.sol";

contract SafeMintsScript is Script {
    SafeMints public safeMints;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        safeMints = new SafeMints();

        vm.stopBroadcast();
    }
}
