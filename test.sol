pragma solidity ^0.4.24;

contract MyContract {
	uint256 myVar
	constructor(uint256 _myVar) public {
		_myVar = myVar;
	}
	function setMyVar(uint256 _myVar) public {
		myVar = _myVar;
	}
	function getMyVar() view public returns(uint256) {
		return myVar;
	}
	function() public {
	    myVar = 2;
	}
}