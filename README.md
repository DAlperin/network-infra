# AS400743

AS400743 is my personal project to learn more about networking and also ultimately to enable me to announce tunnel ipv6 to my appartment. 

## Current setup
- AS400743
- `2620:AD:6000::/48`
- One router (debian box) announcing the 48 via vultr in NY (`bgp-ny-252e51f1-0a0a-5a4a-b225-78edbc78ad65`)
- One router (debian box) announcing the 48 via vultr in Toronto (`bgp-yto-62f8b336-79ce-dec2-0d4f-6f365004a882`)

## Next steps
- Setup a wg tunnel between the NY and YYZ routers (this step isn't totally clear to me, but I think there should be some kind of peering session between these two routers(?))
- Setup a router in my house, wireguard tunnel to routers
- Assign my house a /64 and announce it from the router in my house to my edges
- profit
