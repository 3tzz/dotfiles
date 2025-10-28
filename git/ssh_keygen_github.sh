#!/usr/bin/env bash
set -e

# === Configuration ===
GITHUB_USER="mygithubuser"
REPO_NAME="myrepositoryname"
EMAIL="default@email.com"
ALIAS="github"
BASE_DIR=$(dirname "$(realpath "$0")")

# === Help function ===
usage() {
  echo "Usage: $0 [-u github_user] [-r repo_name] [-e email] [-a alias]"
  echo
  echo "  -u github_user   GitHub username (default: $GITHUB_USER)"
  echo "  -r repo_name     Repository name (default: $REPO_NAME)"
  echo "  -e email         Email for SSH key (default: $EMAIL)"
  echo "  -a output_alias  Alias for output file (default: $ALIAS)"
  echo "  -h               Show this help message"
  exit 1
}

# === Parse arguments ===
while getopts ":u:r:e:a:h" opt; do
  case ${opt} in
  u) GITHUB_USER="$OPTARG" ;;
  r) REPO_NAME="$OPTARG" ;;
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

# === 1. Switch Git remote to SSH ===
echo "🔄 Switching remote URL to SSH..."
git remote set-url origin git@github.com:${GITHUB_USER}/${REPO_NAME}.git || {
  echo "❌ Failed to set remote URL. Make sure you're in the correct repo."
  exit 1
}

# Generate SSH key
./"$BASE_DIR/../ssh/keygen.sh"

# === 4. Show public key ===
echo "📋 Copy the previous public key and add it to GitHub:"
echo "👉 https://github.com/settings/keys"
echo
echo "✅ Once added, test with: ssh -T git@github.com"
