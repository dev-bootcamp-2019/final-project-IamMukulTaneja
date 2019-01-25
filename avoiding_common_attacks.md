# Common attacks and its countermeasures

## Reentrancy

As I am not transferring any ether or calling any external smart contract, reentrancy attack is not possible.

## Timestamp Dependence

As I have not used block.timestamp or now, there is no scope of timestamp dependence.


#Integer Overflow/underflow

I have used uint256 everywhere where I needed integer and at one place where I used uint8, in that options will only be 0,1,2 and 3.So there will be no scope of overflow/underflow.