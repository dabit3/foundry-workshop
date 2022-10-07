// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import 'src/ERC721.sol';

contract ERC721Test is Test {
    DevconPanda devconPanda;
    address noah = address(0x1);
    address sofia = address(0x2);

    function setUp() public {
      devconPanda = new DevconPanda();
    }

    function testMint() public {
      devconPanda.mint(noah, "testhash");
      address owner_of = devconPanda.ownerOf(0);
      assertEq(noah, owner_of);
    }

    function testTransfer() public {
      devconPanda.mint(noah, "testhash");
      vm.startPrank(noah);
      devconPanda.safeTransferFrom(noah, sofia, 0);

      address ownerOf = devconPanda.ownerOf(0);
      assertEq(sofia, ownerOf);
    }

    function testBalance() public {
      devconPanda.mint(sofia, "testhash");
      devconPanda.mint(sofia, "testhash");
      devconPanda.mint(sofia, "testhash");

      uint balance = devconPanda.balanceOf(sofia);
      assertEq(balance, 3);
    }

}