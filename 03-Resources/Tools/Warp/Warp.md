# Warp Terminal

Warp is a modern, Rust-based terminal with AI features and a focus on speed and developer productivity.

## Troubleshooting

### "Failed to create surface for any enabled backend" Error on Linux

This error typically occurs on Linux systems when there's an issue with the graphics drivers or the rendering backend (Vulkan/OpenGL).

### Final Diagnosis: Success on Debian, Incompatible on Arch

After extensive troubleshooting, it has been determined that Warp Terminal's compatibility on systems with Intel 3rd Generation "Ivy Bridge" graphics (e.g., HD Graphics 4000) **depends on the Linux distribution**.

-   **Debian-based Systems (e.g., Ubuntu): SUCCESS.** The combination of installing `mesa-vulkan-drivers` and forcing the OpenGL backend with `WGPU_BACKEND=gl warp-terminal` is a confirmed working solution.

-   **Arch-based Systems (e.g., Arch Linux): INCOMPATIBLE.** The graphics drivers for this hardware on Arch-based systems are incompatible with Warp's rendering engine. All tested methods, including using the official Warp pacman repository and forcing an OpenGL backend, result in a `Failed to create surface` error.

**Conclusion:** For users with this specific older hardware, the only confirmed path to running Warp Terminal is to use a **Debian-based distribution**.
