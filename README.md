# OneStopVerification (Final-Project-IamMukulTaneja)

[![Hit-Counter](http://hits.dwyl.io/IamMukulTaneja/OneStopVerification.svg)](http://hits.dwyl.io/IamMukulTaneja/OneStopVerification) 
[![GitHub contributors](https://img.shields.io/github/contributors/Naereen/StrapDown.js.svg)](https://gitHub.com/IamMukulTaneja/OneStopVerification)  [![made-with-ethereum](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# Problem I am trying to solve

There are many cases of fraud in showing the forged/wrong college degree to the employer for
getting a job. So to avoid that, employers need to go to the university to personally verify the
degree and it takes days and weeks and most importantly company’s resources to the do that
work.

Who needs verification of educational background:
1. Universities
2. Colleges
3. Companies for hiring process.
4. Companies/NGOs /Government who gives fellowship/scholarships to students on basis
of their education.

We need some kind of 'TRUSTED' platform where the people or organization who needs to verify the college degree of the student can just go there and verify the degree in no time.

# Solution I am trying to build

Where the concept of 'trust' comes like in this case we need a 'trusted' platform, we can use the immutablity feature of blockchain to achieve the proof of existence of the college degree.

The scope of my application is particularly focused on institutes and companies that recruit
students. Colleges and universities usually call every student for documents verification before
confirming admission. Companies have a full-fledged panel to verify the documents. Both the
processes are very time consuming. This application is to help them save time and money and
also ensures 100 percent true verification.

## Technologies used

### Backend
- Node.js with express framework
- Truffle 
- Ethereum smart contract in solidity

### Frontend
- Ejs 

### Tools
1. IPFS(InterPlanetary File System)

## What does the process looks like ?

### Issuing Process
1. Univeristy will have the degree(digital format) of the student.
2. It will take the SHA256(Secure hash function) of the degree.(lets name it shaHash).
3. After that, it will encrypt the degree using Advance Encrytion Standard(AES).It will get the common private key from that.
4. It will save the ecrypted degree to the IPFS and get the hash from it.(lets name it ipfsHash).
5. Now it will call the function awardDegree() of the smart contract and save the new struct which will contain ipfsHash,shaHash and revoking information against the univeristy enrollment number(UEN) of the student on the blockchain.
6. Now it will give the credentials to the student to sign-in into the platform and also it will share the unique AES key with the student.
7. Credentials will be attached to the particular univeristy enrollment number(UEN) which a student can't change.

### Degree fetching process
1. Now following from the above process, student have now the credentials needed to login on the platform and also the unique AES key to decrypt the degree.
2. Now, the student will login to the platform, enter the AES key to get the digital format of the degree.
3. in background, the platform (our code) will fetch the ipfs hash by calling the fetchIpfsHash() function of the smart contract by giving the enrollment number(attached to the user credentials).
4. Then, it will fetch the encryted degree from IPFS and decrypt it using the AES key provided by student and make the decrypted degree available to the student.
5. Student will download the degree.

### Verification Process
1. Student will send its digital degree which he just got from our platform to the verifier.
2. Verifier will upload the degree to our platform and enter the UEN of the student.
3. Our platform will fetch the sha256 hash of the degree which is saved against the provided UEN on the blockchain. It will call the fetchShaHash() function of the smart contract.
4. Then it will take a local SHA256 hash of the uploaded degree and match the local and original hash.
5. If the hash matches then degree is verified otherwise not.

### Revoking Process
There is a feature where a university can revoke the degree of the student.

1. Univeristy (owner of the smart contract) can call the revokeDegree() function of the smart contract to revoke a degee. It has to submit the UEN and revoke reason with it.
2. Student and verifier can see the revoked status by calling the revokedStatus() function.



# Conclusion
Blockchain is not the world savior or it will not curb poverty. But if we use the power of
blockchain wisely it can impact the business and society in a most wonderful way you can
expect. I would like to mention the impact my project will create when it will get implemented in
real world: -
1. Shortens the verification time of the college degree from 2-3 days to 10 minutes.
2. The money employer has to spend by going to the university for the physical verification
or outsourcing the verification process cuts nearly to zero.
3. Resources which an organization has to put solely on the verification process, after this
project is minimized.
What i feel is the end product of any project or idea must be impactful and the impact which
our project can make excites me to implement this in future.


# Deployment Steps

## Server
1. I have not made the UI and server yet. I focused on making a smart contract only and testing it as much as i can.
2. I am learning server side languages and will complete this project as soon as possible.


## Testing
1. I assume that you have ganache running on port 8545.
2. Go to the main project directory from the terminal and enter command "bash test.sh".
3. You will see that it will compile the contracts, migrate it to the environment and start testing the smart contract against the test written.
4. It will give results at the end.

