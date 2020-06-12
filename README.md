# Redirect to HTTPS

This [Chassis extension](https://docs.chassis.io/en/latest/extend/) adds an [Nginx](https://www.nginx.com/) rule to redirect unsecured `http` URLs to their `https` equivalent.

It is designed to be used in conjunction with the ["chassis_openssl" extension](https://github.com/Chassis/chassis_openssl), which adds SSL support to your Chassis box.

## Usage

1. Clone this into the `extensions` folder of your Chassis installation, or list `redirect_to_https` in your [Chassis configuration file's extensions list](https://docs.chassis.io/en/latest/config/#extensions).
2. Run `vagrant up` if you have not yet initialized your virtual machine, or `vagrant provision` if your VM is already up and running.

All URLs within your virtual environment should now redirect from `http` to `https`.
