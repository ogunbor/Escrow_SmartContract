pragma solidity 0.7.5;

contract Escrow {
    address payer;
    address payable payee;
    address lawyer;
    uint amount;
    
    
    constructor (address _payer, address payable _payee, uint _amount) {
        payer = _payer;
        payee = _payee;
        lawyer = msg.sender;
        amount = _amount;
    }
    
    function deposit() payable public {
        require(msg.sender == payer);
        require(address(this).balance <= amount);
    }
    
    function release() public {
        require(msg.sender == lawyer);
         require(address(this).balance == amount);
         payee.transfer(amount);
    }
    
    function balance() public view returns(uint) {
        return address(payee).balance;
    }
}