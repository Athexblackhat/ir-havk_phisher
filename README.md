<!-- IR-HAVK PHISHER README -->
<!-- Created by ATHEX BLACK HAT -->

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=40&duration=3000&pause=1000&color=00FF00&center=true&vCenter=true&width=600&lines=IR-HAVK+PHISHER;Advanced+Phishing+Tool;65%2B+Templates;Cross+Platform;CTF+Ready" alt="Typing SVG" />
</p>

<p align="center">
  <a href="https://github.com/Athexblackhat/ir-havk_phisher">
    <img src="https://img.shields.io/badge/Version-2.0-brightgreen?style=for-the-badge&logo=github" alt="Version">
  </a>
  <a href="https://www.python.org/">
    <img src="https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python" alt="Python">
  </a>
  <a href="https://www.php.net/">
    <img src="https://img.shields.io/badge/PHP-8.x-purple?style=for-the-badge&logo=php" alt="PHP">
  </a>
  <a href="https://www.linux.org/">
    <img src="https://img.shields.io/badge/Linux-Supported-orange?style=for-the-badge&logo=linux" alt="Linux">
  </a>
  <a href="https://www.microsoft.com/windows">
    <img src="https://img.shields.io/badge/Windows-Supported-blue?style=for-the-badge&logo=windows" alt="Windows">
  </a>
  <a href="https://www.apple.com/macos/">
    <img src="https://img.shields.io/badge/macOS-Supported-silver?style=for-the-badge&logo=apple" alt="macOS">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge&logo=opensourceinitiative" alt="License">
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/Athexblackhat/ir-havk_phisher?style=social" alt="Stars">
  <img src="https://img.shields.io/github/forks/Athexblackhat/ir-havk_phisher?style=social" alt="Forks">
  <img src="https://img.shields.io/github/watchers/Athexblackhat/ir-havk_phisher?style=social" alt="Watchers">
</p>

<br/>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=IR-HAVK%20PHISHER&fontSize=80&fontAlignY=35&animation=fadeIn" alt="Header"/>
</p>

---

<div align="center">

# ⚡ IR-HAVK PHISHER ⚡

### *The Ultimate Phishing Tool for Security Professionals & CTF Enthusiasts*

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=600&size=25&duration=4000&pause=1000&color=FF0000&center=true&vCenter=true&repeat=true&width=500&lines=65%2B+Phishing+Templates;100%25+Self-Contained;No+External+Dependencies;Cross-Platform+Support;Automated+Setup+Script)](https://git.io/typing-svg)

</div>

---

## 📊 Project Overview

```mermaid
graph TD
    A[IR-HAVK PHISHER] --> B[Setup Script]
    A --> C[Main Application]
    A --> D[Templates]
    
    B --> B1[Dependency Check]
    B --> B2[File Verification]
    B --> B3[Auto Installation]
    B --> B4[Interactive Launch]
    
    C --> C1[PHP Server]
    C --> C2[NGROK Tunnel]
    C --> C3[URL Masking]
    C --> C4[Credential Capture]
    
    D --> D1[Social Media]
    D --> D2[Email Services]
    D --> D3[Gaming Platforms]
    D --> D4[Banking/Finance]
    D --> D5[Streaming Services]
    D --> D6[Custom Templates]
    
    style A fill:#00ff00,stroke:#333,stroke-width:4px
    style B fill:#ff6b6b,stroke:#333,stroke-width:2px
    style C fill:#4ecdc4,stroke:#333,stroke-width:2px
    style D fill:#ffe66d,stroke:#333,stroke-width:2px
```

## 🎯 Features
```mermaid
mindmap
  root((IR-HAVK PHISHER))
    Templates
      65+ Ready Templates
      Custom Template Support
      Auto-Extraction
      Local Storage
    Networking
      PHP Server
      NGROK Tunneling
      URL Masking
      Port Customization
    Security
      IP Logging
      User-Agent Capture
      Timestamp Recording
      Anti-Detection
    Platform
      Linux Support
      Windows Support
      macOS Support
      Termux Support
    Setup
      Auto Installer
      Dependency Check
      File Verification
      One-Click Launch
```

## 🏗️ Architecture

```mermaid
graph LR
    subgraph "User Interface"
        A[Terminal/CLI]
    end
    
    subgraph "Core Engine"
        B[Python Script]
        C[PHP Server]
        D[NGROK Client]
    end
    
    subgraph "Templates"
        E[Static Files]
        F[PHP Backend]
        G[Logging System]
    end
    
    subgraph "External"
        H[Victim Browser]
        I[Tunnel Service]
    end
    
    A --> B
    B --> C
    B --> D
    C --> F
    F --> G
    D --> I
    I --> H
    H --> C
    
    style A fill:#ff6b6b
    style B fill:#4ecdc4
    style C fill:#ffe66d
    style D fill:#a8e6cf
```

## 🚀 Quick Start

```mermaid
sequenceDiagram
    participant U as User
    participant S as Setup Script
    participant C as Core Application
    participant V as Victim
    
    U->>S: Run setup.sh
    S->>S: Check Dependencies
    S->>S: Install Missing Packages
    S->>S: Verify File Structure
    S->>U: Show Main Menu
    U->>S: Choose Launch Option
    S->>C: Execute ir-havk.py
    C->>C: Start PHP Server
    C->>C: Initialize NGROK
    C->>U: Display Phishing URL
    U->>V: Send Phishing Link
    V->>C: Enter Credentials
    C->>U: Capture & Display Data
```

## 📦 Installation
```
git clone https://github.com/Athexblackhat/ir-havk_phisher.git

cd ir-havk_phisher

chmod +x setup.sh
```
## Run the automated setup
```
./setup.sh
```

## Manual SetUp
```
git clone https://github.com/Athexblackhat/ir-havk_phisher.git

cd ir-havk_phisher

sudo apt update && sudo apt install -y php curl wget unzip git

python3 ir-havk.py
```

## 🎮 Available Templates
```mermaid
graph LR
    subgraph "Social Media"
        A1[Facebook]
        A2[Instagram]
        A3[Twitter/X]
        A4[LinkedIn]
        A5[Snapchat]
        A6[TikTok]
    end
    
    subgraph "Email"
        B1[Gmail]
        B2[Outlook]
        B3[Yahoo]
        B4[ProtonMail]
        B5[Yandex]
    end
    
    subgraph "Gaming"
        C1[Steam]
        C2[PlayStation]
        C3[Xbox]
        C4[Discord]
        C5[Roblox]
        C6[PUBG]
    end
    
    subgraph "Streaming"
        D1[Netflix]
        D2[Spotify]
        D3[Twitch]
        D4[YouTube]
    end
    
    subgraph "Finance"
        E1[PayPal]
        E2[Amazon]
        E3[Ebay]
        E4[Crypto]
    end
```    
## 🔧 Configuration
Port Configuration

### Default port 8080
python3 ir-havk.py

### Custom port
python3 ir-havk.py -p 8888

### With template selection
python3 ir-havk.py -p 8080 -o 1
Template Customization
Edit files/templates.json to add custom templates:

json
{
    "name": "Your Template",
    "choice": "99",
    "folder": "custom_folder",
    "mask": "https://your-mask-url.com"
}
## Workflow
```mermaid
stateDiagram-v2
    [*] --> Setup
    Setup --> CheckingDependencies
    CheckingDependencies --> InstallingPackages: Missing
    CheckingDependencies --> VerifyingFiles: All Present
    InstallingPackages --> VerifyingFiles
    VerifyingFiles --> Ready: All Files OK
    VerifyingFiles --> Error: Files Missing
    Ready --> Launching
    Error --> [*]
    Launching --> ServerRunning
    ServerRunning --> TunnelActive
    TunnelActive --> WaitingForVictim
    WaitingForVictim --> CapturingData: Victim Enters Credentials
    CapturingData --> DisplayingResults
    DisplayingResults --> WaitingForVictim
    WaitingForVictim --> [*]: User Exits
```    

## 🌐 Cross-Platform Support
```mermaid
graph TD
    OS[Operating Systems] --> Linux
    OS --> Windows
    OS --> macOS
    OS --> Termux
    
    Linux --> Kali[Kali Linux]
    Linux --> Ubuntu[Ubuntu]
    Linux --> Debian[Debian]
    Linux --> Arch[Arch Linux]
    
    Windows --> Win10[Windows 10]
    Windows --> Win11[Windows 11]
    
    macOS --> Ventura[Ventura]
    macOS --> Sonoma[Sonoma]
    
    Termux --> Android[Android]
    
    style OS fill:#00ff00,stroke:#333,stroke-width:3px
    style Linux fill:#ff6b6b
    style Windows fill:#4ecdc4
    style macOS fill:#ffe66d
    style Termux fill:#a8e6cf
```    

## 🔄 Update Process
```mermaid
flowchart TD
    A[Check for Updates] --> B{New Version?}
    B -->|Yes| C[Download Update]
    B -->|No| D[Continue Current]
    C --> E[Backup Current]
    E --> F[Install New Version]
    F --> G[Verify Installation]
    G --> H[Restart Application]
    D --> I[Running Latest]
    
    style A fill:#4ecdc4
    style B fill:#ffe66d
    style C fill:#ff6b6b
    style H fill:#00ff00
```    

## [!CAUTION]
The developer is not responsible for any misuse of this tool. Use at your own risk and only on systems you own or have explicit permission to test.

<div align="center">
💖 Support This Project
<p> <a href="https://github.com/Athexblackhat/ir-havk_phisher"> <img src="https://img.shields.io/badge/⭐_Star-This_Repo-yellow?style=for-the-badge" alt="Star"> </a> <a href="https://github.com/Athexblackhat/ir-havk_phisher/fork"> <img src="https://img.shields.io/badge/🍴_Fork-This_Repo-blue?style=for-the-badge" alt="Fork"> </a> <a href="https://github.com/Athexblackhat/ir-havk_phisher/issues"> <img src="https://img.shields.io/badge/🐛_Report-Bug-red?style=for-the-badge" alt="Bug"> </a> </p>
Made with ❤️ by ATHEX BLACK HAT
<p> <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&height=100&section=footer" alt="Footer"/> </p></div> ```


