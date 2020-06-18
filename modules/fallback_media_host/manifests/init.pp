# A Chassis extension to redirect all insecure links to HTTPS.
class fallback_media_host (
	$config,
) {
	if $config["fallbackMediaHost"] {
		# Configure nginx.
		file { "/etc/nginx/sites-available/${::fqdn}.d/fallback_media_host":
			ensure  => 'present',
			content => template( 'fallback_media_host/fallback.nginx.conf.erb' ),
			notify  => Service[ 'nginx' ],
			# Set up after nginx is enabled.
			require => File[ "/etc/nginx/sites-available/${::fqdn}.d" ],
		}
	}
}
