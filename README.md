# WordPress On AspNetCore

## Prerequisite: First Setup the Database

1. Install mariadb or mysql
    1. For instance, on macOs with homebrew, use `brew install mariadb`
    2. Otherwise see https://mariadb.com/kb/en/getting-installing-and-upgrading-mariadb/
    3. Run `mysql_secure_installation` script

2. Create the Wordpress database and user
    1. Run the shell script `wordpress-create-database.sh` OR learn enough `mariadb` and `sql` to run the commands in there

3. Configure the Wordpress database and user

    1. Copy `wordpress/wp-config-sample.php` to `wordpress/wp-config.php`
    2. edit `wordpress/wp-config.php` and fill in the database,username,password you chose
    
    NB! `.gitignore` is configured to exclude `wp-config.php`

## How to Run

Start the aspnetCore webserver : `dotnet run -p Server`

First run will be slow whilst it compiles wordpress.

# How to Recreate

1. See [PeachPie get started](https://docs.peachpie.io/get-started/)
2. Install PeachPie templates and create a new server
```
dotnet new -i "Peachpie.Templates::*"
dotnet new web -lang PHP
```
3. Download wordpress e.g. `curl https://wordpress.org/latest.tar.gz | tar xvz`
4. Copy the msbuildproj that the PeachPie template created from the Website directory to your wordpress directory
5. Edit the Solution and the Server project created by the peachpie template to point to the new location
6. Fix compilation errors. I had to remove 2 files to get it to compile, which I did by editing the project file rather than removing the files
7. Add `.UseWebRoot("../wordpress/")` to the Server's HostBuilder in `Program.cs` 
