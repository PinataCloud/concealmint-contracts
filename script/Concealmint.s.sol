// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script, console} from "forge-std/Script.sol";
import {Concealmint} from "../src/Concealmint.sol";

contract ConcealmintScript is Script {
    Concealmint public concealmint;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        concealmint = new Concealmint();

        vm.stopBroadcast();
    }
}
