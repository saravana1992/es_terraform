#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "deb http://packages.cloud.google.com/apt google-cloud-monitoring-$(lsb_release -sc)-all main" > /etc/apt/sources.list.d/google-cloud-monitoring.list
echo "deb http://packages.cloud.google.com/apt google-cloud-logging-$(lsb_release -sc)-all main" > /etc/apt/sources.list.d/google-cloud-logging.list
curl --connect-timeout 5 -s -f "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | apt-key add -
apt-get -qq update
apt-get -y -q install stackdriver-agent google-fluentd google-fluentd-catch-all-config
apt-get clean
rm -Rf /var/lib/apt/lists/*
