# Media Fallback (Work In Progress)

*Not yet ready for production.*

This [Chassis extension](https://docs.chassis.io/en/latest/extend/) adds an [Nginx](https://www.nginx.com/) rule within your Chassis virtual machine to fall back to production URLs for any local media request which fails with a "404 not found" error. This allows you to run a fully functional virtual machine with a much smaller backup of the `uploads/` folder than would normally be necessary, because any image which is not available locally within the VM can then be requested from the live site instead.

## Usage

1. Clone this into the `extensions` folder of your Chassis installation, or list `chassis/fall_back_to_prod_media` in your [Chassis configuration file's extensions list](https://docs.chassis.io/en/latest/config/#extensions).
2. Run `vagrant up` if you have not yet initialized your virtual machine, or `vagrant provision` if your VM is already up and running.

A request to an image path within your VM that 404s should not attempt to retrieve that image from production.
