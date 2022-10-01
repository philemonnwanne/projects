## [Subnet Verification Link](https://www.calculator.net/ip-subnet-calculator.html) click me!


#### Procedure:

To solve this I had to first figure out the netmask from the given CIDR (/29)

> Note:
Th CIDR indicates the total number of active bits (1's) which also indicate the network portion of the IP address
Converting it to binary then gives:

**Network Portion:** 1's

**Host Portion:** 0's

Netmask Binary: **11111111.11111111.11111111.11110000**

<sub>Then inorder to convert the netmask address from binary to decimal I applied the following formular:</sub>

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

Therefore: **11111111.11111111.11111111.11110000** in binary = **255.255.255.248**

## Next is to find the wild card:

Wild card = **Total no. of active bits** - **Net mask**

          = 255 - 284
          
          = 7
          
.<sup>.</sup>. Wild card = **0.0.0.7**

### Next is to find the network ID:

**Where** 

Net Mask = **11111111.11111111.11111111.11110000**

Given IP = **11000001.00011111.00010100.00100011**

To find the **network ID**, we haveto subtract the **given IP adress** in binary form from the **net mask** also in binary which will give:

### First Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Net Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
**Given IP** | 1  | 1  | 1  | 1  | 0  | 0  | 0  | 1  |
**Result** | 1  | 1  | 0  | 0  | 0  | 0  | 0  | 1  |

Total Sum = **193**

### Second Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Net Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
**Given IP** | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  |
**Result** | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  |

Total Sum = **16**

### Third Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Net Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
**Given IP** | 0  | 0  | 0  | 1  | 0  | 1  | 0  | 0  |
**Result** | 0  | 0  | 0  | 1  | 0  | 1  | 0  | 0  |

Total Sum = **20**

### Third Octet:
| First Octet  | Second Octet | Third Octet | Fourth Octet | Fifth Octet | Sixth Octet | Seventh Octet | Eight Octet |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
**Net Mask** | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  |
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
In this case we have to count the number of host's bits (0's) in the net mask binary starting from the right, which will give a total of **3**

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
