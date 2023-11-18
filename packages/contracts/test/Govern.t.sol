// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import "forge-std/Test.sol";
import {MudTest} from "@latticexyz/world/test/MudTest.t.sol";
import {getKeysWithValue} from "@latticexyz/world-modules/src/modules/keyswithvalue/getKeysWithValue.sol";
import {IWorld} from "../src/codegen/world/IWorld.sol";
import {System} from "@latticexyz/world/src/System.sol";
import {Config, ConfigData} from "../src/codegen/index.sol";
import {Player, PlayerData} from "../src/codegen/index.sol";
import {PlayerStatus} from "../src/codegen/common.sol";
import {Game, GameData} from "../src/codegen/index.sol";
import {IWorld} from "src/codegen/world/IWorld.sol";

import {MockBurn} from "src/mock/MockBurn.sol";
import {ROOT_NAMESPACE_ID} from "@latticexyz/world/src/constants.sol";

contract GovernTest is MudTest {
    function testRegister() public {
        MockBurn bs = new MockBurn();

        // IWorld(worldAddress).transferOwnership(ROOT_NAMESPACE_ID, worldAddress);
        IWorld(worldAddress).executeProposal("BurnSystem", address(bs));

        assertEq(MockBurn(worldAddress).burn(), uint256(keccak256(abi.encodePacked("mock burn"))));
    }
}