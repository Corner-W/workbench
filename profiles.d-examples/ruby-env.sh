# Try load ChefDK if installed, or else rbenv if installed
if [[ -x /opt/chefdk/bin/chef ]]; then
    eval "$(/opt/chefdk/bin/chef shell-init bash)"
elif which rbenv > /dev/null 2>&1; then
    eval "$(rbenv init -)"
fi
