# Media Fallback

This [Chassis extension](https://docs.chassis.io/en/latest/extend/) adds an [Nginx](https://www.nginx.com/) rule within your Chassis virtual machine to fall back to production URLs for any local media request which fails with a "404 not found" error. This allows you to run a fully functional virtual machine with a much smaller backup of the `uploads/` folder than would normally be necessary, because any image which is not available locally within the VM can then be requested from a live site instead.

## Usage

1. Clone this into the `extensions` folder of your Chassis installation, or list `chassis/media_fallback` in your [Chassis configuration file's extensions list](https://docs.chassis.io/en/latest/config/#extensions).
2. Add a `media_fallback:` key to your configuration file specifying the URI for a deployed environment's content folder (example below).
3. Run `vagrant up` if you have not yet initialized your virtual machine, or `vagrant provision` if your VM is already up and running.

A request to an image path within your VM that 404s should now attempt to retrieve that image from production (or staging, etcetera, depending on configuration).

## Example Configuration

The value of the `media_fallback` key should always be the path to a content folder within a deployed site.

Assuming you are creating a local environment for the website `https://example.com`, which uses the standard WordPress directory path `wp-content`, you may enable your VM to fall back to this site with the following configuration:

```yaml
# config.local.yaml

media_fallback: 'https://example.com/wp-content'
```
