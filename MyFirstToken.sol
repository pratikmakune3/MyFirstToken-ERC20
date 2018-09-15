pragma solidity ^0.4.0;

import "browser/ERC20.sol";

contract MyFirstToken is ERC20 {
    
    string public constant symbol = "MFT";
    string public constant name = "MyFirstToken";
    uint8 public constant decimals = 18;
    
    uint constant __totalSupply = 1000;
    mapping(address => uint) balance;
    mapping(address => mapping(address => uint)) allowances;
    
    function totalSupply() constant returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
        // return _totalSupply;
    }
    
    function balanceOf(address addr) constant returns (uint _balance) {
        return balance[addr];
    }
    
    function transfer(address _to, uint _value) returns (bool success) {
        if(_value <= balanceOf(msg.sender)){
            balance[msg.sender] -= _value;
            balance[_to] += _value;
            return true;
        }else{
            return false;
        }
    }
    
    function transferFrom(address _from, address _to, uint _value) returns (bool success) {
        if(allowances[_from][_to] >= _value){
            if(transfer(_to, _value)){
                allowances[_from][_to] -= _value;
                return true;    
            }else{
                return false;    
            }    
        }
        return false;
    }
    
    function approve(address _spender, uint _value) returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        return true;
    }
    
    function allowance(address _owner, address _spender) constant returns(uint remaining) {
        return allowances[_owner][_spender];
    }
    
}