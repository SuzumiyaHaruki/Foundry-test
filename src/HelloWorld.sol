pragma solidity ^0.8.13;

contract HelloWorld{
    string public message;
    address public owner;

    constructor(){
        message = "Hello World";
        owner = msg.sender;
    }

    modifier onlyOwner() {
         _onlyOwner();
         _;
    }
 
    function _onlyOwner() internal view{
        require(msg.sender == owner, "Only owner can set!");
    }

    event messageChange(string oldMessage, string newMessage);

    function changeMessage(string memory _message) public onlyOwner{
        string memory oldMessage = message;
        message = string.concat("Hello ", _message);
        emit messageChange(oldMessage, message);
    }
}