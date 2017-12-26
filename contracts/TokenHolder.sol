pragma solidity ^0.4.18;

import "./ERC20Interface.sol";

contract TokenHolder is ERC20Interface {
	string public constant name = "Distibute Token";
	string public constant symbol = "DisT";
	uint8 public constant decimals = 0;

	uint256 _totalSupply = 1000000;

	address public owner;

	mapping (address => uint256) balances;

	mapping (address => mapping (address => uint256)) allowed;

	function TokenHolder() public {
		owner = msg.sender;
		balances[owner] = _totalSupply;
	}


	function totalSupply() public constant returns (uint256 totalSupply) {
		totalSupply = _totalSupply;
		return totalSupply;
	}

	function balanceOf(address _owner) public constant returns (uint256 balance) {
		return balances[_owner];
	}

	function transfer(address sender, address _to, uint256 _value) returns (bool success) {
		if(balances[sender] >= _value && _value > 0 && balances[_to] + _value >= balances[_to]) { 
			balances[sender] -= _value;
			balances[_to] += _value;
			Transfer(sender, _to, _value);
			return true;
		}
		else {
			return false;
		}
	}

	function transferFrom(address _from, address _to, uint256 _value, address sender) returns (bool success) {
		if(balances[_from] >= _value && balances[_to] + _value >= balances[_to] && allowed[_from][sender] >= _value) { 
			balances[_from] -= _value;
			balances[_to] += _value;
			Transfer(_from, _to, _value);
			return true;
		}
		else {
			return false;
		}
	}

	function approve(address sender, address _spender, uint256 _value) returns (bool success) {
		allowed[sender][_spender] = _value;
		Approval(sender, _spender, _value);
		return true;
	}

	function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}

	function emision(address sender, uint256 _value) returns (bool) {
		require(sender == owner);
		balances[owner] += _value;
		_totalSupply += _value;
		return true;
	}
	event Transfer(address indexed _from, address indexed _to, uint256 _value);
	event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}