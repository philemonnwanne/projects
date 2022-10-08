Given the following IP address/CIDR: **193.16.20.35/29**

- what is the Network IP
- number of hosts
- range of IP addresses
- broadcast IP from this subnet

## [Subnet Verification Link](https://www.calculator.net/ip-subnet-calculator.html) click me!


#### Procedure:

To solve this you have to first figure out the subnet mask from the given CIDR (/29)

> Note:
Th CIDR indicates the total number of active bits (1's) which also indicates the network portion of the IP address while the 0's indicate the host portion of the network.

Converting it to binary then gives:

**Network Portion:** 1's

**Host Portion:** 0's

Netmask Binary: **11111111.11111111.11111111.11111000**

<sub>Then inorder to convert the subnet mask address from binary to decimal apply the following formular:</sub>

> Note: In the binary system there are only 1s and 0s. Depending on their position in the octet, they get different values. Each position is a power of 2. To get the decimal number you have to sum up those numbers.

| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|  2^<sup>7</sup> | 2^<sup>6</sup>  | 2^<sup>5</sup>  | 2^<sup>4</sup>  | 2^<sup>3</sup> | 2^<sup>2</sup>  | 2^<sup>1</sup>  | 2^<sup>0</sup>  |
| 128  | 64  | 32  | 16  | 8  | 4  | 2  | 1  |

Total no. of octets in binary: 128 + 64 + 32 + 16 + 8 + 4 + 2 + 1

                             = 255



### First Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 128  | 64  | 32  | 16  | 8  | 4  | 2  | 1  |
| 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |

Total: **255**

### Second Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 128  | 64  | 32  | 16  | 8  | 4  | 2  | 1  |
| 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |

Total: **255**

### Third Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 128  | 64  | 32  | 16  | 8  | 4  | 2  | 1  |
| 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |

Total: **255**

### Fourth Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 128  | 64  | 32  | 16  | 8  | 4  | 2  | 1  |
| 1  | 1  | 1  | 1  | 0  | 0  | 0  | 0  |

Total: **248**

Octet Sum = **255.255.255.248**

Therefore: **11111111.11111111.11111111.11111000** in binary = **255.255.255.248**

## Next is to find the wild card:

Wild card = subtract the **subnet mask** from **255.255.255.255**

          = 255.255.255.255 - 255.255.255.248
          
          = 255 - 248
          
          = 7
          
.<sup>.</sup>. Wild card = **0.0.0.7**

### Next is to find the network ID:

**Where** 

Subnet Mask = **11111111.11111111.11111111.11111000**

Given IP = **11000001.00010000.00010100.00100011**

To find the **network ID**, simply do binary **and** operation between the **given IP address** and the **subnet mask**:

### First Octet:
> Binary and operation between **(255 & 193)** or **(11111111 & 11000001)**

| N/A  | First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Subnet Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
**Given IP** | 1  | 1  | 0  | 0  | 0  | 0  | 0  | 1  |
**Result** | 1  | 1  | 0  | 0  | 0  | 0  | 0  | 1  |

Total Sum = **193**

### Second Octet:
> Binary and operation between **(255 & 16)** or **(11111111 & 00010000)**

| N/A  | First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Subnet Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
**Given IP** | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  |
**Result** | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  |

Total Sum = **16**

### Third Octet:
> Binary and operation between **(255 & 20)** or **(11111111 & 00010100)**

| N/A  | First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Subnet Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
**Given IP** | 0  | 0  | 0  | 1  | 0  | 1  | 0  | 0  |
**Result** | 0  | 0  | 0  | 1  | 0  | 1  | 0  | 0  |

Total Sum = **20**

### Fourth Octet:
> Binary and operation between **(248 & 35)** or **(11111000 & 00100011)**

| N/A  | First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Subnet Mask** | 1  | 1  | 1  | 1  | 1  | 0  | 0  | 0  |
**Given IP** | 0  | 0  | 1  | 0  | 0  | 0  | 1  | 1  |
**Result** | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 0  |

Total Sum = **32**

.<sup>.</sup>. network IP address = **193.16.20.32**


## Next is to find the number of hosts:

Number of Hosts = 2^<sup>n</sup> - 2

Where **n** = number of host bits minus two

            = number of host bits - 2

This is because the first and last IP addresses are always reserved for the network and broadcast ID's respectively

> Note 
In this case we have to count the number of host's bits (0's) in the subnet mask binary starting from the right, which will give a total of **3**

Number of hosts = 2^<sup>3</sup> - 2

                = 8 - 2
                
                = 6
                
From the details above we can then calculate the range of IP addresses and the broadcast:

> Note 
The **first & last IP adress** will be reserved for the network and broadcast so:


Given IP: **193.16.20.35/29**

Network IP: **193.16.20.32**

Number of Hosts: **6**

Range of IP Addresses: **193.16.20.33** - **193.16.20.38**
 
- min range of IP's = **193.16.20.33**
 - max range of IP's = **193.16.20.38**

Broadcast IP: **193.16.20.39**
