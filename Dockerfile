FROM busybox:latest
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"
RUN wget -O /usr/bin/tosutil http://tos-tools.tos-cn-beijing.volces.com/linux/amd64/tosutil  \
    && chmod +x /usr/bin/tosutil
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]