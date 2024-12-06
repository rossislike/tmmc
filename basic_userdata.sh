#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Get the IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Background the curl requests
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
wait

macid=$(cat /tmp/macid)
local_ipv4=$(cat /tmp/local_ipv4)
az=$(cat /tmp/az)
vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
  <title>Details for EC2 instance</title>
</head>
<body>
  <div>
    <h1>Class 6</h1>
    <h1>Cyber Bullies</h1>
    <br>
    <img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExank3M2RoeWVseHdsdDRnamY2MWxleHIzd2RjdnYxMTF2emN1YXU3aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/1edh6WkirOBmARrjua/giphy.webp" alt="Malgus_Seoul" width="400" height="400">
    <br>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private IP Address:</b> $local_ipv4</p>
    <p><b>Availability Zone:</b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
  </div>
</body>
</html>
EOF


