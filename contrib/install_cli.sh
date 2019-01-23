 #!/usr/bin/env bash

 # Execute this file to install the raptoreum cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Raptoreum-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Raptoreum-Qt.app/Contents/MacOS/raptoreumd /usr/local/bin/raptoreumd
 sudo ln -s ${LOCATION}/Raptoreum-Qt.app/Contents/MacOS/raptoreum-cli /usr/local/bin/raptoreum-cli
