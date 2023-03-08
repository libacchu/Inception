-- Create a new database for the WordPress site
CREATE DATABASE my_wp_database;

-- Create a new user for the WordPress site
CREATE USER 'my_wp_user'@'localhost' IDENTIFIED BY 'my_wp_password';

-- Grant permissions to the user for the new database
GRANT ALL PRIVILEGES ON my_wp_database.* TO 'my_wp_user'@'localhost';

-- Flush the privileges to ensure they take effect
FLUSH PRIVILEGES;