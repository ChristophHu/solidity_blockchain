pragma solidity ^0.4.24;

contract Notary {
    struct MyNotary {
        bool isSet;
        address setBy;
        string fileName;
        uint timestamp;
        bytes32 checkSum;
        string comment;
    }
    
    // Zum Hash-Wert wird ein Struct in Form des MyNotary gespeichert.
    mapping (bytes32 => MyNotary) public myMapping;
    event NewEvent(bytes32 _checksum, string _filename, address indexed _setBy);
		
    function addEntry(bytes32 _checksum, string _fileName, string _comment) public 
    {
		require(!myMapping[_checksum].isSet)
		
		myMapping[_checksum].isSet = true;
		myMapping[_checksum].fileName = _fileName;
		myMapping[_checksum].timestamp = now;
		myMapping[_checksum].comment = _comment;
		myMapping[_checksum].setBy = msg.sender;
		
		// Das Event wird benachrichtigt
		emit NewEvent(_checksum, _fileName, msg.sender);
	}
	
	function entrySet(bytes32 _checksum) public view returns(string, uint, string, address) {
		require(myMapping[_checksum].isSet)
		return (myMapping[_checksum].fileName, 
			myMapping[_checksum].timestamp,
			myMapping[_checksum].comment, 
			myMapping[_checksum].setBy);
	}
}