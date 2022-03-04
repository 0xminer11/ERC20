pragma solidity ^0.5.0;
import "./ERC20.sol";


interface Imintable{
    function addMinter(address account) external returns(bool);
    function removeMinter(address account) external returns(bool);
    function isMinter(address account) external view returns(bool);
    function mint(address account,uint ammount) external returns(bool);
}

contract mintable is ERC20{


    modifier onlyminter(address account){
        require(minter[account] =true);
        _;
    }

event minteradded(
    address account,
    bool minter
);

event minterRemoved(
    address account,
    bool minter
);



mapping (address =>bool)public minter;

function mint(address account,uint ammount) public onlyminter(msg.sender) returns(bool) {
        require(account != msg.sender);
        Balance[account] += ammount;
        totalsupply += ammount;
}
function addMinter(address account) public returns(bool){
    minter[account]=true;
    emit minteradded(account,true);
    return (true);
}

function removeMinter(address account) public returns(bool){
    minter[account]=false;
    emit minterRemoved(account,false);
    return(false);
}

function isMinter(address account) public view returns(bool){
    return(minter[account]);
}




}