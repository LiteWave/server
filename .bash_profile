### START-Keychain ###
# Let  re-use ssh-agent and/or gpg-agent between logins
/usr/bin/keychain $HOME/.ssh/id_rsa --quiet
source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###
