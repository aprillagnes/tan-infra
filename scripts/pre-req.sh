echo "change current system limits"
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192

echo "write to persistent"
echo "vm.max_map_count = 524288" >> /etc/sysctl.d/21-docker-sonarqube.conf
echo "fs.file-max = 131072" >> /etc/sysctl.d/21-docker-sonarqube.conf
sed -i 's/root soft nofile 65535/root soft nofile 8192/g' /etc/security/limits.conf
sed -i 's/root hard nofile 65535/root hard nofile 131072/g' /etc/security/limits.conf