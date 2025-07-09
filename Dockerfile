FROM ubuntu:22.04

# Install QEMU and VNC
RUN apt-get update && \
    apt-get install -y qemu-system-x86 qemu-utils net-tools \
    xvfb x11vnc fluxbox wget && \
    apt-get clean

# Create a working directory
WORKDIR /vm

# Copy disk and ISO files into the image
COPY win2003.qcow2 .
COPY win2003.iso .

# Expose VNC port and optional RDP or others
EXPOSE 5900

# Run QEMU to boot from the ISO and install
CMD qemu-system-i386 \
    -m 1024 \
    -cpu pentium3 \
    -hda win2003.qcow2 \
    -cdrom win2003.iso \
    -boot d \
    -vnc :0 \
    -net nic \
    -net user
