# OneStopVerification

[![Hit-Counter](http://hits.dwyl.io/IamMukulTaneja/OneStopVerification.svg)](http://hits.dwyl.io/IamMukulTaneja/OneStopVerification) 
[![GitHub contributors](https://img.shields.io/github/contributors/Naereen/StrapDown.js.svg)](https://gitHub.com/IamMukulTaneja/OneStopVerification)  [![made-with-ethereum](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
There are many cases of fraud in showing the forged/wrong college degree to the employer for
getting a job. So to avoid that employers need to go to the university to personally verify the
degree and it takes days and weeks and most importantly company’s resources to the do that
work. So to avoid this we tried to use the power of immutable ledger to save the college degree
in it and making a system for the employer to easily verify the college degree of the candidate in
seconds.

Who needs verification of educational background:
1. Universities
2. Colleges
3. Companies for hiring process.
4. Companies/NGOs /Government who gives fellowship/scholarships to students on basis
of their education.
The scope of my application is particularly focused on institutes and companies that recruit
students. Colleges and universities usually call every student for documents verification before
confirming admission. Companies have a full-fledged panel to verify the documents. Both the
processes are very time consuming. This application is to help them save time and money and
also ensures 100 percent true verification.

Architecture
![selection_014](https://user-images.githubusercontent.com/20643833/50051543-8efa2580-013a-11e9-977c-8a9a03f9b96f.png)

![selection_015](https://user-images.githubusercontent.com/20643833/50051564-e5676400-013a-11e9-9ac8-f3f46b872c1a.png)

# WORKING
## Issuing Process
● The issuer will notify the student to share their blockchain address so that they can make
the transaction on the blockchain to ensure that student has completed this course.
● Student sends their blockchain address.
● Issuer take the hash (SHA-256) of the pdf file of the degree.
● Now it will make the transaction and includes the hash of the pdf and the digital
signature.
● It will propagate through the blockchain network and get included in the immutable
ledger.
## Verification Process
● Student will send its degree as digital document and his/her blockchain address.
● Verifier will take the SHA-256 hash of the document.
● Verifier will extract all the transactions happened against this particular address and
compare the output hash with the local hash.
● If they are equal, then it goes to next step and if not verification is failed.
● Now it checks if the digital signature is of the same university, if it is then degree is
verified and if it is not then verification is failed.

# Conclusion
Blockchain is not the world savior or it will not curb poverty. But if we use the power of
blockchain wisely it can impact the business and society in a most wonderful way you can
expect. I would like to mention the impact our project will create when it will get implemented in
real world: -
● Shortens the verification time of the college degree from 2-3 days to 10 minutes.
● The money employer has to spend by going to the university for the physical verification
or outsourcing the verification process cuts nearly to zero.
● Resources which an organization has to put solely on the verification process, after this
project is minimized.
What i feel is the end product of any project or idea must be impactful and the impact which
our project can make excites me to implement this in future.
# final-project-IamMukulTaneja
