pragma solidity ^0.8.13;

contract SimpleStorage{
    uint public x;
    address owner;
    string public message;

    constructor(uint _x){
        owner = msg.sender;
        x = _x;
        message = "Hello";
    }

    modifier onlyOwner() {
         _onlyOwner();
         _;
    }
 
    function _onlyOwner() internal view{
        require(msg.sender == owner, "Only owner can set!");
    }


    event changeX(uint oldX, uint newX);
    event changeMessage(string oldMessage, string newMessage);

    function setX(uint _x) public onlyOwner{
        uint old = x;
        x = _x;
        emit changeX(old, x);
    }

    function setMessage(string memory _message)public onlyOwner{
        string memory old = message;
        message = _message;
        emit changeMessage(old, message);
    }
}