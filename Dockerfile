FROM docker.pkg.github.com/phaynes/buster-slim-rsync/buster-slim-rsync:latest 

# Add files
ADD host-paths.txt /var/host-paths.txt
ADD file-paths.txt /var/file-paths.txt
ADD run.sh /etc/run.sh
ADD entrypoint.sh /etc/entrypoint.sh
ADD up_nodes.txt /var/up_nodes.txt
ADD down_nodes.txt /var/down_nodes.txt
RUN chmod +x /etc/run.sh /etc/entrypoint.sh

ENTRYPOINT /etc/entrypoint.sh
