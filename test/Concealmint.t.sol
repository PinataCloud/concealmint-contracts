// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";
import {Concealmint} from "../src/Concealmint.sol";

contract ConcealTest is Test {
    Concealmint public nft;
    address public owner;
    address public minter;

    function setUp() public {
        owner = makeAddr("owner");
        minter = makeAddr("minter");
        vm.prank(owner);
        nft = new Concealmint();
        vm.startPrank(owner);
    }

    function test_SafeMint() public {
        string memory tokenURI = "ipfs://test";
        vm.stopPrank();
        vm.startPrank(minter);
        nft.safeMint(tokenURI);
        assertEq(nft.tokenURI(0), tokenURI);
        assertEq(nft.ownerOf(0), minter);
    }

    function test_Pause() public {
        nft.pause();
        assertTrue(nft.paused());
    }

    function test_Unpause() public {
        nft.pause();
        nft.unpause();
        assertFalse(nft.paused());
    }

    function testRevert_PauseNonOwner() public {
        vm.stopPrank();
        vm.expectRevert();
        nft.pause();
    }

    function testRevert_UnpauseNonOwner() public {
        nft.pause();
        vm.stopPrank();
        vm.expectRevert();
        nft.unpause();
    }

    function testRevert_MintWhenPaused() public {
        nft.pause();
        vm.expectRevert();
        nft.safeMint("ipfs://test");
    }
}
