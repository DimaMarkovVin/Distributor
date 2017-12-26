pragma solidity ^0.4.18;

import "./TokenHolder.sol";

contract Distributor {


	function transfer(address coinContractAddress, address sender, address to, uint value) returns (bool) {
		TokenHolder t = TokenHolder(coinContractAddress);
		t.transfer(sender, to, value);
		return true;
	}

	function balanceOf(address coinContractAddress, address owner) constant returns (uint256 res) {
		TokenHolder t = TokenHolder(coinContractAddress);
		res = t.balanceOf(owner);
		return res;
	}

	function totalSupply(address coinContractAddress) constant returns (uint256 res) {
		TokenHolder t = TokenHolder(coinContractAddress);
		res = t.totalSupply();
		return res;
	}

	function transferFrom(address coinContractAddress,address from, address to, uint value)returns (bool) {
		TokenHolder t = TokenHolder(coinContractAddress);
		t.transferFrom(from, to, value, msg.sender);
		return true;
	}

	function approve(address coinContractAddress,address sender, address spender, uint value) returns (bool) {
		TokenHolder t = TokenHolder(coinContractAddress);
		t.approve(sender, spender, value);
		return true;
	}

	function allowance(address coinContractAddress, address owner, address spender) constant returns (uint res) {
		TokenHolder t = TokenHolder(coinContractAddress);
		res = t.allowance(owner,spender);
		return res;
	}

	function emision(address coinContractAddress, uint256 value) returns (bool) {
		TokenHolder t = TokenHolder(coinContractAddress);
		t.emision(msg.sender, value);
		return true;
	}
}