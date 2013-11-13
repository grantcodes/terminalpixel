---
title: Installing WP-CLI on webfaction
date: 2013/11/13
published: true
---

I have recently been getting into [WP-CLI](http://wp-cli.org) and wanted to install it on my [webfaction hosting account](http://www.webfaction.com/signup?affiliate=terminalpixl) but ran into a few hurdles.
READMORE

## Installing composer

Apparently you can't just install WP-CLI using the one line install provided because webfactions default php version is lower that 5.3.2.

But webfaction does have php 5.4 available under the `php54` command. So this means you can install it manually. Luckily I found [a good guide on how to do it](http://community.webfaction.com/questions/9839/installation-of-php-composer-for-package-management-fails#9851). The basics are:

``` bash
git clone https://github.com/composer/composer.git
cd composer
php54 ../composer.phar install
find ./bin -type f -executable | xargs sed -i 's/env php$/env php54/g'
```

## Installing WP-CLI

Now that composer is up and running it is pretty straightforward to install WP-CLI:

1. First navigate back to your home directory
2. Download the installer: `wget https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh`
3. Edit the installer and modify the php variable by adding `WP_CLI_PHP=php54` before `mkdir -p "$INSTALL_DIR"` (Line 49 at this point in time)
4. Run the installer: `sh installer.sh`
5. Add the completions and path to your `.bash_profile` file:

``` bash
PATH=/home/user/.wp-cli/bin:$PATH
export WP_CLI_PHP=php54
source $HOME/.wp-cli/vendor/wp-cli/utils/wp-completion.bash
export PATH
```

And your done!