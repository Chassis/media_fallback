# A Chassis extension to redirect all insecure links to HTTPS.
class media_fallback (
	$config,
) {
	# $present_or_absent = $config['fallback_media_host'] ? {
	# 	/http.*/ => 'present',
	# 	default  => 'absent',
	# }

	notify { "Config: ${config['media_fallback']}": }

	$config['media_fallback'].each |String $vm_host, String $fallback_host| {
		# Build a simpler form of the object key to use in the nginx conf filename.
		$host_slug = regsubst( regsubst( $vm_host, 'https?://', '' ), '\W+', '_', 'G' );

		file { "/etc/nginx/sites-available/${::fqdn}.d/${host_slug}_media_fallback":
			ensure  => 'present',
			content => template( 'media_fallback/fallback.nginx.conf.erb' ),
			notify  => Service[ 'nginx' ],
			# Set up after nginx is enabled.
			require => File[ "/etc/nginx/sites-available/${::fqdn}.d" ],
		}
	}

	# # Configure nginx.
	# file { "/etc/nginx/sites-available/${::fqdn}.d/fallback_media_host":
	# 	ensure  => 'present',
	# 	content => template( 'fallback_media_host/fallback.nginx.conf.erb', {
	# 		'fallbackMediaHost' => $config['fallback_media_host']
	# 	} ),
	# 	notify  => Service[ 'nginx' ],
	# 	# Set up after nginx is enabled.
	# 	require => File[ "/etc/nginx/sites-available/${::fqdn}.d" ],
	# }
}
