#!/bin/sh
echo Content-type: text/html
echo

host_address=`host $REMOTE_ADDR 2>&1|grep Name|sed 's/.*: *//'`
#regex to get rid of anything that pops up before it
host=`host $REMOTE_ADDR 2>&1|grep pointer|sed 's/.*pointer //'|sed s/\.$//`

cat <<eof
<!DOCTYPE html>
<html lang="en">
<head>
<title>IBrowser IP, Host and User Agent</title>
</head>
<body>
Your browser is running at IP address: <b>$REMOTE_ADDR</b>
<p>
Your browser is running on hostname: <b>$host</b>
<p>
Your browser identifies as: <b>$HTTP_USER_AGENT</b>
</body>
</html>
eof
