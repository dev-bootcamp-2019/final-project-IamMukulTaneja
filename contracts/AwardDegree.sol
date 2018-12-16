pragma solidity >=0.4.22 <0.6.0;

contract AwardDegree{
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    event degreeAwarded(uint enrollmentNum);
    event degreeVerifiedorNot(bool isVerfied);
    event degreeRevoked(uint enrollmentNum,revokedReason reason);
    enum revokedReason{
        Null,
        CriminalCase,
        Fraud,
        Other
        
    }
    struct Degree{
        
        uint enrollmentNum;
        string name;
        uint cgpa;
        string batch;
        string shaHash;
        bool isRevoked;
        revokedReason revokeReason;
    }
    

    mapping(uint=> Degree) enrollToDegree;
    
    function awardDegree(uint _enrollmentNum, string memory _name, uint _cgpa, string memory _batch,string memory shaHash) public
    {
        enrollToDegree[_enrollmentNum] = Degree(_enrollmentNum, _name, _cgpa, _batch, shaHash, false,revokedReason.Null);
        emit degreeAwarded(_enrollmentNum);
    }
    
    function fetchHash(uint _enrollmentNum) view public returns(string memory hash)
    {
       hash =  enrollToDegree[_enrollmentNum].shaHash;
        
    }
    function revokeStatus(uint _enrollmentNum) view public returns(bool status)
    {
        status  = enrollToDegree[_enrollmentNum].isRevoked;
    }
    function revokeDegree(uint _enrollmentNum) public
    {
        require(owner==msg.sender);
        enrollToDegree[_enrollmentNum].isRevoked = true;
        enrollToDegree[_enrollmentNum].revokeReason = revokedReason.Fraud;
        
        emit degreeRevoked(_enrollmentNum,  enrollToDegree[_enrollmentNum].revokeReason);
    }
    
    
    
    
}