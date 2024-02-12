# Test infra

## Requirements

- [Docker](https://www.docker.com/) properly installed and running.
- [Docker Compose V2](https://docs.docker.com/compose/)
- A target [Debian](https://www.debian.org/)-based server up and running.
  For simplification this code was tested in a QEMU virtual machine in local
  but any properly configured server should also work.


## How to setup the VM

This step will vary depending on your operating system, but should be similar to:

- Get libvirt packages for your OS:

```sh
apt libvirt-clients libvirt-daemon-system
```

NOTE: You should carefully follow instructions and configure properly in order
to be able to run virtual machines in your computer.

- Get a QEMU image for your desired OS, for example, here you have some
  instructions for Debian: [link](https://wiki.debian.org/QEMU).

- Get or create a XML file with specification for your VM.
  See: [link](https://libvirt.org/formatdomain.html)

- Define the Domain for your VM using libvirt:

```sh
virsh define my_virtual_machine.xml
```

- Ensure the defined network is up and running:

```sh
virsh net-list --all
```

In case it's not up and running:

```sh
virsh net-start my_defined_network
```

- Start the Virtual Machine:

```sh
virsh start my_beautiful_debian_vm_image
```

## How to run the playbooks

### Setup SSH connection

This code enables you to propagate your ssh-configuration to the provided
scripts/containers in order to ease the management of the target server.

In case you would need to identify yourself with a private ssh key to the
server, you should first add it to your ssh-agent:

```sh
ssh-add my_private_rsa_key
```

### Prepare environment

Set ANSIBLE_HOST envvar with the target virtual machine IP. For example:

```sh
export ANSIBLE_HOST="1.2.3.4"
```

(OPTIONAL) You can also the user for connecting to the VM. If not changed it
will consider "root" as the connecting username.

```sh
export ANSIBLE_USER="foo"
```

### Deploy the services
Just execute:

```sh
make deploy
```

Or, alternatively, with just a single command:

```sh
ANSIBLE_HOST="1.2.3.4" make deploy
```

And you should be able to reach target's ip at port 80 and see the
frontend application returning the hour coming from the backend.
