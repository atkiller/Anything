#!/bin/bash

# --- Golu Bot All-in-One Installer ---
# This script will set up the entire environment needed to run the bot.
# It DOES NOT create or modify your ai.py or .env files.

# --- Check for Root/Sudo Permissions ---
if [ "$(id -u)" -ne 0 ]; then
  echo "❌ This script must be run with sudo or as root."
  echo "   Please run it like this: sudo ./setup.sh"
  exit 1
fi

echo "--- Golu Bot Dependency Installer ---"

# --- Step 1: Update System & Install System Packages ---
echo ""
echo "--- Step 1: Updating system and installing essential packages... ---"
apt-get update -y && apt-get upgrade -y
apt-get install -y python3 python3-pip python3-venv ffmpeg libopus-dev build-essential

# --- Step 2: Create requirements.txt File ---
echo ""
echo "--- Step 2: Creating Python requirements file... ---"
cat > requirements.txt << EOL
# This file lists all the Python libraries needed for the Golu Bot.
discord.py-self
yt-dlp
python-dotenv
requests
groq
gTTS
Flask
PyNaCl
EOL
echo "✅ requirements.txt created."

# --- Step 3: Set up Python Virtual Environment and Install Libraries ---
echo ""
echo "--- Step 3: Setting up Python environment and installing libraries... ---"

# Create a virtual environment
python3 -m venv venv

# Activate the environment to install packages into it
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

echo "✅ Python environment is ready."

# --- Final Instructions ---
echo ""
echo "🎉 --- Setup Complete! --- 🎉"
echo ""
echo "Your server is now ready for the Golu Bot."
echo ""
echo "NEXT STEPS:"
echo "1. Create your '.env' file with your secret keys."
echo "   nano .env"
echo ""
echo "2. Create your 'ai.py' file and paste your bot's code into it."
echo "   nano ai.py"
echo ""
echo "3. Activate the environment and run your bot:"
echo "   source venv/bin/activate"
echo "   python3 ai.py"
echo ""
echo "To keep it running 24/7, use a 'screen' session."
echo "----------------------------------------------------"