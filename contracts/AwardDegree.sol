pragma solidity 0.4.24;

import "./Owned.sol";
import "./Pausable.sol";

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
    
    
    function awardDegree(string _enrollmentNum,string _ipfsHash, string _shaHash) external onlyOwner whenNotPaused
    {
        require(bytes(_enrollmentNum).length!=0);
        require(bytes(_ipfsHash).length!=0 && bytes(_shaHash).length!=0);
        degreeMapping[_enrollmentNum] = Degree(_ipfsHash,_shaHash, false,true,revokedReason.Null);
        emit degreeAwarded(_enrollmentNum);
    }
    function isDegree(string _enrollmentNum) public view returns(bool)
    {
        return degreeMapping[_enrollmentNum].isValue;
    }
    function fetchIpfsHash(string _enrollNum) external view whenNotPaused returns(string) {
        require(bytes(_enrollNum).length!=0 && isDegree(_enrollNum));
        require(degreeMapping[_enrollNum].isRevoked!=true,"Degree is already revoked");
        return degreeMapping[_enrollNum].ipfsHash;

    }
    function fetchShaHash(string _enrollNum) external view whenNotPaused returns(string) {
        require(bytes(_enrollNum).length!=0 && isDegree(_enrollNum));
        require(degreeMapping[_enrollNum].isRevoked!=true,"Degree is already revoked");
        return degreeMapping[_enrollNum].shaHash;

    }
    function revokedStatus(string _enrollmentNum) public view returns(bool status,uint8 _revokedReason)
    {
        require(isDegree(_enrollmentNum));
        status = degreeMapping[_enrollmentNum].isRevoked;
        _revokedReason = uint8(degreeMapping[_enrollmentNum].revokeReason);
    }
    function revokeDegree(string _enrollmentNum,uint8 _reason) external whenNotPaused onlyOwner
    {
        require(isDegree(_enrollmentNum));
        degreeMapping[_enrollmentNum].isRevoked = true;
        degreeMapping[_enrollmentNum].revokeReason = revokedReason(_reason);
        
        emit degreeRevoked(_enrollmentNum, degreeMapping[_enrollmentNum].revokeReason);
    }
    
}