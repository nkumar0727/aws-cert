# aws iam

[Identity and Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

Principal - person/app that uses AWS account root user, IAM user, or IAM role to make requests to AWS

Request - principal request includes
- actions
- resources which action is performed on
- principal that used an entity to send request
- policies associated with the entity that the principle used

Authentication - who is the principal in context of AWS?
- console usage
  - root user provides email/password
  - IAM user provides accountId/alias and username/password
- API/CLI usage
  - provide access key/secret key

Authorization - is the principal allowed to complete the request?
- use request values to determine which policies apply to request
- use policies to determine 'allow'/'deny'
  - Identity-Based Policy
  - Resource-Based Policy
  
Actions
Resources - user, group, role, policy, identity provider
Identities - user, group, role
Entities - IAM users, federated users, assumed IAM roles
