# Nexum Cloud VPS Client

**[Русский](README.md) · [English](README.en.md)**

> A Windows client connecting your own computer and tools to AI assistants through **Model Context Protocol (MCP)**. Nexum Cloud uses outbound authenticated connectivity, browser-based OAuth and a central access gateway. You don't have to expose inbound ports on your home network.

[![Windows](https://img.shields.io/badge/Windows-x64-0078D4?logo=windows)](#system-requirements)
[![Rust](https://img.shields.io/badge/Rust-client-CE422B?logo=rust)](#distribution-contents)
[![MCP](https://img.shields.io/badge/MCP-remote-28A69A)](https://modelcontextprotocol.io/)
[![Latest release](https://img.shields.io/github/v/release/TheLane/nexum-cloud-vps-client?label=release)](https://github.com/TheLane/nexum-cloud-vps-client/releases/latest)

**[Download latest release](https://github.com/TheLane/nexum-cloud-vps-client/releases/latest)** · **[Sign up / Sign in](https://stage.nexum-mcp.ru/)** · **[Nexum website](https://nexum-mcp.ru/)**

## What is Nexum?

Nexum is a remote AI-to-device infrastructure layer. Rather than tying individual local tools to a single assistant, it gives compatible AI applications an authenticated **remote MCP endpoint** backed by user-owned device agents.

- **Your devices.** Execution happens on your machine through a local client, not inside the marketing website.
- **Outbound networking.** The client establishes the connection; no inbound SSH, RDP or FTP port forwarding is required.
- **Browser-based login.** OAuth / PKCE sign-in; on Windows, saved client OAuth grants are held in Windows Credential Manager.
- **One MCP entry point.** Connect supported AI assistants via HTTPS/MCP with independent OAuth authorization.
- **Account and device boundaries.** The server checks ownership and permitted operations, tracks tool usage and supports revocation.
- **Agent identities.** Each server-issued Agent is separate from legacy Nexum and from other client/server origins.

**Live public service:** [https://stage.nexum-mcp.ru](https://stage.nexum-mcp.ru/) (the public instance still uses the *stage* hostname). MCP endpoint: `https://stage.nexum-mcp.ru/mcp`. The apex `nexum-mcp.ru` currently hosts the product website: **do not substitute it for the VPS server URL** until an explicit migration is announced.

## Windows quick start

1. Open the [latest GitHub Release](https://github.com/TheLane/nexum-cloud-vps-client/releases/latest) and download `NexumCloudVPS-Client-windows-x64.zip`.
2. Verify its SHA-256 against the attached `SHA256SUMS.txt` and ensure the file originated from the official repository.
3. Extract it into a permanent folder, e.g. `C:\NexumCloudVPS`. Do **not** run it directly inside ZIP.
4. Double-click `Connect-Nexum-Cloud-VPS.cmd` to start the client with the VPS server URL.
5. Your browser opens. Register or sign in and approve the connection; keep the terminal open for the persistent outgoing connection.
6. In your supported AI application, connect the MCP URL `https://stage.nexum-mcp.ru/mcp` and complete that application's own OAuth flow.

The command line never needs your account password. For problems, see [Troubleshooting](docs/TROUBLESHOOTING.md).

### Command line

```powershell
.\nexum-cloud-client.exe --server https://stage.nexum-mcp.ru status
.\nexum-cloud-client.exe --server https://stage.nexum-mcp.ru connect
.\nexum-cloud-client.exe --server https://stage.nexum-mcp.ru connect --agent "Workstation"
```

Each `--agent` option requests a distinct Agent identity. Use `--help` and `connect --help` for the authoritative option list. Closing the client stops its active connection; revoking an account grant is a separate action via account management or the supported `--logout` flag.

## Architecture

```text
AI assistant / MCP client
      │ HTTPS + OAuth
      ▼
stage.nexum-mcp.ru — Authz / Gateway / Core
      │ authenticated outbound WSS
      ▼
Nexum Cloud VPS Windows Client
      │
      └── typed local tools on the user's device
```

Nexum is **not** unrestricted remote-desktop access. Available operations depend on the installed version, server policy, device and account permissions, and host environment. Some MCP tools can modify data: review AI requests before approving sensitive actions.

## System requirements

- Windows x64 (this release does not claim macOS or Linux binaries).
- HTTPS/WSS connectivity to `stage.nexum-mcp.ru`, a browser, and a Nexum account.
- An AI application with compatible remote MCP and OAuth support to use the Cloud tools.
- For building: Rust stable / Cargo plus the Windows C++ toolchain and SDK.

## Distribution contents

The public repository contains **the compiled Windows EXE**, a command-file launcher and comprehensive Russian and English documentation. **Nexum Cloud VPS Client source code is not published here.**

Use the [latest GitHub Release](https://github.com/TheLane/nexum-cloud-vps-client/releases/latest) to download the Windows x64 ZIP, standalone EXE and SHA-256 checksum file. An identical verified executable is also stored under [client/](client/).

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Security](docs/SECURITY.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [Русская документация](README.md)
- [Website](https://nexum-mcp.ru/) and [Account registration](https://stage.nexum-mcp.ru/)

## Notes

The project evolves over time; supported tools and features depend on your connected devices and the deployed service. Do not post account tokens, secrets or private files in GitHub issues. Keep a tested client during updates and verify new releases independently. Distribution terms: [LICENSE](LICENSE).
