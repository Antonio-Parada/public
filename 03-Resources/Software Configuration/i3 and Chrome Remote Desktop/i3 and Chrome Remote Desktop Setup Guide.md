# i3 and Chrome Remote Desktop Setup Guide

This guide provides step-by-step instructions for configuring [[Google Chrome Remote Desktop]] to attach to an existing [[i3]] window manager session on a Linux system. This allows you to remotely access your local desktop session with all your open applications and windows.

## 1. Create a Session Script for i3

First, you need to inform [[Google Chrome Remote Desktop]] that [[i3]] is your desired desktop environment. This is done by creating a `.chrome-remote-desktop-session` file in your home directory.

Open a terminal and execute the following command:
```bash
echo "exec i3" > ~/.chrome-remote-desktop-session
```

## 2. Patch the Chrome Remote Desktop Script

The core of this setup is to prevent [[Google Chrome Remote Desktop]] from creating a new, separate X session. Instead of manually editing the script, which can be error-prone and may become outdated, we will use a patch script.

The `patch_crd_new.sh` script automates the process of modifying the Chrome Remote Desktop script to attach to your existing i3 session.

**How to use the patch script:**

1.  Open a terminal.
2.  Navigate to the directory where you have the script:
    ```bash
    cd "/home/super/Documents/idian/Resources/Software Configuration/i3 and Chrome Remote Desktop"
    ```
3.  Run the new patch script with `sudo`:
    ```bash
    sudo ./patch_crd_new.sh
    ```

The script will handle backing up the original file, applying the necessary changes, and restarting the service.

## 3. Restart the Service

The `patch_crd_new.sh` script automatically restarts the [[Google Chrome Remote Desktop]] service. If you need to restart it manually for any reason, you can use the following command:

```bash
sudo systemctl restart chrome-remote-desktop@$USER
```
*Note: Remember to replace `$USER` with your username if the variable is not set in your shell.*

## Troubleshooting

*   **Black Screen or Connection Fails:**
    *   **Cause:** The [[Google Chrome Remote Desktop]] service might not have the correct permissions or the script was not patched correctly.
    *   **Solution:** Rerunning the `patch_crd_new.sh` script will ensure the patch is applied correctly. You can also check the service's status for errors: `systemctl status chrome-remote-desktop@$USER`.

*   **No Audio:**
    *   **Cause:** Audio forwarding might not be correctly configured.
    *   **Solution:** This setup focuses on video and input. Audio forwarding is a separate issue that may require additional configuration of PulseAudio or PipeWire.

*   **Authentication Issues:**
    *   **Cause:** Problems with your Google account or the authorization PIN.
    *   **Solution:** Try re-authorizing your computer with a new PIN through the Chrome Remote Desktop web interface.

*   **Connection Fails After Service Restart:**
    *   **Cause:** The Chrome Remote Desktop service may have entered a bad state, or a Chrome Remote Desktop update has overwritten the patch.
    *   **Solution:** Restore the original Chrome Remote Desktop script, restart the service, and then re-apply the patch.
        1.  Restore the original script: `sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop.bak /opt/google/chrome-remote-desktop/chrome-remote-desktop`
        2.  Restart the service: `sudo systemctl restart chrome-remote-desktop@$USER`
        3.  Re-apply the patch: `sudo ./patch_crd_new.sh`
        4.  Restart the service again: `sudo systemctl restart chrome-remote-desktop@$USER`
