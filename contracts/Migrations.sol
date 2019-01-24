pragma solidity 0.4.24;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
    owner = msg.sender;
  }

  /** @dev set the complete keyword
      @param completed Complete keyword
   */
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
  /** @dev Upgrade smart contract
      @param _new_address Address of new smart contract
      */
  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
