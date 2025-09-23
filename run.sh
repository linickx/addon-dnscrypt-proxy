#!/usr/bin/with-contenv bashio

# If /config/dnscrypt-proxy.toml does not exist, copy it from /etc/dnscrypt-proxy/dnscrypt-proxy.toml
if [ ! -f /config/dnscrypt-proxy.toml ]; then
    echo "👉🏼 Writing default config to dnscrypt-proxy.toml"
	cp /etc/dnscrypt-proxy/dnscrypt-proxy.toml /config/dnscrypt-proxy.toml
fi
echo "✨ Starting dnscrypt-proxy..."
/usr/bin/dnscrypt-proxy -config /config/dnscrypt-proxy.toml