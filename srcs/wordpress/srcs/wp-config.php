<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$MYSQL_DB_NAME' );

/** MySQL database username */
define( 'DB_USER', 'admin' );
// define( 'DB_USER', '$MYSQL_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', 'toor' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
	define('AUTH_KEY',         '^$h9oLYO7$&#$9Z;0==kf-|d{jC -yD)H-j.tbdETy<+r+Ttvrw& 3*9U:Wdq.> ');
	define('SECURE_AUTH_KEY',  'x:`12xi6N>XF2w>@8o}6|MA^;y5lALHg]`Q)L5G+ Jyt5,X|YH%.C(zSOA14-q|j');
	define('LOGGED_IN_KEY',    'DO5r*p;7/n/[_4.aWuXxw|[h r`]+=-<{eaLTgF[Iw2 &_3,ig+c`V1Vh]9wn]Vb');
	define('NONCE_KEY',        'B~-ZsMWOXj_X4kJ0N).#J)rX7@lf&%z~U3.a<{K2I=(5M)%:YbPl6/A~y`GLDsAZ');
	define('AUTH_SALT',        'N_|DN;T@2|+pb/8R@8o.*?}TB3N|:>e:7/={ -ZXU0|5zJDc:U94+U5i#P=Gw;5E');
	define('SECURE_AUTH_SALT', '_CSz3|+K?dWNm|a9Sx}m G|(R#g{+63%0jtPh- ~]WVv@v2;,$`B|wS0{-Z`&jMo');
	define('LOGGED_IN_SALT',   '|=zr~iY 0+:D,oYm2>Ly~M-A/ 5qz;C&<lS/a5xUv_!0%pZjG4EjdCbz..2.4~78');
	define('NONCE_SALT',       'CB|G8lt-7a8#4uiT+DFf8W5eiv=S}>;io=9p8vHU+M__K#zyc}vxcRh>#998{a@:');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_LOG', '/tmp/wp-errors.log' );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

