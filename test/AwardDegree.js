const awardDegree = artifacts.require('AwardDegree.sol');
require("babel-core/register");
require("babel-polyfill");

var Web3 = require("web3");
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));



// Account 0 = Owner
// Award Degree - Enroll Number - 20214803115, IpfsHash -QmWWQSuPMS6aXCbZKpEjPHPUZN2NjB3YrhJTHsV4X3vb2t , 
//shaHash - 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824





contract('AwardDegree', async (accounts) => {

    let awardDegreeVariable;

    before('setup contract for each test', async () => {
        awardDegreeVariable = await awardDegree.new({from:accounts[0]});
        let degreeAwarded = await awardDegreeVariable.awardDegree('20214803115',
        'QmWWQSuPMS6aXCbZKpEjPHPUZN2NjB3YrhJTHsV4X3vb2t',
        '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824',
        {from:accounts[0], gas: 4600000});

    });

    it('should be able to initialize the owner', async () => {
        let owner = await awardDegreeVariable.owner.call();
        assert.equal(owner, accounts[0]);
    });

    it('owner should be able to award degree', async () => {
        let degreeAwarded = await awardDegreeVariable.awardDegree('20214803116',
        'QmWWQSuPMS6aXCbZKpEjPHPUZN2NjB3YrhJTHsV4X3vb2t',
        '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824',
        {from:accounts[0], gas: 4600000});
        let isDegree = await awardDegreeVariable.isDegree.call('20214803116');
        assert.equal(isDegree,true);
    });

    it('should be able to fetch ipfs hash', async () => {
        let ipfsHash = await awardDegreeVariable.fetchIpfsHash.call('20214803115',{gas: 4600000});
        assert.equal(ipfsHash,'QmWWQSuPMS6aXCbZKpEjPHPUZN2NjB3YrhJTHsV4X3vb2t');
    });

    it('should be able to fetch sha hash', async () => {
        let ipfsHash = await awardDegreeVariable.fetchShaHash.call('20214803115', {gas: 4600000});
        assert.equal(ipfsHash,'2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824');
    });

    it('should be able to fetch the revoke status',async () => {
        let [status, value] = await awardDegreeVariable.revokedStatus.call('20214803115',{gas: 4600000});
        assert.equal(status,false);
        assert.equal(value, 0,"Wrong revoked reason");
    });

    it('should be able to revoke degree', async () => {
        let revokeDegree = await awardDegreeVariable.revokeDegree('20214803115',1,{gas: 4600000,from:accounts[0]});
        let [status, value] = await awardDegreeVariable.revokedStatus.call('20214803115',{gas: 4600000});
        assert.equal(status, true);
        assert.equal(value,1,"wrong Revoked Reason");
    });

    it('should be able to see the degree status', async () => {
        var degreeStatus = await awardDegreeVariable.isDegree.call('20214803115');
        assert.equal(degreeStatus,true);
    });
    
    it('should transfer ownership to another user', async () => {
        let transferOwner = await awardDegreeVariable.transferOwnership(accounts[1],{from: accounts[0]});
        let acceptOwnership = await awardDegreeVariable.acceptOwnership({from: accounts[1]});
        assert.equal(await awardDegreeVariable.owner.call(),accounts[1]);
    });

    it('should be able to pause the smart contract', async () => {
        
        try {
            
            let degreeAwarded = await awardDegreeVariable.awardDegree('20214803116',
            'QmWWQSuPMS6aXCbZKpEjPHPUZN2NjB3YrhJTHsV4X3vb2t',
            '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824',
            {from:accounts[1], gas: 4600000});

        } catch(error)
        {
            var error_ = 'VM Exception while processing transaction: revert';
            assert.equal(error.message, error_);
        }
    });
    it('should be able to unpause the smart contract', async () => {
        let pause = await awardDegreeVariable.pause({from:accounts[1]});
        let unpause = await awardDegreeVariable.unpause({from:accounts[1]});
            
            let degreeAwarded = await awardDegreeVariable.awardDegree('20214803117',
            'QmWWQSuPMS6aXCbZKpEjPHPUZN2NjB3YrhJTHsV4X3vb2t',
            '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824',
            {from:accounts[1], gas: 4600000});
            let isDegree = await awardDegreeVariable.isDegree.call('20214803117');
            assert.equal(isDegree,true);

    });







});