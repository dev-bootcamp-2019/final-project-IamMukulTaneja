pragma solidity 0.4.24;

import "./Owned.sol";
import "./Pausable.sol";

/** @title AwardDegree */
contract AwardDegree is Owned, Pausable{

    mapping(string => Degree) private degreeMapping;
    enum revokedReason{
        Null,
        CriminalCase,
        Fraud,
        Other
        
    }
    struct Degree{
        string ipfsHash;
        string shaHash;
        bool isRevoked;
        bool isValue;
        revokedReason revokeReason;
    }
    
    event degreeAwarded(string enrollmentNum);
    event degreeRevoked(string enrollmentNum,revokedReason reason);


    constructor() public Owned(msg.sender) {
    }
    
    /** @dev Award degree to the student
      @param _enrollmentNum Enrollment Number of the student
      @param _ipfsHash IPFS hash of the degree
      @param _shaHash SHA hash of the degree
      */
    function awardDegree(string _enrollmentNum,string _ipfsHash, string _shaHash) external onlyOwner whenNotPaused
    {
        require(bytes(_enrollmentNum).length!=0);
        require(bytes(_ipfsHash).length!=0 && bytes(_shaHash).length!=0);
        degreeMapping[_enrollmentNum] = Degree(_ipfsHash,_shaHash, false,true,revokedReason.Null);
        emit degreeAwarded(_enrollmentNum);
    }

    /** @dev Tells if the degree is awarded for the given enrollment number.
      @param _enrollmentNum Enrollment Number of the student
      @return success True if the degree is present otherwise false.
      */
    function isDegree(string _enrollmentNum) public view returns(bool success)
    {
        return degreeMapping[_enrollmentNum].isValue;
    }

    /** @dev Fetch the IPFS Hash for the given enrollment number.
      @param _enrollNum Enrollment Number of the student
      @return ihash return ipfs hash of the degree
      */
    function fetchIpfsHash(string _enrollNum) external view whenNotPaused returns(string ihash) {
        require(bytes(_enrollNum).length!=0 && isDegree(_enrollNum));
        require(degreeMapping[_enrollNum].isRevoked!=true,"Degree is already revoked");
        return degreeMapping[_enrollNum].ipfsHash;

    }

    /** @dev Fetch the SHA Hash for the given enrollment number.
      @param _enrollNum Enrollment Number of the student
      @return shash return ipfs hash of the degree
      */
    function fetchShaHash(string _enrollNum) external view whenNotPaused returns(string shash) {
        require(bytes(_enrollNum).length!=0 && isDegree(_enrollNum));
        require(degreeMapping[_enrollNum].isRevoked!=true,"Degree is already revoked");
        return degreeMapping[_enrollNum].shaHash;

    }

    /** @dev Return the revoke status of the degree, the degree os revoked or not.
      @param _enrollmentNum Enrollment Number of the student
      @return status Status if it is revoked or not.
      @return _revokedReason The reason of revokation 
      */
    function revokedStatus(string _enrollmentNum) public view returns(bool status,uint8 _revokedReason)
    {
        require(isDegree(_enrollmentNum));
        status = degreeMapping[_enrollmentNum].isRevoked;
        _revokedReason = uint8(degreeMapping[_enrollmentNum].revokeReason);
    }

    /** @dev Revoke the degree
      @param _enrollmentNum Enrollment Number of the student
      @param _reason Reason of revokation
      */
    function revokeDegree(string _enrollmentNum,uint8 _reason) external whenNotPaused onlyOwner
    {
        require(isDegree(_enrollmentNum));
        degreeMapping[_enrollmentNum].isRevoked = true;
        degreeMapping[_enrollmentNum].revokeReason = revokedReason(_reason);
        
        emit degreeRevoked(_enrollmentNum, degreeMapping[_enrollmentNum].revokeReason);
    }
    
}