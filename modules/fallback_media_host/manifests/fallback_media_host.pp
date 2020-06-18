# A Chassis extension to redirect all insecure links to HTTPS.
class fallback_media_host (
	$fallbackMediaHost,
) {
	$present_or_absent = $fallbackMediaHost ? {
		/http.*/ => 'present',
		default  => 'absent',
	}
	# Configure nginx.
	file { "/etc/nginx/sites-available/${::fqdn}.d/fallback_media_host":
		ensure  => $present_or_absent,
		content => template( 'fallback_media_host/fallback.nginx.conf.erb' ),
		notify  => Service[ 'nginx' ],
		# Set up after nginx is enabled.
		require => File[ "/etc/nginx/sites-available/${::fqdn}.d" ],
	}
}
