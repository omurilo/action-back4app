#!/bin/bash
TMP_FILE=/tmp/back4app.tmp
if [ -e ${TMP_FILE} ]; then
  echo "Cleaning up from previous install failure"
  rm -rf ${TMP_FILE}
fi

echo "Fetching latest version ..."

latest=$(curl https://parsecli.back4app.com/supported?version=latest | python -c "import sys, json; print(json.load(sys.stdin)['version'])")

case `uname -m` in
  "x86_64" )
      url="https://github.com/back4app/parse-cli/releases/download/release_${latest}/b4a_linux";;
  "i386" )
      url="https://github.com/back4app/parse-cli/releases/download/release_${latest}/b4a";;
  "arm" )
      url="https://github.com/back4app/parse-cli/releases/download/release_${latest}/b4a_mac_m1";;
esac

echo "Version ${latest} will be installed"

echo "tmp:${TMP_FILE} and url:{$url}"

echo "curl --progress-bar --compressed -Lo ${TMP_FILE} ${url}"

curl --progress-bar --compressed -Lo ${TMP_FILE} ${url}

if [ ! -d /usr/local/bin ]; then
  echo "Making /usr/local/bin"
  mkdir -p /usr/local/bin
fi

echo "Installing ..."
mv /tmp/back4app.tmp /usr/local/bin/b4a
chmod 755 /usr/local/bin/b4a

echo "Installation finished"