
# Design Pattern Opted

## Pausable Smart Contract

I have opted for the 'Pausable' design pattern in my smart contract. 

Pausable smart contract is :-

1. Where the owner can pause that contract and the functions which are marked "whenNotPaused" can't be executed in that phase by any other person or the owner.
2. Owner can unpause the contract and it will work normally.



The reasons of choosing this approach are :-
1. As the smart contract is owned by university and the two functions awardDegree() and revokeDegree() are only changing the states, it is needed to make them stop if any bug persists.
2. So for that, university can pause the smart contract and those two functions will not work until university unpause it.
