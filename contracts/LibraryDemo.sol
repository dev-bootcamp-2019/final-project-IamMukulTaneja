pragma solidity 0.4.24;

import "./SafeMath.sol";


contract LibraryDemo {

using SafeMath for uint256;

uint256 public resultSum;
uint256 public resultSub;
 
    function SafeAdd(uint256 a, uint256 b) public {
      resultSum = 0;
      resultSum = a.add(b);
    }
     function SafeSub(uint256 a, uint256 b) public {
      resultSub = 0;
      resultSub = a.sub(b);
    }




}

