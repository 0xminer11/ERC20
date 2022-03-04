pragma solidity ^0.5.0;
import "./ERC20.sol";

interface Iburnable  {
    function burn(uint ammount) external returns(bool);
    function burnFrom(address account,uint ammount) external returns(bool);
}

contract burnable is ERC20{
    function burn(uint ammount) public returns(bool){
    require(Balance[msg.sender]>=ammount);
    Balance[msg.sender] -= ammount;
    totalsupply -= ammount;
    }
    function burnFrom(address account,uint ammount) public returns(bool){
    require(ammount <= Balance[account]);
    Balance[account] -= ammount;
    totalsupply -= ammount;
}
}