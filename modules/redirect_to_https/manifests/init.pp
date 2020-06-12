# A Chassis extension to redirect all insecure links to HTTPS.
class redirect_to_https (
	$config,
) {
	# Configure nginx.
	file { "/etc/nginx/sites-available/${::fqdn}.d/redirect_to_https":
		ensure  => 'present',
		content => template( 'redirect_to_https/redirect.nginx.conf.erb' ),
		notify  => Service[ 'nginx' ],
		# Set up after nginx is enabled.
		require => File[ "/etc/nginx/sites-available/${::fqdn}.d" ],
	}
}
