pragma solidity 0.4.24;
import "./Owned.sol";
contract Pausable is Owned {
    event Pause();
    event Unpause();

    bool public paused = false;

    modifier whenNotPaused() {
      require(!paused);
      _;
    }

    modifier whenPaused() {
      require(paused);
      _;
    }
    /** @dev Pause the smart contract
      */
    function pause() public onlyOwner whenNotPaused  {
      paused = true;
      emit Pause();
    }
    /** @dev Unpause the smart contract
      */
    function unpause() public onlyOwner whenPaused  {
      paused = false;
      emit Unpause();
    }
}