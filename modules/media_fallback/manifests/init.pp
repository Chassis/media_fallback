# A Chassis extension to redirect all insecure links to HTTPS.
class media_fallback (
	$config,
) {
	$present_or_absent = $config['media_fallback'] ? {
		/.*/ => 'present',
		default  => 'absent',
	}

	$fallback_host = $config['media_fallback'];

	file { "/etc/nginx/sites-available/${::fqdn}.d/media_fallback":
		ensure  => $present_or_absent,
		content => template( 'media_fallback/fallback.nginx.conf.erb' ),
		notify  => Service[ 'nginx' ],
		# Set up after nginx is enabled.
		require => File[ "/etc/nginx/sites-available/${::fqdn}.d" ],
	}
}
