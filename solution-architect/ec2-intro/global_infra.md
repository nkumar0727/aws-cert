## aws global infrastructure

[Basics](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/)

A Region is a physical location around the world where we cluster datacentres.

A group of datacentres is an Availability Zone (AZ).
- Each AZ had independent power and security.
- Each AZ in a region is connected via redunant, low latency networks.
- Traffic between AZs is encrypted. Network performance is so good that it can do synchronous
replication between AZs.
- In practice, when you deploy to a region, you create application fault tolerance by deploying
to each AZ.

[Local Zones](https://aws.amazon.com/about-aws/global-infrastructure/localzones/) put services/storage closer to end-users.
- So for things like real-time gaming, simulations, ML, entertainment, etc... use these.
- Is an extnesion of a Region.
- Ex. There are Local Zones in Los Angeles, CA, and are associated w/ us-west-2 (Orgeon). So
  rather than hit the Oregon datacentres, if you're in LA you get faster response time if
  you access the application deployed to an LA Local Zone.

[AWS Wavelength](https://docs.aws.amazon.com/wavelength/latest/developerguide/what-is-wavelength.html)
- Deployment locations where in which deployments embed AWS compute/storage within telecommunications providers' datacenters at the edge of 5G networks.
- Good for very low latencies at the edge (ex. mobile devices)
- App traffic can hit app servers running in Wavelength Zone w/out leaving mobile provider's network (reduces hops ot Internet, takes advantage of 5G)


