#!/bin/bash
echo ""
echo "/******************************************************/"
echo "/*               WATTOUAT PROJECT AGENT               */"
echo -e "/******************************************************/\n"

sleep 2

# Install requierements
bash requierement.sh

# Create directory for Wattouat Agent
mkdir /bin/wattouat_agent 

# Up Service
cp wattouat_agent.service /etc/systemd/system/
cp wattouat_agent_service.sh /bin/wattouat_agent
chmod +x /bin/wattouat_agent/wattouat_agent_service.sh

# Function
cp -R fonction /bin/wattouat_agent/

bash /bin/wattouat_agent/fonction/mysql/node_info.sh
bash /bin/wattouat_agent/fonction/mysql/cpu.sh

# Config file

cp wattouat_agent.conf /bin/wattouat_agent/
cp cpu_proc.txt /bin/wattouat_agent/

echo ""
echo "/******************************************************/"
echo "/*                       Finish                        */"
echo -e "/******************************************************/\n"
