## Phase 12: Remote TV Command (ADB + Scrcpy)

**Objective:** Configure the Android TV to accept remote commands and screen mirroring over the Tailscale VPN, allowing you to fix issues or install apps from anywhere.

### 12.1 Enable "Network Debugging" on TV
Before you can sideload anything, you need to unlock the door.

1.  **Developer Options:**
    * Go to **Settings > Device Preferences > About**.
    * Scroll down to **Build Number** and click it **7 times** rapidly.
    * *Toast message: "You are now a developer!"*

2.  **Enable Debugging:**
    * Go to **Settings > Device Preferences > Developer Options**.
    * Turn on **USB Debugging**.
    * Turn on **Network Debugging** (This is crucial; it opens port 5555).

### 12.2 Sideload Tailscale (The "Initial Injection")
Since you are physically with the TV right now, use the PICOS laptop to push the Tailscale app over the local Wi-Fi.

1.  **Install ADB on Laptop:**
    ```bash
    apt install android-tools-adb -y
    ```

2.  **Download Tailscale APK:**
    On the laptop, download the latest "Tailscale for Android" APK (usually `arm64-v8a`).
    ```bash
    wget -O tailscale.apk [https://github.com/tailscale/tailscale-android/releases/latest/download/Tailscale-android-latest.apk](https://github.com/tailscale/tailscale-android/releases/latest/download/Tailscale-android-latest.apk)
    # (Check URL for exact latest release link or download on PC and SCP it over)
    ```

3.  **Connect & Install:**
    * Find TV IP (in Network Settings, e.g., `10.10.20.50`).
    * Connect: `adb connect 10.10.20.50`
    * *Check TV Screen:* A popup will ask to "Allow USB Debugging". Check "Always allow" and click OK.
    * Install: `adb install tailscale.apk`

4.  **Setup Tailscale on TV:**
    * Launch the app on the TV.
    * Log in (Scan the QR code with your phone).
    * **CRITICAL:** In the TV app settings, ensure **"Run as Exit Node"** is optional, but make sure the app is active.

### 12.3 The "Remote Control" Setup (Scrcpy)
Now that Tailscale is running on the TV, it has a `100.x.y.z` IP address. You can control it from anywhere.

**Tool:** `scrcpy` (Screen Copy). It mirrors the Android display to your Linux window manager.

1.  **Install Scrcpy on Laptop:**
    ```bash
    apt install scrcpy -y
    ```

2.  **The "Remote" Workflow:**
    * *Scenario:* You are at a coffee shop using Tailscale on your laptop.
    * **Connect:**
        ```bash
        adb connect 100.x.y.z:5555
        # (Replace 100.x.y.z with the TV's Tailscale IP)
        ```
    * **View & Control:**
        ```bash
        scrcpy --max-size 1024 --bit-rate 2M --keyboard=uhid
        ```
        * `--max-size/--bit-rate`: Lowers quality for smoother remote performance.
        * `--keyboard=uhid`: Simulates a physical keyboard so you can type passwords on the TV.

### 12.4 Useful ADB Commands (The "Fix-It" Kit)
If you don't need the screen and just want to issue commands via SSH:

* **Reboot TV:** `adb reboot`
* **Install App:** `adb install app.apk`
* **Type Text (Paste):** `adb shell input text 'YourLongPassword'`
* **Open URL:** `adb shell am start -a android.intent.action.VIEW -d "https://proxmox.yourdomain.com"`
* **Kill App:** `adb shell am force-stop com.netflix.ninja`
