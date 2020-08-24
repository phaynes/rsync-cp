docker run -v /root/file-paths.txt:/var/file-paths.txt -v /root/host-paths.txt:/var/host-paths.txt -v /root/.ssh:/root/.ssh -v /root/in:/root/in -v /root/out:/root/out -d rsync-cp
