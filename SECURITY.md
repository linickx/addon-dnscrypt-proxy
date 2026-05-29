# Security

## 📩 Contact

To report a security issue, contact me via my website [linickx.com](https://www.linickx.com) or Mastodon [@linickx@infosec.exchange](https://infosec.exchange/@linickx)

## 🔎 Software Bill of Materials

For transparency of the Docker Image contents, and SBOM is now attached to new releases.

## 🔒AppArmor

This ~Addon~ APP implements an AppArmor security profile (`apparmor.txt`) to restrict system access and provide defense-in-depth.

The AppArmor profile tries to enforce strict security policies on the dnscrypt-proxy service. The profile restricts dangerous capabilities (like `sys_admin`, `sys_ptrace`, `setpcap`), limits file access to necessary configuration and cache directories, and enforces network isolation to only IPv4 and Unix domain sockets. This provides defense-in-depth protection against potential exploits.
