FROM busybox:latest
RUN wget -O /usr/bin/tosutil http://tos-tools.tos-cn-beijing.volces.com/linux/amd64/tosutil  \
    && chmod +x /usr/bin/tosutil
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]