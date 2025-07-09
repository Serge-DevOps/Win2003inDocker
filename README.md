# Windows Server 2003 running in a container
Running Windows Server 2003 standard 32 bit in a container. It's a nested virtualization where Docker behaves as a wrapper and you expose only VNC port, so you can connect to the VM.

1. **Windows Server 2003 ISO**  
    You’ll need an ISO — name it something like `win2003.iso`. Place it in your working directory.
	https://archive.org/details/en_windows_server_2003_standard
	https://www.microsoft.com/en-gb/download/details.aspx?id=21700
2. **Create a QEMU Disk Image**
	Download qemu-img.exe https://cloudbase.it/qemu-img-windows/ in a zip folder. Unzip it and open `cmd` from this folder. Execute following command:
    `qemu-img create -f qcow2 win2003.qcow2 30G`
    This creates a 30GB virtual hard drive that Windows will install onto.
