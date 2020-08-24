FROM docker.pkg.github.com/phaynes/buster-slim-rsync/buster-slim-rsync:latest 

# Add files
ADD host-paths.txt /var/host-paths.txt
ADD file-paths.txt /var/file-paths.txt
ADD run.sh /etc/run.sh
ADD entrypoint.sh /etc/entrypoint.sh
 
RUN chmod +x /etc/run.sh /etc/entrypoint.sh

ENTRYPOINT /etc/entrypoint.sh
