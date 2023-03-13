#!/bin/sh
# Run sudo chmod 755 restart_pub_get.sh before use.

echo "Flutter Pub get Recursive (by jeroen-meijer on GitHub Gist)"
echo "Looking for projects... (may take a while)"

# shellcheck disable=SC2016
find .. -name "pubspec.yaml" -exec $SHELL -c '
    echo "Start pub get all projects."
    for i in "$@" ; do
        DIR=$(dirname "${i}")
        echo "pub get ${DIR}..."
        (cd "$DIR" && flutter pub get >/dev/null 2>&1)
    done
    echo "DONE!"
' {} +
