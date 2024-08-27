#!/bin/bash

# Verify the installation and check the Python version
python --version
cd /home/trevor/vscode/csa_blog
# Create a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python -m venv venv
fi
# Activate the virtual environment
source venv/bin/activate
echo 'venv activated'
# Install the required Python packages
# pip install -r requirements.txt