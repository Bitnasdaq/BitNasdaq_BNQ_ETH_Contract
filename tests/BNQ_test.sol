// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "../contracts/BNQ.sol";

contract BNQTest is BNQ {

    function testTokenInitialValues() public {
        Assert.equal(name(), "BitNasdaq", "token name did not match");
        Assert.equal(symbol(), "BNQ", "token symbol did not match");
        Assert.equal(uint256(decimals()), 8, "token decimals did not match");
        Assert.equal(totalSupply(), 10000000000000000000, "token supply should be zero");
    }
    function testTransfer() public {
        address to = TestsAccounts.getAccount(1);
        Assert.notEqual(msg.sender, to, "from equal to");
        uint256 bal = balanceOf(to);
        uint256 amount = 100;
        transfer(to, amount);
        Assert.equal(balanceOf(to), bal+amount, "transfer error");
    }
    function testApprove() public {
        address to = TestsAccounts.getAccount(1);
        Assert.notEqual(msg.sender, to, "from equal to");
        uint256 alc = allowance(msg.sender, to);
        uint256 amount = 1000;
        approve(to, amount);
        Assert.equal(allowance(msg.sender, to), alc+amount, "approve error");
    }
}