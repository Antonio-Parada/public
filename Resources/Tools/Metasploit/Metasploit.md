# Metasploit

The Metasploit Framework is a powerful open-source penetration testing platform. It provides a vast collection of tools, exploits, and payloads for assessing security vulnerabilities.

## Key Components

*   **msfconsole:** The primary command-line interface for the framework.
*   **Exploits:** Code that takes advantage of a specific vulnerability.
*   **Payloads:** Code that runs on the target system after an exploit is successful (e.g., a reverse shell).
*   **Auxiliary Modules:** Modules for scanning, fuzzing, and other actions that are not direct exploits.

## Basic Workflow

1.  **Select an exploit:** `use exploit/<target>/<vulnerability>`
2.  **Set options:** `set RHOSTS <target_ip>`, `set LHOST <local_ip>`
3.  **Set a payload:** `set payload <payload_type>`
4.  **Run the exploit:** `exploit` or `run`

## Cross-References

*   [[Cybersecurity]]
*   [[Nmap]]
