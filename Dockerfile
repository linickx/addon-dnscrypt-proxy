ARG BUILD_FROM
FROM $BUILD_FROM

# Install
RUN apk update \
    && apk add dnscrypt-proxy tzdata

# Enable the Server Listeners
RUN sed -i "s|listen_addresses = \['127.0.0.1:53'\]|#listen_addresses = ['127.0.0.1:53']|" /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN sed -i "\|listen_addresses = \['127.0.0.1:53'\]|a listen_addresses = ['0.0.0.0:53']" /etc/dnscrypt-proxy/dnscrypt-proxy.toml

# Send query logs to the console
RUN sed -i "\|file = '/var/log/dnscrypt-proxy/query.log'|a file = '/dev/stdout'" /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN sed -i "s|log_files_max_size = 10|#log_files_max_size = 10|" /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN sed -i "\|log_files_max_size = 10|a log_files_max_size = 0" /etc/dnscrypt-proxy/dnscrypt-proxy.toml

# RFC1918 reverse lookups blocked from upstream...
COPY blocked-names.txt /etc/dnscrypt-proxy/blocked-names.txt
RUN sed -i "s|# blocked_names_file = '/etc/dnscrypt-proxy/blocked-names.txt'|blocked_names_file = '/etc/dnscrypt-proxy/blocked-names.txt'|" /etc/dnscrypt-proxy/dnscrypt-proxy.toml

# copy in our entrypoint script
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]