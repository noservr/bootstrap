#!/usr/bin/env bash
#
set -e

# Enable truly non interactive apt-get installs
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y install git-core
apt-get -y install curl

# Chef client Ombnibus installer
curl -L http://www.opscode.com/chef/install.sh | bash
export PATH="/opt/chef/embedded/bin:$PATH"

git clone git://github.com/noservr/bootstrap.git
cd bootstrap

gem install librarian --no-ri --no-rdoc
librarian-chef install

gem install soloist   --no-ri --no-rdoc
soloist

