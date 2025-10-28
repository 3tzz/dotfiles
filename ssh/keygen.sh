#!/usr/bin/env bash
set -e

# === Configuration ===
EMAIL="default@email.com"
ALIAS="platform_name"

# === Help function ===
usage() {
  echo "Usage: $0 [-e email] [-a output_alias]"
  echo
  echo "  -e email         Email for SSH key (default: $EMAIL)"
  echo "  -a output_alias  Alias for output file (default: $ALIAS)"
  echo "  -h               Show this help message"
  exit 1
}

# === Parse arguments ===
while getopts ":e:a" opt; do
  case ${opt} in
  e) EMAIL="$OPTARG" ;;
  a) ALIAS="$OPTARG" ;;
  h) usage ;;
  \?)
    echo "Invalid option: -$OPTARG" >&2
    usage
    ;;
  :)
    echo "Option -$OPTARG requires an argument." >&2
    usage
    ;;
  esac
done

# === 2. Generate SSH key if not exists ===
KEY_PATH="$HOME/.ssh/id_ed25519_{$ALIAS}"

if [ -f "$KEY_PATH" ]; then
  echo "✅ SSH key already exists at $KEY_PATH"
else
  echo "🔑 Generating new SSH key..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
fi

# === 3. Start SSH agent ===
echo "🚀 Starting SSH agent..."
eval "$(ssh-agent -s)" >/dev/null
ssh-add "$KEY_PATH"

# === 4. Show public key ===
echo
echo "📋 This is your public key:"
echo
cat "${KEY_PATH}.pub"
echo
