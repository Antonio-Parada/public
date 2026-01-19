#!/bin/bash

CRD_SCRIPT="/opt/google/chrome-remote-desktop/chrome-remote-desktop"
BACKUP_FILE="/opt/google/chrome-remote-desktop/chrome-remote-desktop.bak"

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# 1. Backup the original script if a backup doesn't already exist
if [ ! -f "$BACKUP_FILE" ]; then
  echo "Backing up the original script to $BACKUP_FILE..."
  sudo cp "$CRD_SCRIPT" "$BACKUP_FILE"
else
  echo "Backup file already exists. Skipping backup."
fi

echo "Modifying the script to attach to the existing display..."

# 2. Replace the launch_session method in XDesktop class
sudo python3 -c '
import sys
with open(sys.argv[1], "r") as f:
  content = f.read()

old_string = """  def launch_session(self, *args, **kwargs):
    logging.info("Launching X server and X session.")
    super(XDesktop, self).launch_session(*args, **kwargs)"""

new_string = """  def launch_session(self, *args, **kwargs):
    logging.info("Attaching to existing X session.")
    self.child_env["DISPLAY"] = ":0" """

new_content = content.replace(old_string, new_string)

with open(sys.argv[1], "w") as f:
  f.write(new_content)
' "$CRD_SCRIPT"

echo "Script modified successfully."

# 3. Restart the service to apply changes
echo "Restarting the chrome-remote-desktop service..."
sudo systemctl restart chrome-remote-desktop@$USER

echo "Done. Your Chrome Remote Desktop should now connect to your existing session."
echo "If you encounter any issues, you can restore the original script from:"
echo "$BACKUP_FILE"
