# Scapy

Scapy is a powerful Python-based interactive packet manipulation program and library. It can forge or decode packets of a wide number of protocols, send them on the wire, capture them, match requests and replies, and much more.

## Key Features

*   **Packet Crafting:** Create custom packets from scratch.
*   **Packet Sniffing:** Capture and analyze network traffic.
*   **Protocol Support:** Supports a wide range of network protocols.
*   **Automation:** Can be used in scripts to automate networking tasks.

## Basic Usage

```python
from scapy.all import sr1, IP, ICMP

# Craft an ICMP echo request packet
packet = IP(dst="www.google.com")/ICMP()

# Send the packet and receive a single response
response = sr1(packet, timeout=2)

if response:
    response.show()
```

## Cross-References

*   [[Python]]
*   [[Cybersecurity]]
